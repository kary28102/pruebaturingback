from sqlalchemy import Column, Integer, String, Text, ForeignKey
from app.database import Base


class Personaje(Base):
    __tablename__ = "personajes"

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(150), nullable=False)
    descripcion = Column(Text)
    imagen = Column(String(500))

    pelicula_id = Column(
        Integer,
        ForeignKey("peliculas.id", ondelete="CASCADE"),
        nullable=False
    )