#!/bin/bash
docker push litleleprikon/sample-node

ssh litleleprikon@104.199.109.216 << EOF
docker pull litleleprikon/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi litleleprikon/sample-node:current || true
docker tag litleleprikon/sample-node:latest litleleprikon/sample-node:current
docker run -d --net app --restart always --name web -p 80:80 litleleprikon/sample-node:current
EOF
