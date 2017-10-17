# oshifted_api
Basic rails app to play with iterating within an open shift ecosystem

# Development Setup using Open Shift

Install Open Shift/Minishift (Reference: https://gist.github.com/h-parekh/bff04b97bdd8d2428771f9238d7a1e46):
1. `brew cask install minishift`
1. `brew cask install virtualbox`
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
