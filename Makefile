lint:
	docker run --rm \
		--network none \
		--read-only \
		--cap-drop ALL \
		--security-opt no-new-privileges:true \
		--user 65534:65534 \
		-v $$(pwd):/repo:ro \
		--workdir /repo \
		kjanat/actionlint:1.17.1@sha256:c0a63b3e5c974c2466ead39404b70e448176beaff8c5ec7af0b2e96191aea661 -color


tag-release:
	git tag v1 --force
	git push --tags --force
