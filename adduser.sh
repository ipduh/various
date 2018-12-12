#!/bin/bash
##adduser.sh
###Add a system user
####g0 2010 ,kod.ipduh.com

INTERACTIVE=1

GROUPID=""
GROUPNAME=""
USERID=""
USERNAME=""
USERHOMEDIR=""
USERSHELL=""
USERCOMMENT=""

if [ "$INTERACTIVE" -eq 1 ] ; then

  echo "Add User:"
  read -p "Enter GROUPID     : " GROUPID;
  read -p "Enter GROUPNAME   : " GROUPNAME;
  read -p "Enter USERID      : " USERID;
  read -p "Enter USERNAME    : " USERNAME;

  read -p "Enter USER HOME DIRECTORY ( Or hit enter for /home/$USERNAME ): " USERHOMEDIR;

  if [ -z "$USERHOMEDIR" ]
  then
    USERHOMEDIR="/home/${USERNAME}"
  fi

  read -p "Enter USERSHELL   : " USERSHELL;
  read -p "Enter USERCOMMENT : " USERCOMMENT;

else

  GROUPID=$1
  GROUPNAME=$2
  USERID=$3
  USERNAME=$4
  USERHOMEDIR=$5
  USERSHELL=$6
  USERCOMMENT=$7

fi

groupadd -g $GROUPID $GROUPNAME
cp -r /etc/skel $USERHOMEDIR
useradd -u $USERID -g $GROUPID -d "$USERHOMEDIR" -s "$USERSHELL" -c "$USERCOMMENT" $USERNAME
chown -R $USERNAME.$GROUPNAME $USERHOMEDIR
passwd $USERNAME

if [ "$INTERACTIVE" -eq 1 ] ; then
  echo " "
  echo -n "User:"
  grep $USERNAME /etc/passwd
  echo ""
  echo -n "Group:"
  grep $GROUPNAME /etc/group
  echo ""
  echo "$USERNAME home Dir $USERHOMEDIR long listing:"
  ls -las $USERHOMEDIR
  echo " "
  echo "."
fi
