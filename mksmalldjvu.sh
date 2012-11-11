#!/bin/bash

pathlist=$(find TIFF/Guardian-Plates-Print-Quality-Text-Block_tif -type f -name '*.tif')
for path in $pathlist
do
   file=$(basename "$path") 
   dir=$(dirname "$path") 
   echo "Processing \"$file\" in \"$dir\""
   mkdir -p djvu/"${dir}"
   cjb2 -losslevel 200 "${path}" "djvu/${path}".djvu
   if [ $? -ne 0 ] ; then
       echo "ERROR: failed: cjb2 \"${path}\" \"djvu/${path}\".djvu"
       exit 1
   fi
done
