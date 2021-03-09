docker build -t mateusbrum/multi-client:latest -t mateusbrum/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t mateusbrum/multi-server:latest -t mateusbrum/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t mateusbrum/multi-worker:latest -t mateusbrum/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push mateusbrum/multi-client:latest
docker push mateusbrum/multi-server:latest
docker push mateusbrum/multi-worker:latest
docker push mateusbrum/multi-client:$SHA
docker push mateusbrum/multi-server:$SHA
docker push mateusbrum/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=mateusbrum/multi-server:$SHA
kubectl set image deployments/client-deployment client=mateusbrum/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=mateusbrum/multi-worker:$SHA