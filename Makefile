.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

########################################################
# Site 1
########################################################

.PHONY: ping-dc1
ping-dc1: ## Ping Nodes
	ansible-playbook playbooks/ping.yml -i sites/DC1/inventory.yml -e "target_hosts=DC1_FABRIC"

.PHONY: build-dc1
build-dc1: ## Build Configs
	ansible-playbook playbooks/build.yml -i sites/DC1/inventory.yml -e "target_hosts=DC1_FABRIC"

.PHONY: deploy-dc1
deploy-dc1: ## Deploy Configs via eAPI
	ansible-playbook playbooks/deploy.yml -i sites/DC1/inventory.yml -e "target_hosts=DC1_FABRIC"

.PHONY: cvp-dc1
cvp-dc1: ## Deploy Configs via eAPI
	ansible-playbook playbooks/cvp1.yml -i sites/DC1/inventory.yml

.PHONY: cleanup-dc1
cleanup-dc1: ## Cleanup Configs via eAPI
	ansible-playbook playbooks/cleanup.yml -i sites/DC1/inventory.yml -e "target_hosts=DC1_FABRIC"

.PHONY: static-dc1
static-dc1: ## Cleanup Configs via eAPI
	ansible-playbook playbooks/static_route.yml -i sites/DC1/inventory.yml -e "target_hosts=DC1-BL1"

########################################################
# Site 2
########################################################

.PHONY: ping-dc2
ping-dc2: ## Ping Nodes
	ansible-playbook playbooks/ping.yml -i sites/DC2/inventory.yml -e "target_hosts=DC2_FABRIC"

.PHONY: build-dc2
build-dc2: ## Build Configs
	ansible-playbook playbooks/build.yml -i sites/DC2/inventory.yml -e "target_hosts=DC2_FABRIC"

.PHONY: deploy-dc2
deploy-dc2: ## Deploy Configs via eAPI
	ansible-playbook playbooks/deploy.yml -i sites/DC2/inventory.yml -e "target_hosts=DC2_FABRIC"

.PHONY: cvp-dc2
cvp-dc2: ## Deploy Configs via eAPI
	ansible-playbook playbooks/cvp2.yml -i sites/DC2/inventory.yml

.PHONY: cleanup-dc2
cleanup-dc2: ## Cleanup Configs via eAPI
	ansible-playbook playbooks/cleanup.yml -i sites/DC2/inventory.yml -e "target_hosts=DC2_FABRIC"


########################################################
# WAN & Hosts - Lab Prep
########################################################

.PHONY: preplab
preplab: ## Deploy Configs via eAPI
	ansible-playbook playbooks/preplab.yml -i extra_configs/inventory.yml -e "target_hosts=LAB"
