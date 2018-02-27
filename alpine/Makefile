build:
	docker build --build-arg TERRAFORM_VERSION=$(TERRAFORM_VERSION) --build-arg TERRAFORM_SHA256SUM=$(TERRAFORM_SHA256SUM) --force-rm --cpu-quota=1800000 --cpuset-cpus="0-1" --cpu-shares=102400 --memory=50GB \
		-t ${repo_organization}/${repo_name}:$(VARIANT)-$(TERRAFORM_VERSION) .

push:
	docker push $(repo_organization)/$(repo_name):$(VARIANT)-$(TERRAFORM_VERSION)
