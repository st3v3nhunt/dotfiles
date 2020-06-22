#!/usr/bin/env bash

repos=(
defra/ffc-ce-admin-web
defra/ffc-ce-payment-orchestrator
defra/ffc-ce-web
defra/ffc-demo-acceptance-tests
defra/ffc-demo-calculation-service
defra/ffc-demo-claim-service
defra/ffc-demo-payment-service
defra/ffc-demo-payment-service-core
defra/ffc-demo-payment-web
defra/ffc-demo-web
defra/ffc-demo-web-acceptance-tests
defra/ffc-development-guide
defra/ffc-docker-node
defra/ffc-git-secret-scanning
defra/ffc-helm-library
defra/ffc-helm-repository
defra/ffc-jenkins-pipeline-library
defra/ffc-kubernetes-configuration
defra/ffc-pact-broker
)

pushd ~/code/ || exit
for repo in "${repos[@]}"; do
  # use the gh cli
  gh repo clone "$repo"
done
popd || exit
