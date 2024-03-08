<p align="center">¡ BIENVENIDO !</p>
<p align="center"><b>Ejemplo practico de Terraform, Jenkins y AWS</b></p>
<hr>
<p align="center"><b>¡ Sigue los pasos en el archivo "Pasos a seguir.pdf" !</b></p>

SSHLauncher{host='192.168.101.100', port=22, credentialsId='jenkins', jvmOptions='', javaPath='', prefixStartSlaveCmd='', suffixStartSlaveCmd='', launchTimeoutSeconds=60, maxNumRetries=10, retryWaitTime=15, sshHostKeyVerificationStrategy=hudson.plugins.sshslaves.verifiers.ManuallyTrustedKeyVerificationStrategy, tcpNoDelay=true, trackCredentials=true}
[03/08/24 14:56:31] [SSH] abriendo una conexión SSH sobre 192.168.101.100:22.
[03/08/24 14:56:31] [SSH] SSH host key matches key seen previously for this host. Connection will be allowed.
ERROR: Server rejected the 1 private key(s) for jonatan (credentialId:jenkins/method:publickey)
[03/08/24 14:56:31] [SSH] Fallo en la autenticación.
Autenticación fallida
[03/08/24 14:56:31] Launch failed - cleaning up connection
[03/08/24 14:56:31] [SSH] Cerrada la conexión.
