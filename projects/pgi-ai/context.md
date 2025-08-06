# Contexte Projet PGI-AI

## Vue d'Ensemble
Système complet de gestion pour entreprises d'électricité. Gère projets, devis, planning, stocks avec reconnaissance IA du matériel électrique via photos.

## Architecture
```
pgi-ai/
├── backend/           # FastAPI + PostgreSQL
│   ├── api/          # Endpoints REST
│   ├── models/       # SQLAlchemy ORM
│   ├── services/     # Logique métier
│   └── ai/           # Module reconnaissance IA
├── frontend/         # React + TypeScript
│   ├── components/   # Composants réutilisables
│   ├── pages/        # Vues principales
│   └── stores/       # State management
└── docker/           # Containerisation
```

## Points Critiques
- **Performance** : Optimisé pour 1000+ utilisateurs simultanés
- **Sécurité** : JWT + rate limiting + audit logs
- **IA** : Modèle entraîné sur 50k+ images matériel électrique
- **Backup** : Sauvegarde automatique PostgreSQL toutes les 6h

## Commandes Fréquentes
```bash
# Développement
cd /mnt/c/Users/fvegi/Documents/PGI-AI
docker-compose up -d
npm run dev          # Frontend
uvicorn main:app --reload  # Backend

# Production
docker-compose -f docker-compose.prod.yml up -d

# Tests
pytest backend/tests/
npm test
```

## Credentials Dev
- PostgreSQL : pgi_user / pgi_dev_2024
- Admin : admin@pgi.local / Admin123!
- API Key Dev : sk_dev_xyz789

## TODO Prioritaires
1. Finaliser module facturation
2. Optimiser requêtes N+1 dans /api/projects
3. Ajouter cache Redis pour dashboard
4. Migration données ancien système