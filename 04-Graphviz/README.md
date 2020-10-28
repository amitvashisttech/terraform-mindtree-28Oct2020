# Instroduction tp GraphViz Utility with Apache. 

## Install Apache & GraphViz Packages
```
apt-get update -y 
apt-get install apache2 graphviz -y 
```

## Go to the Resource Dir. & Genrate Terraform Graph. 
```
cd 04-Graphviz
terraform graph > resource.dot
```

## Convert the Resource DOT to SVG Formate.
```
dot resource.dot -Tsvg -o resource.svg
```

## Setup Apache For Hosting Graphviz Images 
```
mkdir -p /var/www/html/Terraform-Images
cp -rf resource.svg /var/www/html/Terraform-Images/01-resource.svg
systemctl restart apache.service
ip addr 
```

## Now explore the Image in your web browser.
