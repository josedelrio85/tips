# Certificate generation with certbot and nginx controller

Instructions to generate a letsencrypt certificate to use in https production websites.

## Previous steps

* A proper DNS rule must be created in the domain manager (arsys, etc) to set the relation between the domain and the hosted site

* Helm must be installed 

* Kube must be installed


## Install certbot client

I set the settings of the cluster to get the instructions to install the client, not sure if this setting is needed.

https://certbot.eff.org/lets-encrypt/debianstretch-nginx

## Execute certbot with this flags and the desired domain

```bash
sudo certbot certonly --manual -d [domain]
# sudo certbot certonly --manual -d www.ofertasvirgin.org
```

## Follow the wizard until the validation strings are prompted

```bash
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator manual, Installer None
Enter email address (used for urgent renewal and security notices) (Enter 'c' to
cancel): innovacion@josedelrio85.com

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please read the Terms of Service at
https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf. You must
agree in order to register with the ACME server at
https://acme-v02.api.letsencrypt.org/directory
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(A)gree/(C)ancel: a

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Would you be willing to share your email address with the Electronic Frontier
Foundation, a founding partner of the Let's Encrypt project and the non-profit
organization that develops Certbot? We'd like to send you email about our work
encrypting the web, EFF news, campaigns, and ways to support digital freedom.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: y
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for www.ofertasvirgin.org

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
NOTE: The IP of this machine will be publicly logged as having requested this
certificate. If you're running certbot in manual mode on a machine that is not
your server, please ensure you're okay with that.

Are you OK with your IP being logged?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: y

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Create a file containing just this data:

PyPvaIcBJYKLq2zjwF_IQoZhrMVbwGvudpvonMSP8eQ.WXxYNBwR-4dHsJTtotx50K3I67kxJ7l_nvyMIZpwdf0

And make it available on your web server at this URL:

http://www.ofertasvirgin.org/.well-known/acme-challenge/PyPvaIcBJYKLq2zjwF_IQoZhrMVbwGvudpvonMSP8eQ

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Press Enter to Continue^[[F
```

## Update `nginx_for_certs` helm values file with the prompted data

* [Nginx for certificates](https://github.com/josedelrio85/devops/tree/dev/helm/josedelrio85/letsencrypt)


```yml
replicaCount: 1

image:
  repository: nginx
  tag: stable
  pullPolicy: IfNotPresent

nameOverride: "letsencrypt"
fullnameOverride: "letsencrypt"

service:
  type: LoadBalancer
  port: 80

ingress:
  enabled: true
  annotations: {
    ingress.kubernetes.io/force-ssl-redirect: "false"
  }
  paths:
  # set with the value offered by certbot client
  - /.well-known/acme-challenge/PyPvaIcBJYKLq2zjwF_IQoZhrMVbwGvudpvonMSP8eQ
  hosts:
    # set the desired domain
    - www.ofertasvirgin.org

vhost: |-
  server {
    listen 80;
    server_name _;

    # This entry is intended to be used to renew the api.josedelrio85.com certificate
    # set with the value offered by certbot client
    location / {
      return 200 'PyPvaIcBJYKLq2zjwF_IQoZhrMVbwGvudpvonMSP8eQ.WXxYNBwR-4dHsJTtotx50K3I67kxJ7l_nvyMIZpwdf0';
    }
  }

resources: {}
nodeSelector: {}
tolerations: []
affinity: {}
```

## Deploy `nginx_for_certs` resource

```bash
helm -n [namespace] install [desired_hell_name] [folder_helm_resources]
# helm -n virgin install virgin-nginx-cert letsencrypt
```

* Wait few minutes until the deploy is fully ready


## Continue certbot wizard

* Press enter and the process will continue

* If all process is succesful, key/chain pem files will be generated into `/etc/letsencrypt/` local folder

```bash
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/www.ofertasvirgin.org/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/www.ofertasvirgin.org/privkey.pem
   Your cert will expire on 2020-06-25. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

## Generate a secret with generated pem files

```bash
sudo kubectl -n [namespace] create secret tls [name_of_secret] --key [path_privkey_file] --cert [path_fullchain_file]
# or
sudo kubectl create secret tls ${CERT_NAME} --key ${KEY_FILE} --cert ${CERT_FILE}
# sudo kubectl -n virgin create secret tls tls-www-ofertasvirgin-org --key /etc/letsencrypt/live/www.ofertasvirgin.org/privkey.pem --cert /etc/letsencrypt/live/www.ofertasvirgin.org/fullchain.pem
```

## Use `[name_of_secret]` in `tls.secret_name` section of deploy resources

Update the site deploy file with generated secret name and update/create it to use the tls secret

* helm/values.yml ingress section:

```yml
ingress:
  enabled: true
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  hosts:
    - host: www.ofertasvirgin.org
      paths:
        - /
  tls:
    - secretName: tls-www-ofertasvirgin-org
      hosts:
        - www.ofertasvirgin.org
```

* or if you are using ingress definition file:

```yml
tls:
  - hosts:
    - www.ofertasvirgin.org
    secretName: tls-www-ofertasvirgin-org
```

## Delete `nginx_for_certs` deploy 

```bash
helm -n [namespace] delete [desired_hell_name]
# helm -n virgin delete virgin-nginx-cert
```
