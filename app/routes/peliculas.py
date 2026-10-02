from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from app.database import get_db
from app.models.pelicula import Pelicula
from app.schemas.pelicula import (
    PeliculaCreate,
    PeliculaUpdate,
    PeliculaResponse
)

router = APIRouter(
    prefix="/peliculas",
    tags=["Películas"]
)


# GET - Obtener todas
@router.get("/", response_model=list[PeliculaResponse])
def obtener_peliculas(db: Session = Depends(get_db)):

    peliculas = db.query(Pelicula).all()

    return peliculas


# GET - Obtener una
@router.get("/{pelicula_id}", response_model=PeliculaResponse)
def obtener_pelicula(
    pelicula_id: int,
    db: Session = Depends(get_db)
):

    pelicula = db.query(Pelicula).filter(
        Pelicula.id == pelicula_id
    ).first()

    if not pelicula:
        raise HTTPException(
            status_code=404,
            detail="Película no encontrada"
        )

    return pelicula


# POST - Crear
@router.post("/", response_model=PeliculaResponse)
def crear_pelicula(
    pelicula: PeliculaCreate,
    db: Session = Depends(get_db)
):

    nueva_pelicula = Pelicula(
        **pelicula.model_dump()
    )

    db.add(nueva_pelicula)
    db.commit()
    db.refresh(nueva_pelicula)

    return nueva_pelicula


# PUT - Actualizar
@router.put("/{pelicula_id}", response_model=PeliculaResponse)
def actualizar_pelicula(
    pelicula_id: int,
    datos: PeliculaUpdate,
    db: Session = Depends(get_db)
):

    pelicula = db.query(Pelicula).filter(
        Pelicula.id == pelicula_id
    ).first()

    if not pelicula:
        raise HTTPException(
            status_code=404,
            detail="Película no encontrada"
        )

    for campo, valor in datos.model_dump().items():
        setattr(pelicula, campo, valor)

    db.commit()
    db.refresh(pelicula)

    return pelicula


# DELETE - Eliminar
@router.delete("/{pelicula_id}")
def eliminar_pelicula(
    pelicula_id: int,
    db: Session = Depends(get_db)
):

    pelicula = db.query(Pelicula).filter(
        Pelicula.id == pelicula_id
    ).first()

    if not pelicula:
        raise HTTPException(
            status_code=404,
            detail="Película no encontrada"
        )

    db.delete(pelicula)
    db.commit()

    return {
        "mensaje": "Película eliminada correctamente"
    }