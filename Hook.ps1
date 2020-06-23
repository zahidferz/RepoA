$id=$env:id
$token=$env:token
$stage=$env:stage
$header = @{authorization = "Bearer $token"}
$Body = Get-Content ./slack.json | ConvertFrom-Json
$Body.blocks.text.text = "<https://dev.azure.com/gestionix-boa/gx-sandbox-pipeline/_build/latest?definitionId=$id&branchName=master| $stage>"
$Body = $Body | ConvertTo-Json -Depth 5
Invoke-RestMethod -Uri "https://eleva-inc.slack.com/api/chat.postMessage"  -Method Post -ContentType "application/json" -Headers $header -Body $Body
