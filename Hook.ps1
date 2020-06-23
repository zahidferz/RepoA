$buildid=$env:buildid
$token=$env:token
$stage=$env:stage
$projectid=$env:projectid
$versionid=$env:versionid
$webappName=$env:webappName

$header = @{authorization = "Bearer $token"}
$Body = Get-Content ./SuccededDeploy.json | ConvertFrom-Json
$Section1=($Body.attachments.blocks | where-object block_id -eq section1).text.text -creplace "projectid", $projectid -creplace "buildid", $buildid -creplace "enviroment", $stage
($Body.attachments.blocks | where-object block_id -eq section1).text.text= $Section1
$Section2=($Body.attachments.blocks | where-object block_id -eq section2).text.text -creplace "projectid", $projectid -creplace "buildid", $buildid -creplace "ID", $versionid -creplace "Webapp", $webappName
($Body.attachments.blocks | where-object block_id -eq section2).text.text= $Section2
$Body = $Body | ConvertTo-Json -Depth 5
Invoke-RestMethod -Uri "https://eleva-inc.slack.com/api/chat.postMessage"  -Method Post -ContentType "application/json" -Headers $header -Body $Body
