# Ultimate Cookbook
## Ubuntu
- ubuntu::install_oracle_java_8
- ubuntu::install_wkhtmltopdf_0_12

## Java
### Example Custom JSON

```
{
  "custom_env": {
    "YOUR_APPLICATION": {
      "type": "java",
      "jar": "testjar.jar"
    }
  }
}
```

### Example Custom YAML

```
deploy:
  YOUR_APPLICATION:
    deploy_to: /home/vagrant/app
    user: vagrant
custom_env:
  YOUR_APPLICATION:
    type: java
    jar: testjar.jar
```

## Symfony
### Example Custom JSON

```
{
  "custom_env": {
    "YOUR_APPLICATION": {
      "type": "symfony",
      "writable_folders": [
        "var/logs",
        "var/cache"
      ],
      "parameters": {
        "database_host": "127.0.0.1",
        "database_port": "null",
        "database_name": "symfony",
        "database_user": "root",
        "database_password": "null",
        "mailer_transport": "smtp",
        "mailer_host": "127.0.0.1",
        "mailer_user": "null",
        "mailer_password": "null",
        "secret": "9cf3e40c43ad9176aee24cf0d931655999706344",
      },
      "symfony_cl": [
        "cache:clear --env=\"prod\""
      ]
    }
  }
}
```

### Example Custom YAML

```
deploy:
  YOUR_APPLICATION:
    deploy_to: /home/vagrant/symfony
    user: vagrant
custom_env:
  YOUR_APPLICATION:
    type: symfony
    writable_folders:
      - var/logs
      - var/cache
    parameters:
      test1: okay
      niet_ok: is niet goed
      Hallo: mjah ok.
    symfony_cl:
      - cache:clear --env="prod"
      - generate:command AppBundle Test2
```
