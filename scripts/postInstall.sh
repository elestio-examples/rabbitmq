# nothing to do here ...
set -o allexport; source .env; set +o allexport;

line=$(grep "proxy_pass http://172.17.0.1:" /opt/elestio/nginx/conf.d/${DOMAIN}.conf)
port=$(echo "$line" | sed -n 's/.*proxy_pass http:\/\/172\.17\.0\.1:\([0-9]\+\)\/.*/\1/p')
sed -i "s~proxy_pass http://172.17.0.1:${port}/;~proxy_pass http://172.17.0.1:${port};~g" /opt/elestio/nginx/conf.d/${DOMAIN}.conf


docker exec elestio-nginx nginx -s reload;