# 🚨 APPLIQUE LES FIXES MAINTENANT
Write-Host "========================================" -ForegroundColor Red
Write-Host "  APPLICATION IMMÉDIATE DES FIXES" -ForegroundColor Red
Write-Host "  281$ CAD - AGENT AUTONOME" -ForegroundColor Red
Write-Host "========================================" -ForegroundColor Red

# CHEMIN CONFIG
$configPath = "$env:APPDATA\Claude\claude_desktop_config.json"

# BACKUP
Copy-Item $configPath "$configPath.backup" -Force -ErrorAction SilentlyContinue
Write-Host "[1/5] Backup créé" -ForegroundColor Green

# NOUVELLE CONFIG - FILESYSTEM CORRIGÉ
$config = @"
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem"],
      "env": {
        "FILESYSTEM_ROOT": "C:\\Users\\fvegi"
      }
    },
    "desktop-commander": {
      "command": "cmd.exe",
      "args": ["/c", "node", "C:\\Users\\fvegi\\AppData\\Roaming\\Claude\\Claude Extensions Store\\desktop-commander\\server.js"]
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"]
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    },
    "sequential-thinking-branches": {
      "command": "node",
      "args": ["C:\\Users\\fvegi\\mcp-servers\\sequential-thinking-branches\\index.js"]
    }
  }
}
"@

# ÉCRIRE LA CONFIG
$config | Out-File $configPath -Encoding UTF8 -Force
Write-Host "[2/5] Config autonome appliquée" -ForegroundColor Green

# TUER CLAUDE
Stop-Process -Name "Claude" -Force -ErrorAction SilentlyContinue
Write-Host "[3/5] Claude Desktop fermé" -ForegroundColor Green

Start-Sleep -Seconds 2

# RELANCER CLAUDE
Start-Process "$env:LOCALAPPDATA\Claude\Claude.exe"
Write-Host "[4/5] Claude Desktop relancé" -ForegroundColor Green

# RAPPORT
Write-Host "[5/5] TERMINÉ!" -ForegroundColor Green
Write-Host ""
Write-Host "✅ FIXES APPLIQUÉS:" -ForegroundColor Cyan
Write-Host "  • Filesystem: C:\Users\fvegi (CORRIGÉ)" 
Write-Host "  • Desktop-commander: ACTIVÉ"
Write-Host "  • Mode autonome: CONFIGURÉ"
Write-Host ""
Write-Host "🎯 OUVRE UNE NOUVELLE CONVERSATION MAINTENANT" -ForegroundColor Yellow
