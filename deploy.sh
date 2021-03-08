docker build -t mateusbrum/multi-client -f ./client/Dockerfile ./client
docker build -t mateusbrum/multi-server -f ./server/Dockerfile ./server
docker build -t mateusbrum/multi-worker -f ./worker/Dockerfile ./worker