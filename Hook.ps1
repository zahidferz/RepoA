$buildid=$env:buildid
$token=$env:token
$stage=$env:stage
$projectid=$env:projectid
$versionid=$env:versionid
$webappName=$env:webappName
$status=$env:stage
if ($status -eq 'Succeeded'){
    $color = "#3C924E"
}elseif ($status -eq 'SucceededWithIssues') {
    $color = "#EA8A24"    
}else {
    $color = "#C33833"
}
$header = @{authorization = "Bearer $token"}
$Raw = '{ "channel": "C015EDFMP4P", "attachments": [ { "color": "#3C924E", "blocks": [ { "type": "section", "block_id": "section1", "text": { "type": "mrkdwn", "text": "Deployment on stage <https://dev.azure.com/gestionix-boa/projectid/_build/results?buildId=buildid&branchName=master| enviroment > Status" } }, { "type": "section", "block_id": "section2", "text": { "type": "mrkdwn", "text": "*Version* <https://dev.azure.com/gestionix-boa/projectid/_build/results?buildId=buildid&branchName=master| versionid >\n *Pipeline* <https://dev.azure.com/gestionix-boa/projectid/_build/results?buildId=buildid&branchName=master|Webapp>" } } ] } ] }'
$Body = $Raw | ConvertFrom-Json
$Body.attachments.color=$color
$Section1=($Body.attachments.blocks | where-object block_id -eq section1).text.text -creplace "projectid", $projectid -creplace "buildid", $buildid -creplace "enviroment", $stage -creplace "Status", $status
($Body.attachments.blocks | where-object block_id -eq section1).text.text= $Section1
$Section2=($Body.attachments.blocks | where-object block_id -eq section2).text.text -creplace "projectid", $projectid -creplace "buildid", $buildid -creplace "versionid", $versionid -creplace "Webapp", $webappName
($Body.attachments.blocks | where-object block_id -eq section2).text.text= $Section2
$Body = $Body | ConvertTo-Json -Depth 5
Invoke-RestMethod -Uri "https://eleva-inc.slack.com/api/chat.postMessage"  -Method Post -ContentType "application/json" -Headers $header -Body $Body
