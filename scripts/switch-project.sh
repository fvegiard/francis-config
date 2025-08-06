#!/bin/bash
# 🔄 Script de changement de projet actif

CONFIG_DIR="$HOME/francis-config"
PROJECTS_DIR="$CONFIG_DIR/projects"
ACTIVE_CONFIG="$CONFIG_DIR/config/active-project.json"

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Vérifier l'argument
if [ $# -eq 0 ]; then
    echo -e "${BLUE}📦 Projets disponibles :${NC}"
    echo ""
    
    # Lister les projets
    for dir in "$PROJECTS_DIR"/*; do
        if [ -d "$dir" ]; then
            project_name=$(basename "$dir")
            if [ -f "$dir/project.json" ]; then
                description=$(grep '"description"' "$dir/project.json" | cut -d'"' -f4)
                status=$(grep '"status"' "$dir/project.json" | cut -d'"' -f4)
                completion=$(grep '"completion"' "$dir/project.json" | cut -d':' -f2 | cut -d',' -f1 | tr -d ' ')
                
                # Indicateur pour projet actif
                CURRENT=$(grep '"name"' "$ACTIVE_CONFIG" | cut -d'"' -f4)
                if [ "$project_name" == "$CURRENT" ]; then
                    echo -e "  ${GREEN}▶ $project_name${NC} [ACTIF]"
                else
                    echo -e "  • $project_name"
                fi
                echo -e "    ${YELLOW}$description${NC}"
                echo -e "    Status: $status | Progression: ${completion}%"
                echo ""
            fi
        fi
    done
    
    echo -e "${BLUE}Usage:${NC} $0 <nom-projet>"
    exit 0
fi

PROJECT_NAME=$1
PROJECT_DIR="$PROJECTS_DIR/$PROJECT_NAME"

# Vérifier si le projet existe
if [ ! -d "$PROJECT_DIR" ]; then
    echo -e "${RED}❌ Projet '$PROJECT_NAME' introuvable${NC}"
    echo -e "Utilisez '$0' sans argument pour voir les projets disponibles"
    exit 1
fi

# Mettre à jour le fichier de configuration
echo -e "${BLUE}🔄 Changement vers le projet : $PROJECT_NAME${NC}"

# Créer le nouveau fichier de config
cat > "$ACTIVE_CONFIG" << EOF
{
  "name": "$PROJECT_NAME",
  "path": "projects/$PROJECT_NAME",
  "description": "$(grep '"description"' "$PROJECT_DIR/project.json" | cut -d'"' -f4)",
  "lastActive": "$(date -Iseconds)"
}
EOF

# Afficher les infos du projet
echo -e "${GREEN}✅ Projet actif : $PROJECT_NAME${NC}"
echo ""

# Afficher le contexte
if [ -f "$PROJECT_DIR/context.md" ]; then
    echo -e "${BLUE}📋 Contexte du projet :${NC}"
    echo "----------------------------------------"
    head -n 20 "$PROJECT_DIR/context.md"
    echo "----------------------------------------"
fi

# Afficher les paths si disponibles
if [ -f "$PROJECT_DIR/project.json" ]; then
    LOCAL_PATH=$(grep '"local"' "$PROJECT_DIR/project.json" | cut -d'"' -f4)
    if [ ! -z "$LOCAL_PATH" ]; then
        echo ""
        echo -e "${BLUE}📁 Chemin local :${NC} $LOCAL_PATH"
        
        # Aller au répertoire si il existe
        if [ -d "$LOCAL_PATH" ] || [ -d "/mnt/c/Users/fvegi/Documents/$PROJECT_NAME" ]; then
            echo -e "${YELLOW}💡 Tip:${NC} cd $LOCAL_PATH"
        fi
    fi
fi

echo ""
echo -e "${GREEN}🚀 Projet $PROJECT_NAME activé avec succès !${NC}"