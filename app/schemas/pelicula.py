from pydantic import BaseModel
from typing import Optional


class PeliculaBase(BaseModel):
    titulo: str
    descripcion: Optional[str] = None
    genero: Optional[str] = None
    anio: Optional[int] = None
    director: Optional[str] = None
    duracion: Optional[int] = None
    imagen: Optional[str] = None
    calificacion: Optional[float] = 0.0


class PeliculaCreate(PeliculaBase):
    pass


class PeliculaUpdate(PeliculaBase):
    pass


class PeliculaResponse(PeliculaBase):
    id: int

    class Config:
        from_attributes = True