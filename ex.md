Add the HashiCorp repo

Amazon Linux

```
wget -O- https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo | sudo tee /etc/yum.repos.d/hashicorp.repo
```

List available packages


```
sudo yum list available | grep hashicorp
```

Enable the test repo for prerelease versions

Edit the repo file at ``/etc/yum.repos.d/hashicorp.repo`` and set ``enabled=1`` for ``[hashicorp-test]``


Now, Install Vault
```
sudo yum install vault
```

Start Vault
```
vault server -dev -dev-listen-address="0.0.0.0:8200"
```
