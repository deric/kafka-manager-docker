NAME=deric/kafka-manager

release:
	$(call RELEASE,$(v))

build:
	$(call BUILD,$(v))

define BUILD
	docker build --build-arg VERSION=$(1) -t $(NAME) .
	docker tag $(NAME) $(NAME):$(1)
endef

define RELEASE
	$(call BUILD,$(1));
	docker tag $(NAME) $(NAME):$(1)
	docker push $(NAME):$(1)
endef

bash:
	docker run --entrypoint /bin/bash -it $(NAME)
