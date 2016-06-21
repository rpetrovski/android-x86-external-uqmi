Android build of [uqmi](http://git.openwrt.org/?p=project/uqmi.git;a=summary)

Clone to external/uqmi
Don't forget the dependencies: [libubox](https://github.com/rpetrovski/android-x86-external-libubox) and [json-c](https://github.com/rpetrovski/android-x86-external-json-c)


##### Notes on establishing data connection.
Assuming that card does not require PIN code to operate. This is essentially a compilation of https://forum.openwrt.org/viewtopic.php?id=61052
###### To reset card if it is not responding try
```
 $ uqmi -d /dev/cdc-wdm0 --reset-dms
```
###### Make sure the autoconnect is disabled. Otherwise it typically establishes connection in raw-ip format which is not compatible with qmi.
```
 $ uqmi -d /dev/cdc-wdm0 --set-autoconnect disabled
```
###### Make sure device is operating in 802.3 mode
```
 $ umqi -d /dev/cdc-wdm0 --wda-set-data-format 802.3
 $ uqmi -d /dev/cdc-wdm0 --get-client-id wds
 9
 $ uqmi -d /dev/cdc-wdm0 --set-client-id wds,9  --start-network payandgo.o2.co.uk --ip-family ipv4
 1205735088
```
###### Check the connection state
```
 $ uqmi -d /dev/cdc-wdm0 --get-current-settings
"Out of call"
```
"Out of call" indicates no connection. Ohterwise you get a json printout of ip, gatway, dns and other stuff.

To get the network interface configured with DHCP
```
 $ ifconfig wwan0 up
 $ dhcpcd wwan0
```
setprop net.dns1 does not work anymore. For marshmallow the following command does the job:
```
 $ ndc resolver setnetdns wwan0 "" 8.8.8.8 8.8.4.4
```
You can use the dns server ip addresses from card network configuration or the ones above.
