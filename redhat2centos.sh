#Script to convert from Red hat to CentOS
#Created by Jerry Reid

#Created the centos directory
cd ~
mkdir centos
cd centos


#sets proxy
export http_proxy=$PROXY
export https_proxy=$PROXY


#pulls CentOS binaries
wget http://mirror.centos.org/centos/6/os/x86_64/RPM-GPG-KEY-CentOS-6
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/centos-release-6-8.el6.centos.12.3.x86_64.rpm
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/yum-3.2.29-73.el6.centos.noarch.rpm
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/pum-utils-1.1.30-37.el6.noarch.rpm
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/yum-plugin-fastestmirror-1.1.30-37.el6.noarch.rpm
wget http://mirror.centos.org/centos/6/os/x86_64/Packages/centos-indexhtml-6-2.el6.centos.noarch.rpm

sleep 5

rpm --import RPM-GPG-KEY-CentOS-6
sleep 5


mv /etc/yum.repos.d/*.repo /tmp/repobkup
#removes red hat copyrighted binaries

yum remove -y rhnlib abrt-plugin-bugzilla redhat-release-notes*
sleep 5

rpm -e --nodeps redhat-release-server-6Server redhat-indexhtml
sleep 5
mv /tmp/repobkup/*.repo /etc/yum.repos.d/
sleep 5
rm /etc/yum.repos.d/redhat.repo


#installs centos rpms
cd ~/centos
sleep5
rpm -i  *.rpm
sleep 5
