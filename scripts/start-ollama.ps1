# Script PowerShell pour démarrer Ollama sur Windows
# À exécuter côté Windows

# Vérifier si Ollama est installé
if (Get-Command ollama -ErrorAction SilentlyContinue) {
    Write-Host "🚀 Démarrage d'Ollama..." -ForegroundColor Green
    
    # Démarrer Ollama en arrière-plan
    Start-Process ollama -ArgumentList "serve" -WindowStyle Hidden
    
    Start-Sleep -Seconds 3
    
    # Vérifier que le service est actif
    try {
        $response = Invoke-RestMethod -Uri "http://localhost:11434/api/version" -Method Get
        Write-Host "✅ Ollama démarré avec succès!" -ForegroundColor Green
        Write-Host "Version: $($response.version)" -ForegroundColor Cyan
    }
    catch {
        Write-Host "⚠️ Ollama a démarré mais n'est pas encore prêt. Réessayez dans quelques secondes." -ForegroundColor Yellow
    }
}
else {
    Write-Host "❌ Ollama n'est pas installé sur Windows" -ForegroundColor Red
    Write-Host "Téléchargez-le depuis: https://ollama.com/download/windows" -ForegroundColor Yellow
}