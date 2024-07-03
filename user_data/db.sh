#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install postgresql10 -y
sudo service postgresql initdb
sudo service postgresql start
