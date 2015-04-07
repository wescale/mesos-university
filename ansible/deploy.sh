#!/bin/bash

ansible-playbook -i inventory/ec2.py --extra-vars "img_name='$IMAGE_NAME' img_version='$GO_TO_REVISION'" playbooks/mesos-slaves-docker-pull.yml