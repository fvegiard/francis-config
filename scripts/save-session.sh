#!/bin/bash
# 💾 Script de sauvegarde automatique de session (80% tokens)

CONFIG_DIR="$HOME/francis-config"
SESSIONS_DIR="$CONFIG_DIR/sessions"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
SESSION_FILE="$SESSIONS_DIR/session_$DATE.md"

# Créer le dossier sessions si nécessaire
mkdir -p "$SESSIONS_DIR"

# Récupérer le projet actif
ACTIVE_PROJECT=$(cat "$CONFIG_DIR/config/active-project.json" | grep '"name"' | cut -d'"' -f4)

# Créer le fichier de session
cat > "$SESSION_FILE" << EOF
# Session du $DATE

## Projet actif : $ACTIVE_PROJECT

## Résumé de la session
[À remplir par Claude]

## ✅ Tâches complétées
[Liste des tâches terminées]

## 🔄 En cours
[Tâches en progression]

## 📝 À faire
[Tâches restantes]

## 💡 Notes importantes
[Points critiques à retenir]

## 🔧 Commandes pour reprendre
\`\`\`bash
cd ~/francis-config
git pull
switch-project $ACTIVE_PROJECT
# Continuer avec le contexte ci-dessus
\`\`\`

---
Sauvegarde automatique à 80% des tokens
EOF

# Sauvegarder l'état dans JSON
cat > "$CONFIG_DIR/config/session-state.json" << EOF
{
  "lastSession": "$DATE",
  "project": "$ACTIVE_PROJECT",
  "sessionFile": "sessions/session_$DATE.md",
  "tokensUsed": "80%",
  "status": "paused"
}
EOF

# Commit et push automatique
cd "$CONFIG_DIR"
git add .
git commit -m "Auto-save session at 80% tokens - $DATE"
git push origin main

echo "✅ Session sauvegardée : $SESSION_FILE"
echo "📤 Synchronisé avec GitHub"
echo "💡 Pour reprendre : git pull && cat $SESSION_FILE"