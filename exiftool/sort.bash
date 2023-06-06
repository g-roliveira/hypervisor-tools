mkdir date
find ./source -type f -print0 | xargs -0 mv -t ./date

exiftool -r "-FileCreateDate<CreateDate" ./date
exiftool -r "-FileModifyDate<CreateDate" ./date

mkdir sort
cd sort
exiftool -r "-Directory<CreateDate" -d %Y/%m ../date
