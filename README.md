# 🧠 Francis Config - Configuration Centralisée Multi-Projets

Configuration maître pour Claude Opus 4.1 et gestion multi-projets.

## 🚀 Installation Automatique

```bash
# Clone et configure automatiquement
git clone https://github.com/fvegiard/francis-config.git ~/francis-config
cd ~/francis-config && ./setup.sh
```

## 📦 Structure

```
francis-config/
├── CLAUDE.md              # Configuration Claude Opus 4.1
├── APPRENTISSAGES.md      # Mes erreurs et leçons apprises
├── config/
│   ├── active-project.json  # Projet actuellement actif
│   ├── api-keys.json        # Clés API centralisées
│   └── system.json          # Configuration système
├── projects/
│   ├── pgi-ai/              # Config projet PGI-AI
│   │   ├── project.json
│   │   └── context.md
│   ├── agent-autonome/      # Config Agent Autonome
│   └── [nouveau-projet]/    # Vos projets
├── scripts/
│   ├── setup.sh             # Installation initiale
│   ├── switch-project.sh    # Changer de projet
│   └── sync.sh              # Synchroniser avec GitHub
└── templates/               # Templates de projets
```

## 🎯 Utilisation

### Sélectionner un Projet
```bash
# Liste les projets disponibles
npm run list-projects

# Changer de projet actif
npm run switch-project pgi-ai
```

### Ajouter un Nouveau Projet
```bash
npm run new-project mon-projet
```

### Synchroniser avec GitHub
```bash
npm run sync  # Pull + Push automatique
```

## 🔧 Configuration Projet

Chaque projet contient :
- `project.json` : Métadonnées et configuration
- `context.md` : Contexte spécifique du projet
- `secrets.json` : Variables d'environnement (ignoré par git)

## 🤖 Intégration Claude

À chaque connexion Claude :
1. Clone automatiquement cette config
2. Charge le projet actif
3. Applique le contexte spécifique

## 📊 Projets Disponibles

| Projet | Description | Stack | Status |
|--------|-------------|-------|--------|
| **pgi-ai** | Système gestion projets électriques | FastAPI + React + PostgreSQL | 95% |
| **agent-autonome** | Docker anti-complexité | Container isolé | En cours |
| **[nouveau]** | Votre prochain projet | - | - |

## 🔐 Sécurité

- Les clés API sont dans `config/api-keys.json` (chiffré)
- Les secrets projet dans `projects/*/secrets.json` (ignoré)
- Utilise les variables d'environnement en production

## 📝 Workflow Type

1. **Connexion Claude** → Auto-load config
2. **Sélection projet** → `switch-project [nom]`
3. **Travail** → Claude a tout le contexte
4. **Fin session** → Auto-sync GitHub

---
**Maintenu par** : Francis Végiard  
**Claude Version** : Opus 4.1