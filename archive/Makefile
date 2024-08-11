# Generate an encrypted representation to store the 'awx' and 'root' users password in 'group_vars/all.yml'
encrypt-passwords:
	@read -r -s -p "'awx' user password: " awx_password; \
	echo ""; \
	ansible-vault encrypt_string \
		--vault-password-file $$HOME/.ansible/vaults_pwd/awx \
		--name 'awx_password' \
		$$awx_password

	@read -r -s -p "'root' user password: " root_password; \
	echo ""; \
	ansible-vault encrypt_string \
		--vault-password-file $$HOME/.ansible/vaults_pwd/awx \
		--name 'root_password' \
		$$root_password

# Generate a 'cloud-ini' ISO file to initialise the virtual server
# ---
# The followint command can be used for debugging purpose:
# ---
# genisoimage \
#  	-output build/awx_cloud_init.iso \
#  	-volid cidata \
#  	-rock \
#  	-joliet \
# 	build/user-data build/meta-data
cloud-init:
	ansible-playbook \
		--vault-password-file $$HOME/.ansible/vaults_pwd/awx \
		--inventory inventory.yml \
		cloud-init.yml
