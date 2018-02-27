repo_organization = skycatch
repo_name = $(shell basename $(shell git config --get remote.origin.url) | cut -d. -f1)
VARIANTS = alpine
TERRAFORM_VERSION = 0.11.3
TERRAFORM_SHA256SUM = 6b8a7b83954597d36bbed23913dd51bc253906c612a070a21db373eab71b277b

build:
	for variant in $(VARIANTS); do \
		repo_organization=$(repo_organization) \
		repo_name=$(repo_name) \
		VARIANT=$$variant \
		TERRAFORM_VERSION=$(TERRAFORM_VERSION) \
		TERRAFORM_SHA256SUM=$(TERRAFORM_SHA256SUM) \
		make -C $$variant; \
	done

push:
	for variant in $(VARIANTS); do \
		repo_organization=$(repo_organization) \
    	repo_name=$(repo_name) \
		VARIANT=$$variant \
		TERRAFORM_VERSION=$(TERRAFORM_VERSION) \
		TERRAFORM_SHA256SUM=$(TERRAFORM_SHA256SUM) \
		make push -C $$variant; \
	done

upload: push