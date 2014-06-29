
NAME=SPA
IMAGE_GREP=SPA
TAG=mine:SPA
#TAG=mine/mooc3

CMD="/etc/init.d/ssh restart; while true; do sleep 10; done'"
[ ! -z "$1" ] && CMD="$1"

DIR="$HOME/Docker/$NAME"
[ ! -d $DIR ] && {
    echo "mkdir -p $DIR";
    mkdir -p $DIR;
}

MOUNT="-v $DIR:/home/user/SPA"
SSH_PORT=2222
PORTS="-p $SSH_PORT:22 -p 3000:3000"
#PORTS="-p $SSH_PORT:22"

echo
echo "SSH listening on port $SSH_PORT"
echo
echo "You may want to change the ssh 'user' password"
echo
#echo "docker run -i -t $PORTS $MOUNT $TAG bash -lc "$CMD""
#exit 0
#set -x
echo "MOUNT: $MOUNT"
echo "PORTS: $PORTS"
#docker run -i -t $PORTS $MOUNT $TAG bash -lc "$CMD"
docker run -d $PORTS $MOUNT $TAG bash -lc "$CMD"


#LATEST_IMAGE=$(docker images | grep $IMAGE_GREP | head -1 | awk '{print $1;}')

#docker run -i -t -p 2222:22 -v /home/mjb/RAILS:/tmp mine/mooc:20140518 bash
#docker run -i -t -p 2222:22 -v /home/mjb/RAILS:/tmp $LATEST_IMAGE bash
#docker run -i -t -p 2222:22 -v /home/mjb/RAILS:/tmp $LATEST_IMAGE bash -c '/etc/init.d/sshd start; while true; do sleep 10; done'
#docker run -d -p 2222:22 -v /home/mjb/RAILS:/tmp $LATEST_IMAGE bash -c '/etc/init.d/sshd start; while true; do sleep 10; done'



