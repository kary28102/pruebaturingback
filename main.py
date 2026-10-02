from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.database import Base, engine
from app.models import Usuario, Pelicula, Personaje

from app.routes import personajes, peliculas


Base.metadata.create_all(bind=engine)


app = FastAPI(
    title="API de Películas",
    description="API para administrar películas y usuarios",
    version="1.0.0"
)


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(peliculas.router)
app.include_router(personajes.router)


@app.get("/")
def inicio():
    return {
        "mensaje": "API de películas funcionando"
    }