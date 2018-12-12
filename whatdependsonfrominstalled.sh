#!/bin/bash
# g0, 2013, http://alog.ipduh.com/2013/08/which-installed-debian-packages-depend.html
## whatdependsonfrominstalled.sh: find out which installed debian packages depend on the passed debian package
## whatdependsonfrominstalled.sh: usage:: whatdependsonfrominstalled.sh debian-package-name :::eg::: whatdependsonfrominstalled.sh libc6

ME="whatdependsonfrominstalled.sh"
MEAT="/usr/bin/${ME}"

# help
if [ -z $1 ]; then
  egrep '^##' ${MEAT}
  exit 3
fi

for i in `dpkg -l |egrep "^ii" |cut -f3 -d' '`;do

  apt-cache depends ${i} |grep Depends: |grep ${1} > /dev/null
  if [ $? -eq 0 ]; then
	  echo "--"
	  echo ${i};
	  apt-cache depends ${i}|grep ${1}
	  echo "--"
  fi
done

