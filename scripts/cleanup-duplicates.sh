#!/bin/bash
# 🧹 Script de nettoyage des CLAUDE.md en double

echo "🔍 Recherche des CLAUDE.md en double..."

# Liste des fichiers à vérifier (sauf la config centrale)
DUPLICATES=(
    "/root/dev/pgi-ia/CLAUDE.md"
    "/mnt/c/Users/fvegi/agent-autonome/CLAUDE.md"
    "/mnt/c/Users/fvegi/dev/claude-opus4-config/CLAUDE.md"
    "/mnt/c/Users/fvegi/dev/pgi-ia/CLAUDE.md"
    "/mnt/c/Users/fvegi/dev/pgi-ia/dashboard-3d-project/CLAUDE.md"
    "/mnt/c/Users/fvegi/dev/pgi-ia-frontend/CLAUDE.md"
    "/mnt/c/Users/fvegi/pgi-ai-production/CLAUDE.md"
    "/mnt/c/Users/fvegi/projects/CLAUDE.md"
)

echo "⚠️  Fichiers trouvés :"
for file in "${DUPLICATES[@]}"; do
    if [ -f "$file" ]; then
        echo "  - $file"
    fi
done

echo ""
echo "❓ Voulez-vous :"
echo "  1) Supprimer tous les doublons"
echo "  2) Les remplacer par des liens vers francis-config"
echo "  3) Annuler"
read -p "Choix (1/2/3) : " choice

case $choice in
    1)
        echo "🗑️  Suppression des doublons..."
        for file in "${DUPLICATES[@]}"; do
            if [ -f "$file" ]; then
                rm "$file"
                echo "  ✅ Supprimé : $file"
            fi
        done
        ;;
    2)
        echo "🔗 Création des liens symboliques..."
        for file in "${DUPLICATES[@]}"; do
            if [ -f "$file" ]; then
                rm "$file"
                ln -s ~/francis-config/CLAUDE.md "$file"
                echo "  ✅ Lien créé : $file"
            fi
        done
        ;;
    *)
        echo "❌ Annulé"
        exit 0
        ;;
esac

echo ""
echo "✅ Nettoyage terminé !"
echo "📍 Configuration unique : ~/francis-config/CLAUDE.md"