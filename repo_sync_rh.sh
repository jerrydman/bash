
echo "Repo Sync Complete" | mail -s " RHEL 6 Sync Complete" email@email.com
sync --repoid=rhel-x86_64-server-6 --download_path=/temp/repo/rhel6/ -l
sleep 10
createrepo /temp/repo/rhel6
sleep 10
reposync --repoid=vmware-tools-collection --download_path /nfs/ic/proj/icec/software/yum/repository/rhel6-x64-vmware
createrepo /nfs/ic/proj/icec/software/yum/repository/rhel5-x64-vmware


reposync --repoid=epel --download_path=/temp/repo/epel/epel_6/ -l

echo "Repo Sync Complete" | mail -s " RHEL Sync Complete" email@email.com
