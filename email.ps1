param(
    [string]$date,
    [string]$temperature
)

function Send-Email {
    param(
        [string]$senderEmail,
        [string]$appPassword,
        [string]$recipientEmail,
        [string]$subject,
        [string]$body
    )

    $message = New-Object System.Net.Mail.MailMessage
    $message.From = $senderEmail
    $message.To.Add($recipientEmail)
    $message.Subject = $subject
    $message.Body = $body

    try {
        $smtpServer = "smtp.gmail.com"
        $smtpPort = 587
        $smtpClient = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
        $smtpClient.EnableSsl = $true
        $smtpClient.Credentials = New-Object System.Net.NetworkCredential($senderEmail, $appPassword)

        $smtpClient.Send($message)
        Write-Host "Email sent successfully!"
    } catch {
        Write-Host "An error occurred while sending the email: $($_.Exception.Message)"
    }
}

$now = Get-Date
$time1_str = $date
$time_format = 'HH:mm'
$time1 = [datetime]::ParseExact($time1_str, $time_format, $null)
$time_diff = $now - $time1

$hours = [math]::Floor($time_diff.TotalHours)
$minutes = $time_diff.Minutes

if ($minutes -lt 10) {
    $minutes = "0$minutes"
}

$senderEmail = 'example@gmail.com'
$appPassword = 'APP_PASSWORD'
$recipientEmail = 'example@gmail.com'
$subject = "Cell Temperature Alarm"
$body = "Registered temperature of $temperature °C for a period of $hours hours and $minutes minutes!"
Send-Email -senderEmail $senderEmail -appPassword $appPassword -recipientEmail $recipientEmail -subject $subject -body $body
