# oshifted_api
Basic rails app to play with iterating within an open shift ecosystem

# Development using Open Shift
## Setup
Install Open Shift/Minishift (Reference: https://gist.github.com/h-parekh/bff04b97bdd8d2428771f9238d7a1e46):
1. `brew cask install minishift`
1. `brew cask install virtualbox` Note: May prompt for a password. Enter your normal login password.
1. Start open shift: `minishift start --vm-driver virtualbox`
1. Wait for a message like: `The server is accessible via web console at: https://x.x.x.x:8443`
1. Add the cli to your path: `eval $(minishift oc-env)`
1. Test the cli: `oc version`

Create the project:
1. Clone this repository `git clone https://github.com/jgondron/oshifted_api.git`
1. Login as admin user `oc login`
1. `oc new-project oshifted-api`
1. `oc create -f /<path_to_repo>/project.yaml`
1. Watch the build/deploy progress: `oc get builds --watch`
1. Wait for a message like:
```console
railsapi-1   Source    Git@76b3d46   Complete   3 minutes ago   3m5s
```
1. Test with http://railsapi-oshifted-api.192.168.99.100.nip.io/echo?message=Hello!

## Iterating

### Run a sync
For dynamically reloaded files, such as controllers, views, models, etc., running a constant rsync that will copy files from your host os to the container should be sufficient.

From the root of the project directory:
`scripts/ocsync railsapi .`

Example:
```
lib-2001:oshifted_api jgondron$ scripts/ocsync railsapi .
building file list ... done
...
```

Changing a file should trigger the rsync (within a few seconds) and you should be able to refresh the page to see the change.

### Rebuild from local
For files that require a rebuild or a restart of rails, such as secrets, Gemfile, etc., you will need to rebuild the image. You can do this without having to push to the repo by running a build using the local directory.

From the root of the project directory:
`scripts/ocbuild railsapi .`

Wait for the build to complete, then resume the rsync.

Example:
```
lib-2001:oshifted_api jgondron$ scripts/ocbuild railsapi .
Uploading directory "." as binary input for the build ...
build "railsapi-5" started
NAME         TYPE      FROM          STATUS     STARTED        DURATION
railsapi-1   Source    Git@76b3d46   Complete   24 hours ago   1m28s
railsapi-2   Source    Binary@76b3d46   Complete   24 hours ago   1m56s
railsapi-3   Source    Binary@76b3d46   Complete   24 hours ago   1m52s
railsapi-4   Source    Binary@76b3d46   Complete   18 minutes ago   1m23s
railsapi-5   Source    Binary@76b3d46   Running   15 minutes ago
railsapi-5   Source    Binary@76b3d46   Complete   15 minutes ago   1m52s
^C
lib-2001:oshifted_api jgondron$ scripts/ocsync railsapi .
building file list ... done
...
```

## Debugging
Debugging requires running a remote debug client. The ocdebug script will start a terminal within the running pod for you and begin a debug client. 

From the root of the project directory:
`scripts/ocdebug railsapi`

Example:
```
lib-2001:oshifted_api jgondron$ scripts/ocdebug railsapi
Connecting to byebug server...
Connected.
```
Once this is connected, you should be able to set a breakpoint with byebug and interact with it the same as if you were developing locally. For example, go to http://railsapi-oshifted-api.192.168.99.100.nip.io/debug and you should see:
```
[5, 14] in /opt/app-root/src/app/controllers/echo_controller.rb
    5:       secret: Rails.application.secrets.some_other_secret,
    6:       database: Rails.application.config.database_configuration['development']['some_other_config']
    7:     }
    8:   end
    9:
   10:   def debug
   11:     byebug
=> 12:     render json: {}
   13:   end
   14: end
(byebug)
```


