wget puppet agent 
sleep 5
rpm -i puppet-agent-1.6.1-1.el7.x86_64.rpm
sleep 1
/opt/puppetlabs/bin/puppet agent --server $PUPPETSERVERNAME --waitforcert 60



