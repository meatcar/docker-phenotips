Phenotips Docker Container
=================

PhenoTips is a software tool for collecting and analyzing phenotypic
information for patients with genetic disorders. See http://phenotips.org/ for
more details.

## Usage: 

    docker run --name phenotips -v /phenotips/root/dir:/mnt -p 8080:8080 -d meatcar/phenotips

Now you can use PhenoTips at http://localhost:8080/

The container can also expose a debugging port, when using the docker image for
PhenoTips development. Start docker like shown below, then connect a java
debugger to `localhost:5050`.

    docker run --name phenotips -v /phenotips/root/dir:/mnt -p 8080:8080 -e PT_DEV=true -p 5050:5050 -d meatcar/phenotips

See container at: https://registry.hub.docker.com/u/meatcar/infobright/
