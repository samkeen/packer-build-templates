#!/bin/bash -xe

yum update -y
yum install -y php55-cli awslogs

# aws cloudwatch logs
mkdir -p /var/awslogs/state
service awslogs start
chkconfig awslogs on

