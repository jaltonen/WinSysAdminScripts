# Disable a local account on a remote server or a local machine

# specify local user name.
$UserName = "Administrator"

# specify server name or local machine name
$Server = $env:computername

# Connect to local user on remote server.
$User = [ADSI]"WinNT://$Server/$UserName,user"

# Disable the user.
$User.AccountDisabled = $True
$User.SetInfo()
