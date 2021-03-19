#!/bin/bash

# Serve from context setup by sciserver compute
CONTAINERDIR=/srv/shiny-server/$1
mkdir -p $CONTAINERDIR

# If data volume mounted, point to it, otherwise to the packaged example data
if [[ ! -d /home/idies/workspace/c_moor_data ]]; then
    echo "C-MOOR data volume not mounted!"
    echo "
<!DOCTYPE html><html><body>
<h2> Error: C-MOOR data volume not mounted!</h2>
<p> please delete this container and create a new one with data volume attached </p>
</body></html>" > $CONTAINERDIR/index.html
else
    # get the latest code tutorials
    cd /home/idies/cure-rnaseq
    git fetch origin
    git reset --hard origin/master
    mv tutorials/* $CONTAINERDIR/
fi

exec /usr/bin/shiny-server
