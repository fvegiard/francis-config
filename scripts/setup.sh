#!/bin/bash
# 🚀 Script d'installation et configuration initiale

echo "🧠 Francis Config - Installation..."

# Variables
CONFIG_DIR="$HOME/francis-config"
CURRENT_DIR=$(pwd)

# Vérifier si déjà installé
if [ -d "$CONFIG_DIR" ]; then
    echo "📦 Configuration déjà présente, mise à jour..."
    cd "$CONFIG_DIR"
    git pull origin main
else
    echo "📥 Clonage de la configuration..."
    git clone https://github.com/fvegiard/francis-config.git "$CONFIG_DIR"
    cd "$CONFIG_DIR"
fi

# Créer les liens symboliques vers la config
echo "🔗 Création des liens symboliques..."
ln -sf "$CONFIG_DIR/CLAUDE.md" "$HOME/CLAUDE.md"
ln -sf "$CONFIG_DIR/CLAUDE.md" "/mnt/c/Users/fvegi/CLAUDE.md"

# Installer les dépendances npm
echo "📚 Installation des dépendances..."
npm init -y > /dev/null 2>&1
npm install --save-dev chalk commander inquirer > /dev/null 2>&1

# Créer les alias utiles
echo "⚡ Configuration des alias..."
cat >> ~/.bashrc << 'EOF'

# Francis Config Aliases
alias claude-config='cd ~/francis-config'
alias switch-project='~/francis-config/scripts/switch-project.sh'
alias sync-config='cd ~/francis-config && git pull && git add . && git commit -m "Auto-sync $(date +%Y-%m-%d)" && git push'
alias project-status='cat ~/francis-config/config/active-project.json | jq .'
EOF

# Charger le projet actif
echo "🎯 Chargement du projet actif..."
ACTIVE_PROJECT=$(cat "$CONFIG_DIR/config/active-project.json" | grep '"name"' | cut -d'"' -f4)
echo "✅ Projet actif : $ACTIVE_PROJECT"

# Afficher le contexte du projet
if [ -f "$CONFIG_DIR/projects/$ACTIVE_PROJECT/context.md" ]; then
    echo ""
    echo "📋 Contexte du projet :"
    echo "----------------------------------------"
    head -n 10 "$CONFIG_DIR/projects/$ACTIVE_PROJECT/context.md"
    echo "----------------------------------------"
fi

echo ""
echo "✅ Installation terminée !"
echo ""
echo "📝 Commandes disponibles :"
echo "  • switch-project      : Changer de projet"
echo "  • sync-config        : Synchroniser avec GitHub"
echo "  • project-status     : Voir le projet actif"
echo "  • claude-config      : Aller au dossier config"
echo ""
echo "🚀 Pour commencer : source ~/.bashrc"