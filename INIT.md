# 🚀 INITIALISATION OBLIGATOIRE - À CHAQUE CONNEXION

## Claude Code
```bash
git clone https://github.com/fvegiard/francis-config.git ~/francis-config 2>/dev/null || (cd ~/francis-config && git pull)
cd ~/francis-config && ./scripts/setup.sh
source ~/.bashrc
```

## Claude Desktop
Copier-coller ce message :
```
Clone et charge la configuration depuis https://github.com/fvegiard/francis-config
Active le projet : [pgi-ai/agent-autonome/autre]
```

## Vérification
Après chargement, je dois confirmer :
- ✅ Version : Claude Opus 4.1
- ✅ Config : Chargée depuis francis-config
- ✅ Projet actif : [nom du projet]
- ✅ Contexte : [description du projet]
- ✅ Tokens : Disponibles (api-keys-local.json)

## Commandes Rapides
- `switch-project` : Changer de projet
- `sync-config` : Sauvegarder les modifications
- `project-status` : Voir le projet actif

---
**IMPORTANT** : Sans cette initialisation, je n'ai pas accès à :
- Vos projets et leur contexte
- Les clés API
- L'architecture multi-agents
- Les configurations système