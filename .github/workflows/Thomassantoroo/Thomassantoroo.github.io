# Workflow déploiement Hugo 
 
name: Publication 
 
# Déterminer les événements sur lesquels déclencher le job de CI
on:
  push: 
    branches: [ master ] 
  pull_request: 
 
# Un workflow de CI est composé de 1 ou plusieurs jobs lancés de manière séquentielle ou parallèle
jobs: 
  # Ce workflow comprend un seul job appelé "deploy" 
  deploy: 
    runs-on: ubuntu-latest 
    steps: 
      - uses: actions/checkout@v2 
        with: 
          submodules: recursive 
      - uses: benmatselby/hugo-deploy-gh-pages@master 
        env: 
          HUGO_VERSION: 0.99.0 
          HUGO_EXTENDED: true 
          TARGET_REPO: mmasquelin/mmasquelin.github.io 
          TARGET_BRANCH: gh-pages 
          TOKEN: ${{ secrets.HUGO_SECRET_TOKEN }}
