FROM debian:stretch-slim

RUN \
  apt-get update && apt-get install -y \
  mysql-client \
  python3 \
  python3-pip \
  python3-setuptools \
  groff \
  less \
  && pip3 install --upgrade pip \
  && pip install awscli --upgrade --user \
  && apt-get clean \
  && rm -rf /var/lib/apt

ADD s3-backup-to-rds.sh .
RUN chmod 755 s3-backup-to-rds.sh

ENTRYPOINT ["./s3-backup-to-rds.sh"]
