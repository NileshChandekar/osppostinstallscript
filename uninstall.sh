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


source /root/keystonerc_admin

neutron net-list
openstack image list
openstack flavor list 


echo "Are you sure you want to wipe out all port configuration?"
select yn in "Yes" "No"
case $yn in
    Yes ) sudo ./6.wipe.sh;;
    No ) exit;;
esac

#sudo ./6.wipe.sh
