scp ./src/docker-compose.yml root@${1}:/root/blog/prod/docker-compose.yml
scp ./src/.env root@${1}:/root/blog/prod/.env
ssh -i ./deploy_key root@${1} << EOF

    cd /root/blog/prod
    docker-compose stop || true
    docker-compose rm -f || true
    docker-compose pull
    docker-compose up -d

    logout

EOF
