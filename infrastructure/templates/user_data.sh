#!/bin/bash
yum -y update
yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
systemctl start amazon-ssm-agent
amazon-linux-extras enable ansible2
yum install -y ansible

sudo ansible-playbook -i inventory playbook.yml


