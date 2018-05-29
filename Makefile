NAME=deric/kafka-manager
v ?= 1.3.3.17

release: build
	$(call RELEASE,$(v))

build:
	docker pull `head -n 1 Dockerfile | awk '{ print $$2 }'`
	$(call BUILD,$(v))

run: build
	docker run -it $(NAME)

define BUILD
	docker build --build-arg VERSION=$(1) -t $(NAME) .
	docker tag $(NAME) $(NAME):$(1)
endef

define RELEASE
	$(call BUILD,$(1));
	git push
	docker tag $(NAME) $(NAME):$(1)
	docker push $(NAME):$(1)
endef

bash:
	docker run --entrypoint /bin/bash -it $(NAME)
