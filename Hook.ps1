write-output $id
write-output $token
$header = @{authorization = "Bearer $token"}
$Body = Get-Content ./slack.json | ConvertFrom-Json
$Body.blocks.text.text = "<https://dev.azure.com/gestionix-boa/gx-sandbox-pipeline/latest?definitionId=208&branchName=develop| Stage>"
$Body = $Body | ConvertTo-Json -Depth 5
Invoke-RestMethod -Uri "https://eleva-inc.slack.com/api/chat.postMessage"  -Method Post -ContentType "application/json" -Headers $header -Body $Body
