#!/bin/bash


write_state=`sed '/^write_state=/!d;s/.*=//' /svn/state`
if [ "$write_state" = "yes" ]; then
    echo "yes"
    apachectl -k restart
    exit
fi

mkdir -p $SVN_REPO_PATH
svnadmin create $SVN_REPO_PATH/$SVN_REPO_NAME
chmod -R  a+w $SVN_REPO_PATH/$SVN_REPO_NAME

cat >> /etc/apache2/apache2.conf  <<EOF
  LoadModule dav_module modules/mod_dav.so
  LoadModule dav_svn_module modules/mod_dav_svn.so 
  LoadModule authz_svn_module modules/mod_authz_svn.so
  <Location /$SVN_REPO_NAME>
      DAV svn
      SVNPath $SVN_REPO_PATH/$SVN_REPO_NAME
  </Location>
EOF

apachectl -k restart

sed -i 's/write_state=no/write_state=yes/' /svn/state
