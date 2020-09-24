# update-droplet-firewall

Install doctl
----
```
sudo snap install doctl
```

Auth digital ocean account
---
The token can be generated [Digital ocean API token](https://cloud.digitalocean.com/account/api/tokens)
```
doctl auth init
DigitalOcean access token:
```

Modify shell script 
---

```
host=
firewall-id=
```

The firewall id can be found with this command:
```
doctl compute firewall list
```

Move script and make it executable
---
```
chmod +x update-do-firewall.sh
mv update-do-firewall.sh /usr/local/bin/
```

Create cronjob to run this on a schedule
---
```
*/5 * * * * /usr/local/bin/update-do-firewall.sh
```
