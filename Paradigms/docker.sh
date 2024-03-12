#!/bin/bash

APP_FILE="Application.pas"
APP="App"
COMPILER="fpc"
IMAGE="kprzystalski/projobj-pascal"
TESTS_FILE="TestParadigms.pas"
TESTS="Tests"
VOLUME_MOUNT="-v $(pwd):/home/student/projobj/"

docker pull $IMAGE > /dev/null 2>&1

echo "What do you want to run?"
echo "1. Application"
echo "2. Tests"
echo "3. Cleanup files"
echo
read -p ": " choice

case $choice in
    1)
        docker run --rm -i -t $VOLUME_MOUNT $IMAGE $COMPILER $APP_FILE -o$APP > /dev/null 2>&1
        docker run --rm -i -t $VOLUME_MOUNT $IMAGE ./$APP
        ;;
    2)
        docker run --rm -i -t $VOLUME_MOUNT $IMAGE $COMPILER $TESTS_FILE -o$TESTS > /dev/null 2>&1
        docker run --rm -i -t $VOLUME_MOUNT $IMAGE ./$TESTS
        ;;
    3)
        rm -f $APP $TESTS *.o *.ppu
        ;;
    *)
        echo "Invalid choice. Please select either '1', '2' or '3'."
        ;;
esac
