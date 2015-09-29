#!/bin/bash

# download phenotips if it's not already there.
if [ ! -x '/mnt/start.sh' ]; then 
   URL="http://nexus.cs.toronto.edu/nexus/content/repositories/releases/org/phenotips/phenotips-standalone/$PT_VERSION/phenotips-standalone-$PT_VERSION.zip"
   curl $URL > phenotips-standalone.zip
   unzip -d /mnt phenotips-standalone.zip
   rm -rf phenotips-standalone.zip
fi

# turn on debugging
if [ "$PT_DEBUG" = "true" ]; then
   export START_OPTS="$START_OPTS -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"
fi

# Stop what we're doing when `docker stop` is called.
trap '/mnt/stop.sh' SIGTERM

exec "$@"

