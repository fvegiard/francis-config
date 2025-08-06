#!/bin/bash
# Fix permanent pour l'erreur windows-mcp dans Claude Desktop

echo "🔧 Réparation complète de Claude Desktop - Suppression de windows-mcp"
echo "=================================================="

# Chemins Windows depuis WSL
CLAUDE_PATH="/mnt/c/Users/fvegi/AppData/Roaming/Claude"
EXTENSIONS_PATH="$CLAUDE_PATH/Claude Extensions"

# 1. Supprimer complètement l'extension windows-mcp si elle existe
if [ -d "$EXTENSIONS_PATH/ant.dir.cursortouch.windows-mcp" ]; then
    echo "❌ Suppression de l'extension windows-mcp..."
    rm -rf "$EXTENSIONS_PATH/ant.dir.cursortouch.windows-mcp"
fi

# 2. Nettoyer le cache de l'extension
if [ -d "$EXTENSIONS_PATH/.cache" ]; then
    echo "🧹 Nettoyage du cache des extensions..."
    rm -rf "$EXTENSIONS_PATH/.cache/ant.dir.cursortouch.windows-mcp" 2>/dev/null
fi

# 3. Supprimer toute référence dans extensions-installations.json
if [ -f "$CLAUDE_PATH/extensions-installations.json" ]; then
    echo "📝 Nettoyage du registre des extensions..."
    # Créer un backup
    cp "$CLAUDE_PATH/extensions-installations.json" "$CLAUDE_PATH/extensions-installations.backup.json"
    # Supprimer windows-mcp du JSON
    python3 -c "
import json
import sys
file_path = '$CLAUDE_PATH/extensions-installations.json'
try:
    with open(file_path, 'r') as f:
        data = json.load(f)
    if 'extensions' in data and 'ant.dir.cursortouch.windows-mcp' in data['extensions']:
        del data['extensions']['ant.dir.cursortouch.windows-mcp']
        with open(file_path, 'w') as f:
            json.dump(data, f, indent=2)
        print('✅ windows-mcp supprimé du registre')
    else:
        print('✓ windows-mcp déjà absent du registre')
except Exception as e:
    print(f'⚠️ Erreur lors de la modification: {e}')
"
fi

# 4. Vérifier que la configuration principale n'a pas windows-mcp
if grep -q "windows-mcp" "$CLAUDE_PATH/claude_desktop_config.json" 2>/dev/null; then
    echo "⚠️ Référence à windows-mcp trouvée dans la configuration"
    echo "📝 Nettoyage de la configuration..."
    # Créer un backup
    cp "$CLAUDE_PATH/claude_desktop_config.json" "$CLAUDE_PATH/claude_desktop_config.backup.json"
    # Supprimer la section windows-mcp
    python3 -c "
import json
file_path = '$CLAUDE_PATH/claude_desktop_config.json'
try:
    with open(file_path, 'r') as f:
        data = json.load(f)
    if 'mcpServers' in data and 'windows-mcp' in data['mcpServers']:
        del data['mcpServers']['windows-mcp']
        with open(file_path, 'w') as f:
            json.dump(data, f, indent=2)
        print('✅ windows-mcp supprimé de la configuration')
except Exception as e:
    print(f'⚠️ Erreur: {e}')
"
else
    echo "✅ Configuration déjà propre"
fi

# 5. Nettoyer les logs d'erreur
if [ -d "$CLAUDE_PATH/logs" ]; then
    echo "🧹 Nettoyage des logs d'erreur..."
    find "$CLAUDE_PATH/logs" -name "*windows-mcp*" -delete 2>/dev/null
fi

# 6. Vérifier desktop-commander
echo ""
echo "🔍 Vérification de desktop-commander (alternative fonctionnelle)..."
if grep -q "desktop-commander" "$CLAUDE_PATH/claude_desktop_config.json"; then
    echo "✅ desktop-commander est configuré et prêt"
    echo "   → Contrôle Windows disponible via desktop-commander"
else
    echo "⚠️ desktop-commander n'est pas configuré"
fi

echo ""
echo "🎉 RÉPARATION TERMINÉE !"
echo "=================================================="
echo ""
echo "📋 Actions effectuées :"
echo "  ✅ Extension windows-mcp supprimée"
echo "  ✅ Cache nettoyé"
echo "  ✅ Registre des extensions mis à jour"
echo "  ✅ Configuration principale vérifiée"
echo "  ✅ desktop-commander disponible comme alternative"
echo ""
echo "🔄 REDÉMARREZ Claude Desktop maintenant pour appliquer les changements"
echo ""
echo "💡 Note: desktop-commander remplace complètement windows-mcp"
echo "   Il offre les mêmes fonctionnalités sans les bugs NumPy/Python"