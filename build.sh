
TAG=mine:SPA

cd /home/mjb/src/git/mjbright/Docker-SPA

CACHE="--no-cache"
CACHE=""

time docker build $CACHE -t $TAG .
echo "Image build with TAG $TAG"
#echo "Run it with:"
#echo "  docker run -i -t $TAG"
echo "Run it via: launchContainer.sh"


