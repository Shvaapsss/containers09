docker image build -t mynginx:raw -f Dockerfile.raw .

docker image build -t mynginx:clean -f Dockerfile.clean .

docker image build -t mynginx:few -f Dockerfile.few .

docker image build -t mynginx:alpine -f Dockerfile.alpine .

docker container create --name mynginx mynginx:raw
docker container export mynginx | docker image import - mynginx:repack
docker container rm mynginx

docker image build -t mynginx:minx -f Dockerfile.min .
docker container create --name mynginx mynginx:minx
docker container export mynginx | docker image import - mynginx:min
docker container rm mynginx

docker image list | grep mynginx
