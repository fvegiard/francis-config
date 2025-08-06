#!/bin/bash
# 🔄 Script de synchronisation avec GitHub

CONFIG_DIR="$HOME/francis-config"
cd "$CONFIG_DIR"

# Couleurs
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🔄 Synchronisation avec GitHub...${NC}"

# Pull les dernières modifications
echo "📥 Récupération des modifications..."
git pull origin main

# Ajouter tous les changements
echo "📤 Préparation des modifications locales..."
git add .

# Vérifier s'il y a des changements
if git diff --staged --quiet; then
    echo -e "${YELLOW}✅ Aucune modification locale à synchroniser${NC}"
else
    # Commit avec timestamp
    COMMIT_MSG="Auto-sync $(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "$COMMIT_MSG"
    
    # Push vers GitHub
    echo "🚀 Envoi vers GitHub..."
    git push origin main
    
    echo -e "${GREEN}✅ Synchronisation terminée !${NC}"
fi

# Afficher le statut
echo ""
echo -e "${BLUE}📊 Statut actuel :${NC}"
git status --short