scp docker-compose.yml root@${1}/blog/prod
ssh -i ./deploy_key root@${1}

docker-compose stop
docker-compose rm -f
docker-compose pull
docker-compose up -d

logout
