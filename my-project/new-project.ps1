param($ProjectName)

if (-not $ProjectName) {
    Write-Host "Usage: .\new-project.ps1 project-name"
    exit 1
}

# Create folder structure
New-Item -ItemType Directory -Path "$ProjectName\src\css","$ProjectName\src\js","$ProjectName\src\images","$ProjectName\docs","$ProjectName\tests" -Force

# Create files
New-Item -ItemType File -Path "$ProjectName\README.md","$ProjectName\src\index.html","$ProjectName\src\css\styles.css","$ProjectName\src\js\main.js" -Force

# Add content to README
Set-Content -Path "$ProjectName\README.md" -Value "# $ProjectName"

# Add basic HTML to index.html
Set-Content -Path "$ProjectName\src\index.html" -Value @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$ProjectName</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <h1>Welcome to $ProjectName</h1>
    <script src="js/main.js"></script>
</body>
</html>
"@

# Add basic CSS
Set-Content -Path "$ProjectName\src\css\styles.css" -Value @"
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
}
"@

# Add basic JS
Set-Content -Path "$ProjectName\src\js\main.js" -Value "console.log('$ProjectName loaded!');"

Write-Host "✅ Project '$ProjectName' created successfully!"
Write-Host ""
Write-Host "📁 Structure created:"
Write-Host "   $ProjectName/"
Write-Host "   ├── src/"
Write-Host "   │   ├── css/styles.css"
Write-Host "   │   ├── js/main.js"
Write-Host "   │   ├── images/"
Write-Host "   │   └── index.html"
Write-Host "   ├── docs/"
Write-Host "   ├── tests/"
Write-Host "   └── README.md"