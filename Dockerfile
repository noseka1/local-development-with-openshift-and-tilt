FROM registry.redhat.io/ubi8/ubi
RUN dnf install --assumeyes python3
WORKDIR /app
ADD . .
ENTRYPOINT ./main.sh
