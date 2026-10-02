from sqlalchemy import Column, Integer, String, Text, DECIMAL, DateTime
from sqlalchemy.sql import func
from app.database import Base


class Pelicula(Base):
    __tablename__ = "peliculas"

    id = Column(Integer, primary_key=True, index=True)
    titulo = Column(String(150), nullable=False)
    descripcion = Column(Text)
    genero = Column(String(100))
    anio = Column(Integer)
    director = Column(String(150))
    duracion = Column(Integer)
    imagen = Column(String(500))
    calificacion = Column(DECIMAL(3, 1), default=0.0)
    fecha_creacion = Column(
        DateTime,
        server_default=func.now()
    )