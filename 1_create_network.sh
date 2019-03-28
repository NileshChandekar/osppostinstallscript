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
 
echo "=============================================="
echo "##### CREATE PRIVATE NETWORK WITH SUBNET #####"
echo "==============================================" 
openstack network create private ; sleep 3


echo "=============================================="
echo "##### CREATE SUBNET FOR PRIVATE NETWORK #####"
echo "=============================================="
neutron subnet-create --name subpriv private 10.10.10.0/24 ; sleep 3


echo "=============================================="
echo "##### LIST THE PRIVATE SUBNET  #####"
echo "=============================================="
neutron subnet-list ; sleep 3 


echo "=============================================="
echo "##### CREATE ROUTER AND ADD INTERFACE  #####"
echo "=============================================="
neutron router-create router1 ; sleep 3

echo "================================================"
echo "##### ADD PRIVATE INTERFACE TO THE ROUTER  #####"
echo "================================================"
neutron router-interface-add router1 subpriv ; sleep 3

echo "=============================================="
echo "##### CREATE PUBLIC NETWORK WITH SUBNET #####"
echo "=============================================="
#a=$(grep bridge_mappings= /etc/neutron/plugins/ml2/openvswitch_agent.ini|cut -f2 -d "="|cut -f1 -d ":")
neutron net-create public --router:external --provider:network_type flat --provider:physical_network datacentre ; sleep 3
#openstack network create public ; sleep 3

echo "=============================================="
echo "##### CREATE SUBNET FOR PUBLIC NETWORK #####"
echo "=============================================="
neutron subnet-create --name subpub public 192.168.100.0/24 --enable-dhcp --allocation-pool start=192.168.100.151,end=192.168.100.160 ; sleep 3

echo "=============================================="
echo "##### ADD PUBLIC INTERFACE TO ROUTER  #####"
echo "=============================================="
neutron net-update --router:external=true public ; sleep 3

echo "=============================================="
echo "##### SHOW PUBLIC NETWORK #####"
echo "=============================================="
neutron net-show public ; sleep 3

echo "=============================================="
echo "##### SET GATEWAY FOR PULIC NETWORK  #####"
echo "=============================================="
neutron router-gateway-set router1 public ; sleep 3

echo "========================"
echo "##### SHOW NETWORK #####"
echo "========================"
neutron net-list


