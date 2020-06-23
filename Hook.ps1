$id=$env:id
$token=$env:token
$stage=$env:stage
$sysid:$env:sysid
$header = @{authorization = "Bearer $token"}
$Body = Get-Content ./slack.json | ConvertFrom-Json
$Body.blocks.text.text = "<https://dev.azure.com/gestionix-boa/$sysid/_build/results?buildId=$id&branchName=master| $stage>"
$Body = $Body | ConvertTo-Json -Depth 5
Invoke-RestMethod -Uri "https://eleva-inc.slack.com/api/chat.postMessage"  -Method Post -ContentType "application/json" -Headers $header -Body $Body
