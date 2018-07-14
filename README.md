# Openstack Post Install Script (RHOSP & RDO) 

	Tested and working on RHOSP-07/08/09/10/11/12 and 13

## Warning For RHOSP - 11 and 12 , 
	

	Uncomment below lines
	~~~
	#a=$(grep bridge_mappings= /etc/neutron/plugins/ml2/openvswitch_agent.ini|cut -f2 -d "="|cut -f1 -d ":")
	#neutron net-create public --router:external --provider:network_type flat --provider:physical_network $a ; sleep 3
	~~~

	Comment below line 
	~~~
	openstack network create public ; sleep 3
	~~~


What's included
---------------
* Network Creation (Private and Public)
* Download ``CIRROS`` image
* Create a tiny flavor 
* Launch Instance
* Attach Floating IP 
* Wipe Out all Post installation. 

Installation steps
------------------
##### AIO (Automate)

```bash
$ git clone https://github.com/NileshChandekar/osppostinstallscript.git
$ cd osppostinstallscript
# ./0_autoinstall.sh
```

Uninstallation  Step
-----------------
```bash
# ./uninstall.sh 
```

Things need to keep in mind.
-----------------

	Private IP range  -  10.10.10.0/24
	Public (provider IP) - 192.168.122.0/24
	This are hard coded in the ``1_create_network.sh`` change this according to your network style.


