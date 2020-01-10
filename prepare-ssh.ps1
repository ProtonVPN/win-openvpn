New-Item -ItemType Directory -Force -Path "$env:userprofile\.ssh"
"$env:SSH_PRIVATE_KEY`n".Replace("`r`n","`n") | Out-File -NoNewline -Encoding ASCII -FilePath "$env:userprofile\.ssh\id_rsa"
ssh-keyscan -t rsa github.com | Set-Content "$env:userprofile\.ssh\known_hosts"
