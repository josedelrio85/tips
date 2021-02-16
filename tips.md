# TIPS

## ENV VARS

### Print env variable with powershell

```bash
$env:[ENV_NAME]
```

### Print env variable with CMD

```bash
echo %[ENV_NAME]%
```

### Update env var without reboot

```bash
taskkill /f /im explorer.exe
explorer.exe
```

### Print env variable linux

```bash
echo $VARNAME
```

### Print all env_var (not sure if these are ALL system env var's)

```bash
printenv
#or 
env
```

### Set variables

* Only for current shell:

```bash
VARNAME="my value"
```

* Set it for current shell and all processes started from current shell:

```bash
export VARNAME="my value"
```

* Set it permanently for all future bash sessions add such line to your .bashrc file in your $HOME directory.

```bash
sudo nano ~/.bashrc
#or 
sudo nano ~/.zshrc
```

* Add into the file 

```bash
export VARNAME="my value"
```

* Set it permanently, and system wide (all users, all processes) add set variable in /etc/environment:

```bash
sudo -H nano /etc/environment
```

* Add into the file 

```bash
VARNAME="my value"
```


NOTE: Shell config files such as `~/.bashrc`, `~/.bash_profile`, and `~/.bash_login` are often suggested for setting environment variables. While this may work on Bash shells for programs started from the shell, variables set in those files are not available by default to programs started from the graphical environment in a desktop session.





## NPM

### Configuring NPM for use with GitHub Package Registry

* [First read this link](https://help.github.com/en/articles/configuring-npm-for-use-with-github-package-registry#authenticating-to-github-package-registry)


* Is needed to add a .npmrc in the repo that will use a package from GitHub. Set this content in this file:

  ```bash
  @bysidecar:registry=https://npm.pkg.github.com/
  ```

* Create a .npmrc file in the root of your system to log in in npm (not npm registry, github instad).

  ```bash
  //npm.pkg.github.com/:_authToken=${GH_PERS_TOKEN}
  ```

  * You will need a personal access token => https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line

  * Store it as environment variable.

* If you have problems using .npmrc in the root folder, execute this commands:

  ```bash
  npm login --registry=https://npm.pkg.github.com --scope=@BySidecar

  > Username: USERNAME
  > Password: TOKEN [USE CREATED TOKEN CODE!!!]
  > Email: PUBLIC EMAIL ADDRESS
  ```

* To publish a package => **npm publish**

  * you need the .npmrc file
  
  * in packages.json:

      * Add the propper name => respect the name of the organization (may-min).
      * Use min for the name of the package
      * Add the next entry if not exist => 
        
        ```bash
        "repository": {
          "type": "git",
          "url": "git+https://github.com/BySidecar/landing-commander.git"
        },
        ```

      * Add a version element
        ```
        "version": "1.0.3",
        ```

* To install a package add the reference to the package in package.json (the .npmrc file is needed in the project).

  ```bash
  npm install || npm update
  ```

* **You need to be logged to execute npm install!!!**

## GIT

### Create tag, push it and publish the package

```bash
git tag -a v1.x.x -m "comment"
git push origin v1.x.x
npm publish
```


### Delete local tag '12345'
```bash
git tag -d 12345
```

### Delete remote tag '12345' (eg, GitHub version too)
```bash
git push origin :refs/tags/12345
# Alternative approach
git push --delete origin tagName
```








### Update gitignore

```bash
git rm -r --cached .

git add .

git commit -m "update gitignore"
```

## GITHUB AND SSH KEYS

```bash
ssh-agent bash 

eval ssh-agent -s

ssh-add -k ~/.ssh/github
```


### Checking for existing SSH key

* Checking for existing SSH key [read this](https://help.github.com/en/enterprise/2.15/user/articles/checking-for-existing-ssh-keys)

```bash
ls -al ~/.ssh
```
* The filenames of the public keys are one of the following:

  * id_dsa.pub
  * id_ecdsa.pub
  * id_ed25519.pub
  * id_rsa.pub

If you don't have an existing public and private key pair, or don't wish to use any that are available to connect to GitHub, then generate a new SSH key.


### Generating a new SSH key 

* Generating a new SSH key [read this](https://help.github.com/en/enterprise/2.15/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)[read this](https://help.github.com/en/enterprise/2.15/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

* Creates a new ssh key, using the provided email as a label

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

> Enter a file in which to save the key (/c/Users/you/.ssh/id_rsa):[Press enter]

> type a secure passphrase
```
### Adding your SSH key to the ssh-agent

* If you are using another terminal prompt, such as Git for Windows, you can use the "Auto-launching the ssh-agent" instructions in "Working with SSH key passphrases", or start it manually:

* Start the ssh-agent in the background

  ```bash
  eval $(ssh-agent -s)
  > Agent pid 59566
  ```

* Add your SSH private key to the ssh-agent. If you created your key with a different name, or if you are adding an existing key that has a different name, replace id_rsa in the command with the name of your private key file.

  ```bash
  ssh-add ~/.ssh/id_rsa
  ```

* Or follow these steps to run ssh-agent automatically when you open bash or Git shell. Copy the following lines and paste them into your ~/.profile or ~/.bashrc file in Git shell:

  ```bash
  env=~/.ssh/agent.env

  agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

  agent_start () {
      (umask 077; ssh-agent >| "$env")
      . "$env" >| /dev/null ; }

  agent_load_env

  # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
  agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

  if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
      agent_start
      ssh-add
  elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
      ssh-add
  fi

  unset env
  ```

### Adding a new SSH key to your GitHub account

* Copy the SSH key to your clipboard.

* If your SSH key file has a different name than the example code, modify the filename to match your current setup. When copying your key, don't add any newlines or whitespace.

  ```bash
  $ clip < ~/.ssh/id_rsa.pub
  # Copies the contents of the id_rsa.pub file to your clipboard
  ```

* Tip: If clip isn't working, you can locate the hidden .ssh folder, open the file in your favorite text editor, and copy it to your clipboard.

* In the upper-right corner of any page, click your profile photo, then click Settings.

* In the user settings sidebar, click SSH and GPG keys.

* Click New SSH key or Add SSH key.

* In the "Title" field, add a descriptive label for the new key. For example, if you're using a personal Mac, you might call this key "Personal MacBook Air".

* Paste your key into the "Key" field.

* Click Add SSH key.

* If prompted, confirm your GitHub Enterprise password.







## GO!

### Go vendoring

  Tener paquetes publicos y privados de GH descargados en local para evitar problemas de falta de disponibilidad online y para pasar las build, ya que autorizar a CI para que acceda a paquetes privados de GH es bastante lío, de esta manera ya los tiene disponible en local y se suben con el push

  ```bash
  GO111MODULE=on

  go mod init

  go mod vendor
  ```

  **IMPORTANTISIMO!!!!**

  Añadir repos privados bysidecar a variable GOPRIVATE

  ```bash
  go env -w GOPRIVATE=github.com/bysidecar/* 
  ```

## CRON

### LIST CRON JOBS

  ```bash
  crontab –l
  ```

### EDIT CRON JOBS

  ```bash
  crontab -e
  ```

## MySQL

### Kill query or process that is collapsing resources

  - Identify the query on AWS Console and search its id using this query.

  ```sql
  SHOW FULL PROCESSLIST;
  ```

  - Kill it!

  ```sql
  CALL mysql.rds_kill(606);
  # CALL mysql.rds_kill_query(354);
  ```

### Remove mysql instances

  ```bash
  sudo apt-get remove --purge mysql-server mysql-client mysql-common -y
  sudo apt-get autoremove -y
  sudo apt-get autoclean
  ```

### View path MySQL configuration file

  ```bash
  mysql --help
  #output => /etc/mysql/my.cnf /etc/my.cnf ~/.my.cnf 
  ```

### Start/Status/Stop service CentOS 7

  ```bash
  systemctl stop mariadb.service
  systemctl start mariadb.service
  systemctl is-active mariadb.service
  ```

### View PID MariaDB service

  ```bash
  ps ax | grep mariadb
  ```


## PHP

### Look for php.ini file

  ```bash
  php -i | grep php.ini
  ```

### Look for xdebug config

  ```bash
  sudo grep 'xdebug' -r /etc/php/*
  ```

### Delete any php entry

  ```bash
  sudo apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`
  ```


## LINUX

### Get system space

```bash
df -h --total
```

### Extended info

```bash
df --o --total
```

## WINDOWS

### EMBEDDED LINUX

  Share windows folder with kali linux

  * Create a new folder in windows host and set it to be a shared folder

  * Install cifs-utils in Linux

  ```bash
  sudo apt-get install cifs-utils
  ```

  * Create a folder on linux to share from Windows

  ```bash
  sudo mkdir /home/[username]/[folder]
  ```

  * Mount shared windows folder in created folder

  ```bash
  sudo mount -t drvfs '\\server\share' /home/[username]/[folder]
  ```