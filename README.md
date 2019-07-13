# README

## Goal

Deploy a python application to EC2 instances using Ansible

## How does it work ?

- Ansible playbook creates a set of EC2 instances with its associated SG and ELB
- Python application (Flask) files are copied to EC2 instances
- The container is built and started using docker-compose
- A Nginx process is started to redirect incoming traffic from port 80 to the docker container
- Instances are then attached to the ELB

## Prerequisite

- Working ansible installation
- AWS credentials (access & secret key, ec2 ssh key)

## Setup

### AWS Access Key

- Wrap your AWS credentials in an Ansible Vault file that are expected to contain two variables : `aws_access_key` and `aws_secret_key`
- The playbooks expect the the Vault file to be named `aws_keys.yml`

```
ansible-vault create aws_keys.yml
[type in a password]
[type in aws_access_key: ...]
[type in aws_secret_key: ...]
```

### AWS EC2 SSH key

- Add your EC2 private ssh key in the `ansible.cfg` file :

```
private_key_file = /Users/myself/key.pem
```

### Review settings

- Infrastructure settings can be edited in the `vars.yml` file
  - AWS region, instance type, ...

## Run

- There are two playbook available :
  - `flask.yml` will provision infratructure and deploy a containerized Python Flask application
  - `clean.yml` will cleanup all infrastructure
- To run theses playbooks, you can use make

```
make deploy
make clean
```

## What could be done better

- Python application container should be built outside the target instances and pushed to a registry
- Flask built-in appliction server is not production grade, should be replaced it with a compliant WSGI server
