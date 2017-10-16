# oshifted_api
Basic rails app to play with iterating within an open shift ecosystem


# Development Setup using Open Shift

Install Open Shift/Minishift (Pulled from https://gist.github.com/h-parekh/bff04b97bdd8d2428771f9238d7a1e46):
1. `brew cask install minishift`
1. `brew cask install virtualbox`
1. `minishift start --vm-driver virtualbox`
1. Wait for a message like: `The server is accessible via web console at: https://x.x.x.x:8443`
1. `eval $(minishift oc-env)`
1. Test the cli: `oc version`

Create the project:
1. `oc new-project oshifted-api`
1. `oc create -f project.yaml`
1. Wait for build/deploy to finish then test with http://railsapi-oshifted-api.192.168.99.100.nip.io/echo?message=Hello!
