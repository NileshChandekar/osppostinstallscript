#!/bin/bash
#  Author / Maintainer : Nilesh Chandekar ncredhat@gmail.com
#
# 
# Licenced under GPLv3, check LICENSE.txt
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

#!/bin/bash

if test -f /root/keystonerc_admin ; then

source /root/keystonerc_admin
echo "sourcing /root/keystonerc_admin"

elif test -f /home/stack/overcloudrc ; then

source /home/stack/overcloudrc
echo "sourcing /home/stack/overcloudrc"

else

echo "I can't find your openstack environment file."

fi



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
