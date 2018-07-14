echo "================================="
echo "##### DOWNLOAD CIRROS IMAGE #####"
echo "================================="
sudo yum install wget -y 
cd /root
rm -fr cirros*
sudo wget http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img ; sleep 3

echo "==============================="
echo "##### CREATE GLANCE IMAGE #####"
echo "==============================="
glance image-create --name "cirros_0.3.4" --disk-format qcow2 --container-format bare  --file cirros-0.3.4-x86_64-disk.img ; sleep 3
glance image-list
