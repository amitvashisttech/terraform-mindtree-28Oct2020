# Terratest Setup

## Install GCC
```
apt-get install gcc
```

## Install & Configure Go Lang. 
```
wget https://dl.google.com/go/go1.15.2.linux-amd64.tar.gz
tar -xvf go1.15.2.linux-amd64.tar.gz
mv go /usr/local
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$PATH
go version
```

## Download Terratest Utils
```
git clone https://github.com/gruntwork-io/terratest.git

```

## To Run the test go to the Test Dir, I.E 01-Hello-World
```
go test -v 
```
