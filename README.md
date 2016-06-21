# Ultimate Cookbook
**Important:** _For Amazon AWS OpsWorks Only_

Deploying software in a continuous deployment cycle can be made easy using OpsWorks and Chef. These cookbooks are currently only supporting Ubuntu, Symfony and JAR files.

If you require added features, don't hesitate to fork. If your features benefit others too, be so kind to submit a pull request.

## Ubuntu Recipes
**ubuntu::install_oracle_java_8** _(Lifecycle: Setup)_

This recipe automatically installs Oracle's latest Java 8 JRE.

_Note:_ When using this recipe, keep in mind you automatically agree to the terms of the JRE license.

**ubuntu::install_wkhtmltopdf_0_12** _(Lifecycle: Setup)_

This recipe automatically installs the commandline tool [wkhtmltopdf](http://wkhtmltopdf.org/) v0.12 and encapsulates the command within _X virtual framebuffer_ to perform graphical operations in memory without showing any screen output.

_Note:_ The tool will be located in **/usr/bin/wkhtmltopdf.sh**

## Symfony
**symfony::acl_setup** _(Lifecycle: Deploy)_

This recipe automatically installs acl.

**symfony::configure** _(Lifecycle: Deploy)_

This recipe sets up automatically the following:
- ACL for writable folders.
- Configures **parameters.yml** based on the configured **Environment Variables** in **Apps**.
- Installs the latest version of [Composer](http://getcomposer.org/).
- Runs Composer to install third-party bundles.
- And... Runs specified Symfony commands.

_Note:_ When running Symfony commands it automatically detects whether to run **bin/console** or **app/console** based on the Symfony version.

To specify which writable folders are required or which Symfony commands needs to be run, the following example **Custom JSON** can be used:

```
{
  "custom_env": {
    "APPLICATION_NAME": {
      "type": "symfony",
      "writable_folders": [
        "var/logs",
        "var/cache"
      ],
      "symfony_cl": [
        "cache:clear --env=prod",
        "assetic:dump --env=prod"
      ]
    }
  }
}
```

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
