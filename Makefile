SHELL = /bin/bash

requirements:
	pip install -r requirements.txt
	ansible-galaxy collection install -r requirements.yml

deploy:
	ansible-playbook deploy.yml

destroy:
	ansible-playbook destroy.yml
	