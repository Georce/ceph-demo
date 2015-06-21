# DOCKER-VERSION 1.0.0
#
# Ceph Demo AIO
#
# VERSION 0.0.1

FROM ceph/demo
MAINTAINER Sébastien Han "seb@redhat.com"

# Add bootstrap script
ADD entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

# Add volumes for Ceph config and data
VOLUME ["/etc/ceph","/var/lib/ceph"]

RUN apt-get update

RUN apt-get install shellinabox

# Expose the Ceph ports
EXPOSE 6789 6800 6801 6802 6803 6804 6805 80 4200

# Execute the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
