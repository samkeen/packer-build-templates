# packer-build-templates

Example templates for building bronze, silver or gold AMIs to be used in a Continuous Delivery Pipeline

# Required Template user_data Naming when using with Kiln

If you utilize a [user_data](https://www.packer.io/docs/builders/amazon-ebs.html#user_data) file,
 
First, it **must** be implemented with a template variable (of name: `user_data_file_path`) as in this example.

```JSON
{
  "variables": {
    "aws_access_key": "",
    "aws_secret_key": "",
    "source_ami_id": "ami-9ff7e8af",
    "user_data_file_path": "."
  },
  "builders": [{
    "type": "amazon-ebs",
    "access_key": "{{user `aws_access_key`}}",
    "secret_key": "{{user `aws_secret_key`}}",
    "region": "us-west-2",
    "source_ami": "{{user `source_ami_id`}}",
    "instance_type": "t2.micro",
    "ssh_username": "ec2-user",
    "ami_name": "php-cli-base {{timestamp}}",
    "ami_description": "Base machine with php cli, aws cloudwatch logs agent",
    "user_data_file": "{{user `user_data_file_path`}}"
  }]
}
```

Last, the actual file **must* be in the same directory as the Template and **must** have the name: `user_data.sh`

```
├── LICENSE
├── README.md
├── templates
│   └── php-cli
│       ├── template.json
│       └── user_data.sh
```
