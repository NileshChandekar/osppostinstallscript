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

### Wipe.sh ###


clear
echo "##### THIS WILL WIPE OUT ALL NOVA/GALCE/NETWORK CONFIGURATION #####"
sleep 3
clear

echo "##### DELETE RUNNING INSTANCE #####"
sleep 2
for i in $(nova list  |awk '{print $2}' |awk 'NR > 2'); do nova delete $i;  done; nova list;
sleep 2
clear
echo "##### DELETE UPLOADED GLANCE IMAGES #####"
sleep 2
for i in $(glance image-list |awk '{print $2}' |awk 'NR > 2') ; do  glance image-delete  $i;   done ; glance image-list
sleep 2
clear

echo "##### CLEAR GATEWAY/PORT/INTERFACES AND DELETE ROUTER #####"
sleep 2

for i in $(neutron router-list |awk '{print $2}' |awk 'NR > 2') ;
do
  neutron router-gateway-clear  $i;
  for j in $(neutron router-port-list $i  |awk -F '"'  '{print $4}' |awk 'NR > 2') ;
do
  neutron router-interface-delete $i $j;  neutron router-delete $i;
 done
done
clear

echo "##### CLEAR SUBNET AND FINALLY NEUTRON NETWORK #####"
sleep 2
for k in $(neutron subnet-list |awk '{print $2}' |awk 'NR > 2') ;

 do
  neutron subnet-delete  $k;
for l in $(neutron net-list |awk '{print $2}' |awk 'NR > 2') ;

 do
  neutron net-delete $l;
 done

done

sleep 5
clear

