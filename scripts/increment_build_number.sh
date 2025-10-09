#!/bin/bash

# Script para incrementar automáticamente el build number
# Uso: ./scripts/increment_build_number.sh

echo "🔄 Incrementando build number..."

# Leer el build number actual del pubspec.yaml
CURRENT_BUILD=$(grep 'version:' pubspec.yaml | awk '{print $2}' | cut -d'+' -f2)
VERSION_NAME=$(grep 'version:' pubspec.yaml | awk '{print $2}' | cut -d'+' -f1)

# Incrementar el build number
NEW_BUILD=$((CURRENT_BUILD + 1))

# Actualizar el pubspec.yaml con el nuevo build number
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i.bak "s/version: .*/version: $VERSION_NAME+$NEW_BUILD/" pubspec.yaml
else
    # Linux
    sed -i "s/version: .*/version: $VERSION_NAME+$NEW_BUILD/" pubspec.yaml
fi

echo "✅ Build number incrementado: $CURRENT_BUILD -> $NEW_BUILD"
echo "📦 Nueva versión: $VERSION_NAME+$NEW_BUILD"

# Exportar la variable para uso en otros scripts
echo "NEW_BUILD_NUMBER=$NEW_BUILD" >> $GITHUB_ENV 2>/dev/null || true
echo "NEW_BUILD_NUMBER=$NEW_BUILD" >> $CM_ENV 2>/dev/null || true

exit 0
