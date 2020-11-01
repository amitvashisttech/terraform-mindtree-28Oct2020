# Prerequisites
```
apt-get update
apt-get install jq wget unzip -y 
```

# Download Packer 
```
 wget https://releases.hashicorp.com/packer/1.5.6/packer_1.5.6_linux_amd64.zip -P /root/
```

# Install Packer 
```
cd /root
unzip packer_1.5.6_linux_amd64.zip
mv packer /usr/bin/
chmod +x /usr/bin/packer
```

# Verify Packer
```
packer --version
```





