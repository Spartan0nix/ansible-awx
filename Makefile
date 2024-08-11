SHELL = /bin/bash
-include Makefile.local

# Install Ansible and Python requirements
requirements:
	pip install -r requirements.txt
	ansible-galaxy collection install -r requirements.yml

deploy:
	ansible-playbook \
		--vault-password-file $$HOME/.ansible/vaults_pwd/awx \
		--inventory inventory.yml \
		deploy.yml

get-crendentials:
	ansible \
		--inventory inventory.yml \
		--vault-password-file $$HOME/.ansible/vaults_pwd/awx \
		--module-name ansible.builtin.debug \
		--args "var=ansible_password,ansible_become_password" \
		servers

destroy:
	ansible-playbook destroy.yml
