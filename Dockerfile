# Overriden while PR is accepted
FROM rfbezerra/svg-to-ttf@sha256:ccb947c207fcc3574e22caecd96a4a021d7985208b06af692ebe7f912995dc05

LABEL maintainer="me@lucerocodes.com"
COPY convert-icons.sh /usr/local/bin
WORKDIR /fonts
VOLUME /fonts

ENTRYPOINT ["/usr/local/bin/convert-icons.sh"]
