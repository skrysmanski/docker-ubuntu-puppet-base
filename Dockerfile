FROM krys/ubuntu-base

COPY files/install-puppet.sh /
RUN bash /install-puppet.sh && rm install-puppet.sh

COPY files/puppet-apply.sh /
RUN chmod +x /puppet-apply.sh && mkdir /puppet-modules
