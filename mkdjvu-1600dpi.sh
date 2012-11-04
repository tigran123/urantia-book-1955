#!/bin/bash

pathlist=$(find Guardian-Plates-Archive-Quality-Text-Block-tif -type f -name '*.tif')
for path in $pathlist
do
   file=$(basename "$path") 
   dir=$(dirname "$path") 
   echo "Processing \"$file\" in \"$dir\""
   mkdir -p djvu-1600dpi/"${dir}"
   cjb2 "${path}" "djvu-1600dpi/${path}".djvu
   if [ $? -ne 0 ] ; then
       echo "ERROR: failed: cjb2 \"${path}\" \"djvu-1600dpi/${path}\".djvu"
       exit 1
   fi
done
