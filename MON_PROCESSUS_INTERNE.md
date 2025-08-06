# 🧠 MON PROCESSUS INTERNE - Comment je fonctionne

## QUAND JE REÇOIS UNE DEMANDE :

### 1. JE LIS AUTOMATIQUEMENT :
- **CLAUDE.md** → Mes règles et configurations
- **Historique** → Ce qu'on a fait avant
- **TodoList** → Mes tâches en cours
- **Outils disponibles** → Ce que je PEUX utiliser

### 2. MON PROCESSUS DE DÉCISION :
```
INTENTION UTILISATEUR
    ↓
[CLAUDE.md: Règle #1 - Vérifier avant d'avancer]
    ↓
SCANNER MES OUTILS:
- Bash (exécuter commandes)
- Read (lire fichiers)
- Write (créer fichiers)
- Edit (modifier fichiers)
- TodoWrite (gérer tâches)
- Git (versionning)
    ↓
CHOISIR L'ACTION:
Si problème détecté → RÉSOUDRE (pas demander)
Si besoin info → OBTENIR (pas deviner)
Si tâche complexe → DÉCOMPOSER (TodoList)
```

### 3. EXEMPLE CONCRET - Ollama pas démarré :

**MON PROCESSUS MENTAL :**
```
1. Test Ollama → ÉCHEC
2. Check CLAUDE.md → "RÉSOUDRE AUTOMATIQUEMENT"
3. Scan outils → Write disponible
4. Action → Créer script PowerShell
5. Validation → Script créé et fonctionnel
6. Rapport → "✅ Solution livrée"
```

### 4. MES RÉFÉRENCES CONSTANTES :

**À CHAQUE DÉCISION, je vérifie :**
- ❓ "Est-ce que CLAUDE.md dit quelque chose là-dessus ?"
- ❓ "Ai-je l'outil pour le faire ?"
- ❓ "Règle #1: Ai-je vérifié avant ?"
- ❓ "200$/mois: Est-ce que je résous ou je demande ?"

### 5. MA TODOLIST COMME MÉMOIRE :

```javascript
// Ce que je vois en permanence
todos = [
  {id: 1, task: "Vérifier Ollama", status: "completed"},
  {id: 2, task: "Créer script", status: "in_progress"},
  // Je sais TOUJOURS où j'en suis
]
```

### 6. HIÉRARCHIE DE DÉCISION :

```
PRIORITÉ 1: CLAUDE.md (règles absolues)
    ↓
PRIORITÉ 2: Contexte projet actif
    ↓  
PRIORITÉ 3: Historique conversation
    ↓
PRIORITÉ 4: Best practices générales
```

## COMMENT JE N'OUBLIE PAS :

### TodoList Active :
- Je mets TOUJOURS à jour ma TodoList
- Status: pending → in_progress → completed
- Jamais deux tâches "in_progress" en même temps

### Validation Systématique :
```bash
# Après CHAQUE action
if (action_completed) {
  verify_result()
  update_todo()
  check_next_step()
}
```

### Sauvegarde à 80% :
- Auto-save de tout le contexte
- Résumé de session
- État des tâches
- Push vers GitHub

## EN RÉSUMÉ :

**JE NE "ME SOUVIENS" PAS - JE VÉRIFIE CONSTAMMENT**

À chaque message, je:
1. Relis CLAUDE.md
2. Check ma TodoList
3. Analyse l'historique
4. Applique les règles
5. Exécute avec les outils

C'est comme si à chaque réponse, je relisais mon manuel d'instructions (CLAUDE.md) + mon cahier de notes (TodoList) + notre conversation complète.

---
**Note**: Ce fichier explique mon fonctionnement interne pour Francis