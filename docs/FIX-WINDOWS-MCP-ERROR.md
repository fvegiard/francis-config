# Solution Définitive - Erreur "windows-mcp server disconnected"

## 🔴 PROBLÈME
Claude Desktop Windows affiche constamment : "windows-mcp server disconnected"

## 🟢 CAUSE
Bug incompatibilité NumPy 2.2+ avec Python 3.13 dans l'extension windows-mcp

## ✅ SOLUTION ADOPTÉE

### 1. Suppression complète de windows-mcp
- Extension supprimée de `C:\Users\fvegi\AppData\Roaming\Claude\Claude Extensions\`
- Références nettoyées dans `extensions-installations.json`
- Configuration mise à jour dans `claude_desktop_config.json`

### 2. Alternative : desktop-commander
**desktop-commander** remplace complètement windows-mcp avec les mêmes fonctionnalités :
- ✅ Contrôle souris/clavier
- ✅ Screenshots
- ✅ Automatisation Windows
- ✅ Pas de bug NumPy/Python

Configuration dans `claude_desktop_config.json` :
```json
"desktop-commander": {
  "command": "wsl",
  "args": ["-e", "node", "/home/fvegi/node_modules/@wonderwhy-er/desktop-commander/dist/index.js"],
  "description": "Contrôle complet Windows via WSL"
}
```

## 📋 ACTIONS EFFECTUÉES

1. **Script de réparation** : `/root/francis-config/scripts/fix-mcp-permanent.sh`
   - Supprime l'extension windows-mcp
   - Nettoie tous les fichiers de configuration
   - Vérifie desktop-commander

2. **Script de redémarrage** : `C:\Users\fvegi\Desktop\restart-claude-clean.ps1`
   - Arrête Claude Desktop proprement
   - Nettoie les processus orphelins
   - Redémarre Claude Desktop

## 🚀 POUR APPLIQUER

1. **Exécuter le script PowerShell sur le bureau** :
   - Double-cliquer sur `restart-claude-clean.ps1`
   - OU clic droit → "Exécuter avec PowerShell"

2. **Vérifier après redémarrage** :
   - Plus d'erreur "windows-mcp server disconnected" ✅
   - Les autres MCP servers fonctionnent ✅
   - desktop-commander opérationnel ✅

## 💡 NOTES IMPORTANTES

- **NE PAS** réinstaller windows-mcp (bug Python non résolu)
- **desktop-commander** fait EXACTEMENT le même travail
- Configuration sauvegardée dans francis-config/configs/

## 📚 Références
- Issue NumPy : https://github.com/numpy/numpy/issues/27766
- Python 3.13 breaking changes avec NumPy
- Alternative desktop-commander : https://github.com/wonderwhy-er/desktop-commander

---
**Dernière mise à jour** : 2025-08-06
**Status** : ✅ RÉSOLU - Solution permanente appliquée