#!/usr/bin/env bash
# Usage:
# ./transfer_to_gee.sh src_bucket dest_asset
# list=`cat ./gsfile.txt`
# a="gs://palm_mapping/Sumatra/0_oilpalm_maps/"
# b="users/phuntshophuntsho/palm/"
# result=`earthengine create collection users/$2`
# if `test -z "$result"`; then
#     echo $result
#     exit 1
# fi
# In the following loop we get the entire path to all the geotifs using the specified 
# Gcloud bucket. Each file will have a format like this: gs://my_gee_bucket/FILE_January2000.tif
# Each call to earthengine it will launch a task that you can monitor in the JS Code editor 
# at the "tasks" tab.
# for geotiff in "$list"; do  
#     filename=$geotiff
#     asset_id="$geotiff"
#     earthengine upload image --asset_id=users/$1/$asset_id gs://palm_mapping/Sumatra/0_oilpalm_maps/$geotiff
# done
for geotiff in `cat ./spal_15.txt`; do  
    echo "Processing file ..."$geotiff
    filename=`basename $geotiff`
    asset_id=${filename%.*}
    # gs_id="$geotiff"
    earthengine upload image --asset_id=users/$2/$asset_id $geotiff
done
#comannd issued directly with bash
# earthengine upload image --asset_id=users/phuntshophuntsho/palm/borneo_g23_2017_d gs://palm_mapping/Borneo/0_oilpalm_maps/Borneo_grid23_20170000032768-0000032768.tif
# Upload palm sentinel1 palm map tiles of sumatra
# ./transferGC2GE.sh gs://palm_mapping/Sumatra/0_oilpalm_maps/ phuntshophuntsho/palm_sent1_sumatra #use the cat txt file output from gsutil 
# ./transferGC2GE.sh gs://palm_mapping/Borneo/0_oilpalm_maps/ phuntshophuntsho/palm_sent1_borneo
# gsutil ls gs://palm_mapping/Borneo/0_oilpalm_maps/