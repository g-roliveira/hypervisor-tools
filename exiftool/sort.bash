find ./source -type f -print0 | xargs -0 mv -t ./date

exiftool -vr "-FileCreateDate<CreateDate" ./date
exiftool -vr "-FileModifyDate<CreateDate" ./date

exiftool -vr -d %Y ./date
exiftool -vr -d %m ./date
