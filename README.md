# CI/CD Example - Flutter

Este proyecto demuestra la implementación de un pipeline CI/CD automatizado para Flutter usando Codemagic y Firebase App Distribution.

## 🚀 Features

- **CI/CD Automatizado**: Builds automáticos en push a ramas `feature/*`
- **Distribución a QA**: Apps disponibles automáticamente en Firebase App Distribution
- **Pull Requests**: Creación automática de PRs en GitHub
- **Versionado**: Incremento automático del build number

## 🔄 Workflow

Cuando un desarrollador hace push a una rama `feature/*`:

1. ✅ Codemagic detecta el cambio
2. 🧪 Ejecuta tests automáticamente
3. 📦 Genera builds para Android e iOS
4. 🔢 Incrementa el build number
5. 📱 Distribuye a Firebase App Distribution
6. 🔀 Crea Pull Request en GitHub
7. 📧 Notifica al equipo de QA

## 📋 Convención de Ramas

- `feature/*` - Activa el pipeline CI/CD
- `develop` - Rama base para PRs
- `main` - Rama de producción

Ejemplo: `feature/545-login`, `feature/user-authentication`

## 🛠️ Configuración

### Prerequisitos
- Cuenta de Codemagic
- Proyecto Firebase configurado
- Token de GitHub con permisos de repo

### Configuración Rápida
1. Conectar repositorio en Codemagic
2. Configurar variables de entorno
3. Subir certificados iOS (si aplica)
4. Crear rama feature y hacer push

Ver [Guía Completa de CI/CD](docs/CICD_GUIDE.md) para detalles.

## 📁 Estructura del Proyecto

```
├── codemagic.yaml          # Configuración del pipeline
├── scripts/                # Scripts auxiliares
│   ├── increment_build_number.sh
│   └── create_pr.sh
├── docs/                   # Documentación
│   └── CICD_GUIDE.md
└── android/               # Configuración Android
    └── app/
        └── build.gradle.kts
```

## 🧪 Testing

Para probar el pipeline:
1. Crear rama: `git checkout -b feature/test-cicd`
2. Hacer un cambio pequeño
3. Push: `git push origin feature/test-cicd`
4. Verificar en Codemagic que se ejecute el build

## 📚 Documentación

- [Guía de CI/CD](docs/CICD_GUIDE.md) - Documentación completa
- [Codemagic Docs](https://docs.codemagic.io/) - Documentación oficial
- [Firebase App Distribution](https://firebase.google.com/docs/app-distribution) - Guía de distribución

## 🤝 Contribución

1. Crear rama feature
2. Hacer cambios
3. Push (se ejecuta CI/CD automáticamente)
4. Crear PR desde la rama feature hacia develop
5. Revisión de código y merge

## 📞 Soporte

Para issues o preguntas sobre el CI/CD:
- Revisar logs en Codemagic
- Consultar la [Guía de CI/CD](docs/CICD_GUIDE.md)
- Contactar al equipo de DevOps
