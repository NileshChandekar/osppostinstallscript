echo "============================"
echo "##### LIST FLOATING IP #####"
echo "============================"
openstack floating ip list


echo "============================"
echo "##### CREATE FLOATING IP #####"
echo "============================"
openstack floating ip create public

FIP=$(openstack floating ip list |awk '{print $4}' |awk 'NR > 2')
INSTANCE=$(nova list |awk '{print $2}' |awk 'NR > 2')

echo "================================================="
echo "##### ATTACH FLAOTING IP TO CIRROS INSTANCE #####"
echo "================================================="
openstack server add floating ip $INSTANCE $FIP ; sleep 3

clear
echo "============================================="
echo "##### FULLY PROVISIONED CIRROS INSTANCE #####"
echo "============================================="
nova list
