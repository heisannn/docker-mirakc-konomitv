#!/bin/sh

git clone --recursive https://github.com/heisannn/docker-mirakc-konomitv
cd docker-mirakc-konomitv
cp docker-compose.example.yaml docker-compose.yaml
cp mirakc/config.example.yml mirakc/config.yml
cp KonomiTV/docker-compose.example.yaml KonomiTV/docker-compose.yaml
cp KonomiTV/config.example.yaml KonomiTV/config.yaml
docker compose up -d
