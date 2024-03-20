#Update Discord tar file
#Usage  ./UpdateDiscord discord-0.0.##.tar.gz 

sudo tar -xzvf $1 -C /opt
sudo ln -sf /opt/Discord/Discord /usr/bin/Discord


