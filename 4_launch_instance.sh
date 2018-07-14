echo "====================================================="
echo "##### IMPORT VARIABLES FOR NET, IMAGE & FLAVOR  #####"
echo "====================================================="
NET=$(neutron net-list | grep 'private' | awk '{print $2}')
GLANCE=$(glance image-list | grep -i 'cirros' | awk '{print $2}')
FLAVOR=$(nova flavor-list | grep -i 'tiny' | awk '{print $2}')
date=$(date +"%Y-%m-%d_%H-%M-%S")

