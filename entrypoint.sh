#!/bin/bash
# Stop what we're doing when `docker stop` is called.
trap '/mnt/stop.sh' SIGTERM

# set up phenotips
if [ ! -x '/mnt/start.sh' ]; then 
   # download phenotips if it's not already there.
   if [! -f '/pt.zip' ]; then
      URL="http://nexus.cs.toronto.edu/nexus/content/repositories/releases/org/phenotips/phenotips-standalone/$PT_VERSION/phenotips-standalone-$PT_VERSION.zip"
      curl $URL > pt.zip
   fi

   unzip -d /mnt pt.zip
   DIR_NAME=`ls /mnt`
   cp -r /mnt/$DIR_NAME/* /mnt
   rm -rf /mnt/$DIR_NAME
   rm -rf pt.zip
fi

# turn on debugging
if [ "$PT_DEBUG" = "true" ]; then
   export START_OPTS="$START_OPTS -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"
fi

# start phenotips, background it, and wait.
# this is nescessary because otherwise the trap does not catch the SIGTERM.
"$@" &
wait

