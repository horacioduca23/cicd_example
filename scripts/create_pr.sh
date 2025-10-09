#!/bin/bash

# Script para crear Pull Request automáticamente
# Uso: ./scripts/create_pr.sh <branch_name> [base_branch]

set -e

BRANCH_NAME=${1:-$CM_BRANCH}
BASE_BRANCH=${2:-"develop"}
REPO_SLUG=${3:-$CM_REPO_SLUG}

if [ -z "$BRANCH_NAME" ]; then
    echo "❌ Error: No se proporcionó nombre de rama"
    echo "Uso: $0 <branch_name> [base_branch] [repo_slug]"
    exit 1
fi

echo "🚀 Creando Pull Request..."
echo "📍 Rama: $BRANCH_NAME"
echo "🎯 Base: $BASE_BRANCH"
echo "📦 Repo: $REPO_SLUG"

# Extraer nombre de la feature de la rama
FEATURE_NAME=${BRANCH_NAME#feature/}

# Crear el PR usando GitHub CLI
gh pr create \
    --repo "$REPO_SLUG" \
    --base "$BASE_BRANCH" \
    --head "$BRANCH_NAME" \
    --title "QA Review: $FEATURE_NAME" \
    --body "🚀 **Build automático generado por Codemagic**

**Rama:** \`$BRANCH_NAME\`
**Feature:** $FEATURE_NAME
**Plataformas:** Android + iOS

Las aplicaciones están disponibles en Firebase App Distribution para testing de QA.

## 📱 Acceso a las builds:
- Android: Verificar en Firebase App Distribution
- iOS: Verificar en Firebase App Distribution

## 🧪 Testing:
- [ ] QA puede descargar e instalar las apps
- [ ] Funcionalidad básica funciona correctamente
- [ ] No hay crashes críticos

---
_Este PR fue creado automáticamente por el workflow de CI/CD_" \
    || echo "⚠️  El PR ya existe o no se pudo crear"

echo "✅ Pull Request creado exitosamente"
