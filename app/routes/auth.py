from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from app.auth import (
    create_access_token,
    hash_password,
    is_password_hash,
    verify_password,
)
from app.database import get_db
from app.models.usuario import Usuario
from app.schemas.usuario import (
    LoginRequest,
    TokenResponse,
    UsuarioCreate,
    UsuarioResponse,
)


router = APIRouter(prefix="/auth", tags=["Autenticación"])


@router.post(
    "/registro",
    response_model=UsuarioResponse,
    status_code=status.HTTP_201_CREATED,
)
def registrar_usuario(
    datos: UsuarioCreate,
    db: Session = Depends(get_db),
):
    if db.query(Usuario).filter(Usuario.email == datos.email).first():
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT,
            detail="El correo ya está registrado",
        )

    usuario = Usuario(
        nombre=datos.nombre,
        email=datos.email,
        password=hash_password(datos.password),
        rol="user",
    )
    db.add(usuario)
    db.commit()
    db.refresh(usuario)
    return usuario


@router.post("/login", response_model=TokenResponse)
def iniciar_sesion(
    datos: LoginRequest,
    db: Session = Depends(get_db),
):
    usuario = db.query(Usuario).filter(Usuario.email == datos.email).first()
    if not usuario or not verify_password(datos.password, usuario.password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Correo o contraseña incorrectos",
            headers={"WWW-Authenticate": "Bearer"},
        )

    if not is_password_hash(usuario.password):
        usuario.password = hash_password(datos.password)
        db.commit()
        db.refresh(usuario)

    return TokenResponse(
        access_token=create_access_token(usuario),
        usuario=usuario,
    )
