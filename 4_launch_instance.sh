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

echo "====================================================="
echo "##### IMPORT VARIABLES FOR NET, IMAGE & FLAVOR  #####"
echo "====================================================="
NET=$(neutron net-list | grep 'private' | awk '{print $2}')
GLANCE=$(glance image-list | grep -i 'cirros' | awk '{print $2}')
FLAVOR=$(nova flavor-list | grep -i 'tiny' | awk '{print $2}')
date=$(date +"%Y-%m-%d_%H-%M-%S")

