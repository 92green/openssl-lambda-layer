# Creates a lambda layer for using OpenSSL on lambda.

docker build -t openssl-layer .
CONTAINER=`docker create openssl-layer --name openssl-layer` && docker cp $CONTAINER:/output/lambda-layer-openssl.zip .