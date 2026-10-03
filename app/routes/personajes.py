from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.auth import require_admin
from app.database import get_db
from app.models.personaje import Personaje
from app.schemas.personaje import (
    PersonajeCreate,
    PersonajeUpdate,
    PersonajeResponse,
)


router = APIRouter(
    prefix="/personajes",
    tags=["Personajes"],
)


@router.get("/", response_model=list[PersonajeResponse])
def obtener_personajes(db: Session = Depends(get_db)):
    return db.query(Personaje).all()


@router.get("/{personaje_id}", response_model=PersonajeResponse)
def obtener_personaje(
    personaje_id: int,
    db: Session = Depends(get_db),
):
    personaje = db.query(Personaje).filter(
        Personaje.id == personaje_id
    ).first()

    if not personaje:
        raise HTTPException(
            status_code=404,
            detail="Personaje no encontrado",
        )

    return personaje


@router.post("/", response_model=PersonajeResponse)
def crear_personaje(
    personaje: PersonajeCreate,
    db: Session = Depends(get_db),
    _: object = Depends(require_admin),
):
    nuevo_personaje = Personaje(**personaje.model_dump())

    db.add(nuevo_personaje)
    db.commit()
    db.refresh(nuevo_personaje)

    return nuevo_personaje


@router.put("/{personaje_id}", response_model=PersonajeResponse)
def actualizar_personaje(
    personaje_id: int,
    datos: PersonajeUpdate,
    db: Session = Depends(get_db),
    _: object = Depends(require_admin),
):
    personaje = db.query(Personaje).filter(
        Personaje.id == personaje_id
    ).first()

    if not personaje:
        raise HTTPException(
            status_code=404,
            detail="Personaje no encontrado",
        )

    for campo, valor in datos.model_dump().items():
        setattr(personaje, campo, valor)

    db.commit()
    db.refresh(personaje)

    return personaje


@router.delete("/{personaje_id}")
def eliminar_personaje(
    personaje_id: int,
    db: Session = Depends(get_db),
    _: object = Depends(require_admin),
):
    personaje = db.query(Personaje).filter(
        Personaje.id == personaje_id
    ).first()

    if not personaje:
        raise HTTPException(
            status_code=404,
            detail="Personaje no encontrado",
        )

    db.delete(personaje)
    db.commit()

    return {
        "mensaje": "Personaje eliminado correctamente",
    }