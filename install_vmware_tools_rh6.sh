#!/bin/bash
rm -f /etc/yum.repos.d/vmware.repo
/usr/sbin/virt-what | grep 'vmware' &> /dev/null
if [ $? == 0 ]; then
  if [ ! -f /etc/yum.repos.d/vmwarerhel6.repo ]; then
    {
      echo  "[vmware-tools-collection]" > /etc/yum.repos.d/vmware.repo
      echo  "name=vmware-tools-collection" >> /etc/yum.repos.d/vmware.repo
      echo  "baseurl=file:///nfs/ic/proj/icec/software/yum/repository/rhel6-x64-vmware" >> /etc/yum.repos.d/vmware.repo
      echo  "baseurl=http://icyvbuild001.ic.intel.com/yum/rhel6-x64-vmware/" >> /etc/yum.repos.d/vmware.repo
      echo  "enabled=1" >> /etc/yum.repos.d/vmware.repo
      echo  "gpgcheck=0" >> /etc/yum.repos.d/vmware.repo
      echo  "gpgkey=http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub" >> /etc/yum.repos.d/vmware.repo
      echo  "proxy=_none_" >> /etc/yum.repos.d/vmware.repo
   }
   fi
  echo "VMware detected"
  yum -y install vmware-tools-*
fi
