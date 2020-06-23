write-output $id
$header = @{authorization = "Bearer $token"}
$Body = Get-Content $(System.DefaultWorkingDirectory)/slack.json | ConvertFrom-Json
$Body.blocks.text.text = <https://dev.azure.com/gestionix-boa/gx-sandbox-pipeline/latest?definitionId=208&branchName=develop|this is a link>
$Body3 = $Body | ConvertTo-Json -Depth 5
Invoke-RestMethod -Uri "https://eleva-inc.slack.com/api/chat.postMessage"  -Method Post -ContentType "application/json" -Headers $header -Body $body
