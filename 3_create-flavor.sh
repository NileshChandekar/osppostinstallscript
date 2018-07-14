echo "=========================="
echo "##### CREATE FLAVOR  #####"
echo "=========================="
openstack flavor create --id auto --vcpus 1 --ram 512 --disk 10  m1.tiny.test ; sleep 3
echo "=========================="
echo " ##### LIST THE FLAVOR"
echo "=========================="
openstack flavor list

