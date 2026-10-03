from pydantic import BaseModel
from typing import Optional


class PersonajeBase(BaseModel):
    nombre: str
    descripcion: Optional[str] = None
    imagen: Optional[str] = None
    pelicula_id: int


class PersonajeCreate(PersonajeBase):
    pass


class PersonajeUpdate(BaseModel):
    nombre: Optional[str] = None
    descripcion: Optional[str] = None
    imagen: Optional[str] = None
    pelicula_id: Optional[int] = None


class PersonajeResponse(PersonajeBase):
    id: int

    class Config:
        from_attributes = True