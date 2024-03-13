set -e
function versionstr () {
    echo "$(git describe --tags --abbrev=0)-SNAPSHOT.$(git rev-parse --short HEAD)"
}

IMAGE=827659017777.dkr.ecr.eu-central-1.amazonaws.com/mev-geth:$(versionstr)

docker build --platform linux/amd64 -t $IMAGE .
docker push $IMAGE