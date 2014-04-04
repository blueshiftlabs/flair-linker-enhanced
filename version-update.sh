#!/bin/bash
sed -nr -e 's/^.*1\.([0-9]{2})\.([0-9]{3,4})\.([0-9]+).*$/\1 \2 \3/p' manifest.json | {
    read OLD_YEAR OLD_DAY OLD_MINOR
    NEW_YEAR=$(date +'%-y')
    NEW_DAY=$(date +'%-m%0d')
    NEW_MINOR=1
    if [ "$OLD_YEAR:$OLD_DAY" == "$NEW_YEAR:$NEW_DAY" ]; then
	NEW_MINOR=$(($OLD_MINOR+1))
    fi

    echo "Updating from v1.$OLD_YEAR.$OLD_DAY.$OLD_MINOR to v1.$NEW_YEAR.$NEW_DAY.$NEW_MINOR"

    sed -i -e "s/1\\.$OLD_YEAR\\.$OLD_DAY\\.$OLD_MINOR/1.$NEW_YEAR.$NEW_DAY.$NEW_MINOR/g" *.js*
}
