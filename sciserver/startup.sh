#!/bin/bash

# Serve from context setup by sciserver compute
APPS=$(ls /srv/shiny-server)
CONTAINERDIR=/srv/shiny-server/$1
mkdir -p $CONTAINERDIR
for app in $APPS; do
    mv /srv/shiny-server/$app $CONTAINERDIR
done

# If data volume mounted, point to it, otherwise to the packaged example data
if [[ ! -d /home/idies/workspace/c_moor_data ]]; then
    echo "C-MOOR data volume not mounted!"
    echo "
<!DOCTYPE html><html><body>
<h2> Error: C-MOOR data volume not mounted!</h2>
<p> please delete this container and create a new one with data volume attached </p>
</body></html>" > $CONTAINERDIR/index.html
fi

exec /usr/bin/shiny-server
