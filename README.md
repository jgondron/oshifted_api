# oshifted_api
Basic rails app to play with iterating within an open shift ecosystem


# Development Setup using Open Shift
1. Install Open Shift
1. `oc new-project oshifted-api`
1. `oc create -f project.yaml`
1. Wait for build/deploy to finish then test with http://railsapi-oshifted-api.192.168.99.100.nip.io/echo?message=Hello!
