FROM krys/ubuntu-base

COPY files/install-puppet.sh /

RUN bash /install-puppet.sh && rm install-puppet.sh
