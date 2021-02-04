FROM public.ecr.aws/lambda/nodejs:12 
RUN mkdir /packages && \
    mkdir /layer && \
    mkdir /output
RUN yum update -y && \
    yum install -y bsdtar && \
    yum install -y zip && \
    yum --downloadonly -y install openssl --downloaddir=/packages
WORKDIR /layer
RUN for file in `ls -Art /packages/*`; do bsdtar -xvf $file; done
# Lambda layers are quite silly, they seem to require all binaries in bin
RUN mv usr/bin bin
RUN zip -r /output/lambda-layer-openssl.zip .

