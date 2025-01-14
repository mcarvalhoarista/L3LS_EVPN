.PHONY: help
help: ## Display help message
    @grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

########################################################
# Site 1
########################################################

.PHONY: build-dc1
build-dc1: ## Build Configs
    ansible-playbook playbooks/build.yml -i sites/DC1/inventory.yml -e "target_hosts=DC1_FABRIC"

.PHONY: deploy-dc1
deploy-dc1: ## Deploy Configs via eAPI
    ansible-playbook playbooks/deploy.yml -i sites/DC1/inventory.yml -e "target_hosts=DC1_FABRIC"

########################################################
# Site 2
########################################################

.PHONY: build-dc2
build-dc2: ## Build Configs
    ansible-playbook playbooks/build.yml -i sites/DC2/inventory.yml -e "target_hosts=DC2_FABRIC"

.PHONY: deploy-dc2
deploy-dc: ## Deploy Configs via eAPI
    ansible-playbook playbooks/deploy.yml -i sites/DC2/inventory.yml -e "target_hosts=DC2_FABRIC"
