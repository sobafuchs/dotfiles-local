#!/usr/bin/env bash

function stop_all_docker_containers() {
  docker stop $(docker ps -aq)
}

function remove_all_docker_containers() {
  docker rm $(docker ps -aq)
}
