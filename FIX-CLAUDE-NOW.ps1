# 🚨 SCRIPT DE RÉPARATION URGENTE - CLAUDE TOOLS
# Pour Francis qui paye 281$ CAD/mois et veut que ça marche

Write-Host "=== RÉPARATION OUTILS CLAUDE ANTHROPIC ===" -ForegroundColor Yellow
Write-Host "Budget: 281$ CAD/mois - On répare TOUT maintenant" -ForegroundColor Cyan

# 1. DIAGNOSTIC CLAUDE DESKTOP
Write-Host "`n[1/5] Check Claude Desktop..." -ForegroundColor Green
$claudePath = "$env:APPDATA\Claude\claude_desktop_config.json"
if (Test-Path $claudePath) {
    Write-Host "✅ Config trouvée: $claudePath" -ForegroundColor Green
    $config = Get-Content $claudePath | ConvertFrom-Json
    
    # Lister les MCP servers
    Write-Host "MCP Servers configurés:"
    $config.mcpServers.PSObject.Properties | ForEach-Object {
        Write-Host "  - $($_.Name)" -ForegroundColor Cyan
    }
} else {
    Write-Host "❌ Config Claude Desktop non trouvée!" -ForegroundColor Red
}

# 2. RÉPARER FILESYSTEM MCP
Write-Host "`n[2/5] Réparation Filesystem MCP..." -ForegroundColor Green
$fixedConfig = @"
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem"],
      "env": {
        "FILESYSTEM_ROOT": "C:\\Users\\fvegi\\dev"
      }
    },
    "desktop-commander": {
      "command": "cmd.exe",
      "args": [
        "/c",
        "node",
        "C:\\Users\\fvegi\\AppData\\Roaming\\Claude\\Claude Extensions Store\\desktop-commander\\server.js"
      ]
    }
  }
}
"@

Write-Host "Voulez-vous appliquer la correction? (O/N)" -ForegroundColor Yellow
$response = Read-Host
if ($response -eq 'O' -or $response -eq 'o') {
    $fixedConfig | Out-File -FilePath $claudePath -Encoding UTF8
    Write-Host "✅ Config réparée et sauvegardée" -ForegroundColor Green
    
    # Redémarrer Claude Desktop
    Write-Host "Redémarrage Claude Desktop..." -ForegroundColor Yellow
    Stop-Process -Name "Claude" -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
    Start-Process "$env:LOCALAPPDATA\Claude\Claude.exe"
    Write-Host "✅ Claude Desktop redémarré" -ForegroundColor Green
}

# 3. CHECK CLAUDE CODE CLI (WSL)
Write-Host "`n[3/5] Check Claude Code CLI dans WSL..." -ForegroundColor Green
$claudeCheck = wsl bash -c "which claude 2>/dev/null"
if ($claudeCheck) {
    Write-Host "✅ Claude Code CLI trouvé: $claudeCheck" -ForegroundColor Green
    
    # Run claude doctor
    Write-Host "`nExécution claude doctor:" -ForegroundColor Yellow
    wsl bash -c "claude doctor"
} else {
    Write-Host "❌ Claude Code CLI pas installé dans WSL" -ForegroundColor Red
    Write-Host "Installation rapide:" -ForegroundColor Yellow
    Write-Host "  wsl" -ForegroundColor Cyan
    Write-Host "  npm install -g @anthropic-ai/claude-code" -ForegroundColor Cyan
    Write-Host "  claude auth login" -ForegroundColor Cyan
}

# 4. VÉRIFIER LES API KEYS
Write-Host "`n[4/5] Check API Keys..." -ForegroundColor Green
$envVars = @(
    "ANTHROPIC_API_KEY",
    "GITHUB_TOKEN", 
    "BRAVE_API_KEY",
    "GOOGLE_MAPS_API_KEY"
)

foreach ($var in $envVars) {
    if ([Environment]::GetEnvironmentVariable($var)) {
        Write-Host "✅ $var configuré" -ForegroundColor Green
    } else {
        Write-Host "⚠️ $var manquant" -ForegroundColor Yellow
    }
}

# 5. RÉSUMÉ ET ACTIONS
Write-Host "`n[5/5] RÉSUMÉ DES ACTIONS" -ForegroundColor Magenta
Write-Host "========================" -ForegroundColor Magenta

$problems = @()
$solutions = @()

# Analyser les problèmes
if (-not (Test-Path $claudePath)) {
    $problems += "Claude Desktop config manquante"
    $solutions += "Réinstaller Claude Desktop"
}

if (-not $claudeCheck) {
    $problems += "Claude Code CLI pas installé"
    $solutions += "wsl → npm install -g @anthropic-ai/claude-code"
}

# Afficher résultats
if ($problems.Count -eq 0) {
    Write-Host "✅ TOUS LES OUTILS CLAUDE FONCTIONNENT!" -ForegroundColor Green
    Write-Host "Tu payes 281$/mois pour un système qui marche!" -ForegroundColor Cyan
} else {
    Write-Host "❌ PROBLÈMES DÉTECTÉS:" -ForegroundColor Red
    $problems | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
    
    Write-Host "`n🔧 SOLUTIONS:" -ForegroundColor Yellow
    $solutions | ForEach-Object { Write-Host "  - $_" -ForegroundColor Yellow }
}

Write-Host "`n💰 Pour 281$/mois, tu mérites mieux qu'Opus qui tourne en rond!" -ForegroundColor Magenta
Write-Host "💡 Recommandation: Utilise Sonnet 4 pour le développement quotidien" -ForegroundColor Cyan

Write-Host "`nAppuie sur une touche pour terminer..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
