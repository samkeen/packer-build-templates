# Notes

`template.json` should work for VPC only (modern) accounts.

For older accounts that support EC2 Classic, you need to use `template-specify-vpc.json` which specifies 
the vpc and subnet to launch into. ([Packer Docs](https://www.packer.io/docs/builders/amazon-ebs.html))