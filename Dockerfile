name: Build Docker

on:
  push:
   branches: [ master ]
  pull_request:
    branches: [ master ]
      
jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - name: Login to Docker Hub
      uses: docker/login-action@v2
      with:
          username: ${{ secrets.DOCKER_HUB_USERNAME }}
          password: ${{ secrets.DOCKERPW }}
    - name: Building docker
      run: docker image build -t "${{ secrets.DOCKER_HUB_USERNAME }}"/gdrivvve:latest .
    - name: Pushing docker to docker.io
      run: docker push "${{ secrets.DOCKER_HUB_USERNAME }}"/gdrivvve:latest
