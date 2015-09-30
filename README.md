Phenotips Docker Container
=================

PhenoTips is a software tool for collecting and analyzing phenotypic
information for patients with genetic disorders. See http://phenotips.org/ for
more details.

## Usage: 

    docker run -d --name phenotips \
        -v /phenotips/root/dir:/mnt \
        -p 8080:8080 \
        meatcar/phenotips

Now you can use PhenoTips at http://localhost:8080/, and PhenoTips' state will
be preserved in `/phenotips/root/dir` on your machine.

To run a different PhenoTips version, set the `PT_VERSION` environment variable
to the version you want.

The container can also expose a debugging port, when using the docker image for
PhenoTips development. Set the `PT_DEBUG=true` environment variable on start,
then connect your debugger to `localhost:5050`.

    docker run -d --name phenotips \
        -v /phenotips/root/dir:/mnt \
        -p 8080:8080 \
        -e PT_DEBUG=true \
        meatcar/phenotips

If you want to pass a pre-built zip to the image, just mount the zip as
`/pt.zip`:

    docker run -d --name phenotips \
        -v /phenotips/root/dir:/mnt \
        -v /path/to/your/phenotips-standalone-99.9SNAPSHOT.zip:/pt.zip \
        -p 8080:8080 \
        meatcar/phenotips

See container at: https://registry.hub.docker.com/u/meatcar/infobright/
