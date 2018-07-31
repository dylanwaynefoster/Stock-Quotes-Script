echo `n'Hello World!'`n

$userSymbol = Read-Host -Prompt 'Input the stock symbol for which you want a quote'

$userUrl = -join('https://api.iextrading.com/1.0/stock/',$userSymbol,'/batch?types=quote')

$myQuote = Invoke-RestMethod -Method Get -Uri $userUrl

$logText = "Here is your latest price quote for the below company:"

$userCoName = $myQuote.quote.companyName

$userLatest = $myQuote.quote.latestPrice

$logText,$userCoName,$userLatest | Out-File -FilePath "YOUR_FILE_PATH_HERE\quoteDump.txt"
