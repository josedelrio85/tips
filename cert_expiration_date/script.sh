#!/bin/bash

# '/etc/letsencrypt/archive/*/'
folder=/etc/letsencrypt/archive
folderiterate=$folder/*/

echo [Retrieving expiration dates for certificates stored in $folder]
echo 

for dir in $folderiterate    # list directories in the form "/tmp/dirname/"
do
  # remove the trailing "/"
  dir=${dir%*/}
  finaldir=${dir##*/}
  # print everything after the final "/"
  echo $finaldir
  # get expiration date for certificates
  order=$(openssl x509 -dates -noout < $folder/$finaldir/cert1.pem)
  echo $order
  echo ""
done

echo [Finished]