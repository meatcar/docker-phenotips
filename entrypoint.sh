#!/bin/bash
# Stop what we're doing when `docker stop` is called.
trap '/mnt/stop.sh' SIGTERM

# download phenotips if it's not already there.
if [ ! -x '/mnt/start.sh' ]; then 
   URL="http://nexus.cs.toronto.edu/nexus/content/repositories/releases/org/phenotips/phenotips-standalone/$PT_VERSION/phenotips-standalone-$PT_VERSION.zip"
   curl $URL > phenotips-standalone.zip
   unzip -d /mnt phenotips-standalone.zip
   DIR_NAME=`ls /mnt`
   cp -r /mnt/$DIR_NAME/* /mnt
   rm -rf /mnt/$DIR_NAME
   rm -rf phenotips-standalone.zip
fi

# turn on debugging
if [ "$PT_DEBUG" = "true" ]; then
   export START_OPTS="$START_OPTS -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"
fi

# start phenotips, background it, and wait.
# this is nescessary because otherwise the trap does not catch the SIGTERM.
"$@" &
wait

