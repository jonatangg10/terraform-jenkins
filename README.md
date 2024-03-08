<p align="center">¡ BIENVENIDO !</p>
<p align="center"><b>Ejemplo practico de Terraform, Jenkins y AWS</b></p>
<hr>
<p align="center"><b>¡ Sigue los pasos en el archivo "Pasos a seguir.pdf" !</b></p>

/var/log
Mar  8 10:17:01 ubuntu CRON[14233]: pam_unix(cron:session): session opened for user root(uid=0) by (uid=0)
Mar  8 10:17:01 ubuntu CRON[14233]: pam_unix(cron:session): session closed for user root
Mar  8 10:17:05 ubuntu sshd[14268]: Authentication refused: bad ownership or modes for directory /home/jonatan/.ssh
Mar  8 10:17:05 ubuntu sshd[14268]: Authentication refused: bad ownership or modes for directory /home/jonatan/.ssh
Mar  8 10:17:05 ubuntu sshd[14268]: userauth_pubkey: key type ssh-rsa not in PubkeyAcceptedAlgorithms [preauth]
Mar  8 10:17:05 ubuntu sshd[14268]: Received disconnect from 172.18.0.2 port 34268:11: Closed due to user request. [preauth]
Mar  8 10:17:05 ubuntu sshd[14268]: Disconnected from authenticating user jonatan 172.18.0.2 port 34268 [preauth]


SSHLauncher{host='192.168.101.100', port=22, credentialsId='jenkins', jvmOptions='', javaPath='', prefixStartSlaveCmd='', suffixStartSlaveCmd='', launchTimeoutSeconds=60, maxNumRetries=10, retryWaitTime=15, sshHostKeyVerificationStrategy=hudson.plugins.sshslaves.verifiers.ManuallyTrustedKeyVerificationStrategy, tcpNoDelay=true, trackCredentials=true}
[03/08/24 15:17:04] [SSH] abriendo una conexión SSH sobre 192.168.101.100:22.
[03/08/24 15:17:04] [SSH] SSH host key matches key seen previously for this host. Connection will be allowed.
ERROR: Server rejected the 1 private key(s) for jonatan (credentialId:jenkins/method:publickey)
[03/08/24 15:17:05] [SSH] Fallo en la autenticación.
Autenticación fallida
[03/08/24 15:17:05] Launch failed - cleaning up connection
[03/08/24 15:17:05] [SSH] Cerrada la conexión.
