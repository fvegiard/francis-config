# Contexte Agent Autonome

## Mission
Créer un système d'orchestration multi-agents où Claude Opus 4.1 délègue intelligemment aux agents spécialisés.

## Architecture Multi-Agents
```
Claude Opus 4.1 (Orchestrateur)
    ├── Analyse intention utilisateur
    ├── Décomposition en sous-tâches
    ├── Délégation aux agents
    └── Intégration résultats

Agents Spécialisés (Ollama)
    ├── Dolphin-Mixtral → Créativité
    ├── Dolphin3-R1 → Logique
    └── DeepSeek-Coder → Code
```

## Workflow Type
1. User : "Créer une app de gestion de tâches"
2. Claude : Analyse et décompose
3. Délégation :
   - DeepSeek : Architecture code
   - Dolphin3 : Logique métier
   - Mixtral : UI/UX créative
4. Claude : Intègre et livre solution complète

## Configuration Ollama
```bash
# Installation modèles
ollama pull dolphin-mixtral:24b
ollama pull dolphin3-r1:13b
ollama pull deepseek-coder:8b

# API disponible sur
http://localhost:11434/api/generate
```

## Métriques Cibles
- Temps réponse < 5s pour tâches simples
- Parallélisation jusqu'à 3 agents
- Mémoire max : 30GB (RAM + VRAM)
- Zéro intervention utilisateur

## État Actuel
- [x] Architecture définie
- [x] Modèles installés
- [x] API Ollama fonctionnelle
- [ ] Système d'orchestration
- [ ] Interface utilisateur
- [ ] Tests d'intégration