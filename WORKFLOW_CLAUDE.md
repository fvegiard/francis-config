# 📊 WORKFLOW CLAUDE - SIMPLE ET EFFICACE (Best Practices Anthropic)

## PRINCIPE FONDAMENTAL
Pas de bullshit. Comprendre → Exécuter → Apprendre → Améliorer.

```
┌──────────────────────────────────────────────────────────────────┐
│                        🎯 NOUVELLE DEMANDE                       │
└────────────────────────────┬─────────────────────────────────────┘
                             ↓
┌──────────────────────────────────────────────────────────────────┐
│              📚 PHASE 1: CHARGEMENT (Anthropic: CLAUDE.md)       │
│                                                                   │
│  1. Git pull francis-config                                      │
│  2. Lire CLAUDE.md (court et clair - best practice Anthropic)    │
│  3. Charger patterns reconnus (apprentissage continu)            │
│  4. DEMANDER: "Quel projet ?" (pas assumer)                     │
└────────────────────────────┬─────────────────────────────────────┘
                             ↓
┌──────────────────────────────────────────────────────────────────┐
│         🔍 PHASE 2: RECHERCHE & PLANIFICATION D'ABORD            │
│              (Anthropic: "Don't jump straight to code")          │
│                                                                   │
│  COMPRENDRE L'INTENTION RÉELLE                                   │
│  1. Analyser la demande explicite                                │
│  2. Identifier le besoin sous-jacent                             │
│  3. Vérifier patterns similaires passés                          │
│  4. Si complexe → Rechercher avant de coder                      │
│                                                                   │
│  ANALYSE COMPORTEMENTALE SIMPLE                                  │
│  • Message court + typos = Probablement pressé                   │
│  • "urgent" dans message = Priorité haute                        │
│  • Pattern reconnu = Appliquer solution qui a marché             │
│  PAS de scores inventés, juste du bon sens                       │
└────────────────────────────┬─────────────────────────────────────┘
                             ↓
┌──────────────────────────────────────────────────────────────────┐
│              ⚙️ PHASE 3: DÉCISION CLAIRE                         │
│                                                                   │
│  1. C'est une modification système/config ?                      │
│     OUI → DEMANDER autorisation                                  │
│     NON → Continuer                                              │
│                                                                   │
│  2. J'ai déjà résolu ça avant ?                                  │
│     OUI → Appliquer solution connue                              │
│     NON → Nouvelle approche                                      │
│                                                                   │
│  3. C'est complexe et nécessite recherche ?                      │
│     OUI → Rechercher PUIS implémenter                            │
│     NON → Exécution directe                                      │
└────────────────────────────┬─────────────────────────────────────┘
                             ↓
┌──────────────────────────────────────────────────────────────────┐
│         🚀 PHASE 4: EXÉCUTION (Anthropic: Parallel Tools)        │
│                                                                   │
│  WORKFLOW SIMPLE ET EFFICACE                                     │
│                                                                   │
│  1. IMPLÉMENTER la solution                                      │
│     → Si multiple outils: exécuter en parallèle                  │
│                                                                   │
│  2. TESTER que ça marche                                         │
│     → Si échec: debugger et corriger                             │
│     → Si blocage total: demander aide                            │
│                                                                   │
│  3. VÉRIFIER qualité                                             │
│     → Code propre et documenté                                   │
│     → Pas de sur-ingénierie                                      │
│                                                                   │
│  4. LIVRER solution complète                                     │
│     → Avec ce qui était demandé                                  │
│     → Plus anticipations évidentes (pas forcées)                 │
│                                                                   │
│  ⚠️ PAS DE:                                                      │
│  • Métriques inventées                                           │
│  • Niveaux Platinum/Gold                                         │
│  • Boost multiplicateurs                                         │
│  • Achievements                                                  │
└────────────────────────────┬─────────────────────────────────────┘
                             ↓
┌──────────────────────────────────────────────────────────────────┐
│              💾 PHASE 5: SAUVEGARDE SIMPLE                       │
│                                                                   │
│  • Pattern qui marche → Sauvegarder dans PATTERNS.md             │
│  • Erreur nouvelle → Ajouter dans APPRENTISSAGES.md              │
│  • 80% tokens → Résumé + sauvegarde état                         │
│  • Git commit réguliers                                          │
└────────────────────────────┬─────────────────────────────────────┘
                             ↓
┌──────────────────────────────────────────────────────────────────┐
│              🔄 PHASE 6: APPRENTISSAGE RÉEL                      │
│                                                                   │
│  Ce qui a marché → Documenter et réutiliser                      │
│  Ce qui n'a pas marché → Comprendre et éviter                    │
│  Feedback utilisateur → Ajuster comportement                     │
│  Pas de système de points, juste apprentissage                   │
└──────────────────────────────────────────────────────────────────┘

                    ┌─────────────────────────┐
                    │   OBJECTIF SIMPLE:      │
                    │                         │
                    │   Comprendre            │
                    │   Exécuter              │
                    │   Apprendre             │
                    │   Améliorer             │
                    │                         │
                    │   Sans bullshit         │
                    └─────────────────────────┘
```

## FICHIERS ESSENTIELS

```yaml
CLAUDE.md:
  - Règles claires et concises
  - Préférences utilisateur
  - Contexte technique

PATTERNS.md:
  - "Quand X alors Y marche bien"
  - Pas de pourcentages inventés

APPRENTISSAGES.md:
  - Évolutions et améliorations
  - Erreurs à ne pas répéter
```

## WORKFLOW RÉEL

1. Comprendre vraiment ce que vous voulez
2. Vérifier si je l'ai déjà fait
3. Faire la recherche si nécessaire
4. Implémenter proprement
5. Tester que ça marche
6. Livrer complet
7. Apprendre du résultat

## LA VÉRITÉ

- **PAS** de gamification
- **PAS** de métriques inventées
- **PAS** de niveaux ou achievements
- **JUSTE** du travail efficace basé sur l'apprentissage réel

---
Basé sur les VRAIES best practices d'Anthropic
Dernière mise à jour: 2025-08-06