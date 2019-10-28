



# docker build -t javaapptest .

docker run -it -p 8081:8080 --cap-add=NET_ADMIN --net nodenet --ip 172.18.0.21 javaapptest 1 >> node1.txt 2>&1 &

docker run -it -p 8082:8080 --cap-add=NET_ADMIN --net nodenet --ip 172.18.0.22 javaapptest 2 >> node2.txt 2>&1 &

docker run -it -p 8083:8080 --cap-add=NET_ADMIN --net nodenet --ip 172.18.0.23 javaapptest 3 >> node3.txt 2>&1 &

docker run -it -p 8084:8080 --cap-add=NET_ADMIN --net nodenet --ip 172.18.0.24 javaapptest 4 >> node4.txt 2>&1 &

docker run -it -p 8085:8080 --cap-add=NET_ADMIN --net nodenet --ip 172.18.0.25 javaapptest 5 >> node5.txt 2>&1 &


sleep 20


curl "http://localhost:8081/?block=172.18.0.22"
curl "http://localhost:8082/?block=172.18.0.21"

curl "http://localhost:8081/?block=172.18.0.23"
curl "http://localhost:8083/?block=172.18.0.21"

curl "http://localhost:8082/?block=172.18.0.23"
curl "http://localhost:8083/?block=172.18.0.22"




curl "http://localhost:8085/?block=172.18.0.21"
curl "http://localhost:8085/?block=172.18.0.22"
curl "http://localhost:8085/?block=172.18.0.24"

curl "http://localhost:8085/?unblock=172.18.0.23"

curl "http://localhost:8081/?unblock=172.18.0.24"

curl "http://localhost:8084/?unblock=172.18.0.21"



curl "http://localhost:8082/?unblock=172.18.0.24"
curl "http://localhost:8084/?unblock=172.18.0.22"

curl "http://localhost:8082/?block=172.18.0.24"
curl "http://localhost:8084/?block=172.18.0.22"


sleep 20


# stop EVERYONE and remove instances.
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
