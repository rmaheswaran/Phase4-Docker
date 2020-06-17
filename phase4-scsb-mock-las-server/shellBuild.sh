
echo "Parameter = $1"
PROJ_NAME="Phase4-SCSB-LAS-Mock-Server"
PROJ_DIR="/opt/Phase4-SCSB-LAS-Mock-Server"
PROJ_DIR_TAG=""
VAR_SLASH="/"

PROJ_DIR_TAG=$PROJ_DIR$VAR_SLASH$PROJ_NAME;

# echo $PROJ_DIR_TAG
mkdir $PROJ_NAME
cd $PROJ_DIR
git clone https://github.com/ResearchCollectionsAndPreservation/Phase4-SCSB-LAS-Mock-Server.git
# echo $PROJ_DIR_TAG
cd $PROJ_DIR_TAG
if [ ! -z $1 ] ;then
    git checkout tags/$1
fi
# ls -l
pwd
./gradlew clean build -x test

ln -s $PROJ_DIR_TAG/build/libs/phase4-scsb-las-mock-server.jar /etc/init.d/phase4-scsb-las-mock-server
cp $PROJ_DIR_TAG/build/libs/phase4-scsb-las-mock-server.jar /opt

