#!/bin/bash
export GITHUB_TOKEN=<your-token>
bluebuild generate ./recipes/recipe.yml -o Containerfile
bluebuild build ./recipes/recipe.yml
# bluebuild switch ./recipes/recipe.yml
echo $GITHUB_TOKEN | docker login ghcr.io -u <your-github-username> --password-stdin
docker push ghcr.io/<your-github-username>/legendaryos:latest
bluebuild generate-iso --iso-name LegendaryOS.iso image ghcr.io/<your-github-username>/legendaryos:latest
