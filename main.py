import os

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from starlette.middleware.base import BaseHTTPMiddleware
from starlette.requests import Request
from starlette.responses import Response

from app.database import Base, engine
from app.models import Usuario, Pelicula, Personaje

from app.routes import auth, personajes, peliculas, usuarios


Base.metadata.create_all(bind=engine)


app = FastAPI(
    title="API de Películas",
    description="API para administrar películas y usuarios",
    version="1.0.0"
)

cors_origins = [
    origin.strip()
    for origin in os.getenv(
        "CORS_ORIGINS",
        "http://localhost:3000,http://localhost:5173",
    ).split(",")
    if origin.strip()
]


app.add_middleware(
    CORSMiddleware,
    allow_origins=cors_origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class SecurityHeadersMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next) -> Response:
        response = await call_next(request)
        response.headers.setdefault("X-Content-Type-Options", "nosniff")
        response.headers.setdefault("X-Frame-Options", "DENY")
        response.headers.setdefault("Referrer-Policy", "no-referrer")
        response.headers.setdefault(
            "Content-Security-Policy",
            "default-src 'none'; frame-ancestors 'none'",
        )
        return response


app.add_middleware(SecurityHeadersMiddleware)


app.include_router(peliculas.router)
app.include_router(personajes.router)
app.include_router(auth.router)
app.include_router(usuarios.router)


@app.get("/")
def inicio():
    return {
        "mensaje": "API de películas funcionando"
    }