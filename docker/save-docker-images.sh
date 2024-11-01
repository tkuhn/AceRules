#!/bin/bash

mkdir -p images

docker save tkuhn/acerules | gzip -c > images/acerules.tar.gz
docker save tkuhn/acerules-webservice | gzip -c > images/acerules-webservice.tar.gz
docker save tkuhn/acerules-webservice:with-smodels | gzip -c > images/acerules-webservice_with-smodels.tar.gz
