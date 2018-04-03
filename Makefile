repo_organization = skycatch
repo_name = $(shell basename $(shell git config --get remote.origin.url) | cut -d. -f1)
VARIANTS = alpine
TERRAFORM_VERSION = 0.11.5
TERRAFORM_SHA256SUM = 131c440263382c79c7f783b70ff35cd1d03eb31c44f7738d153d95a0b8436ac9

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