VERSION := $(shell cat VERSION)
export PATH := bin:$(PATH)

tools:
	@bash install_deps.sh

.PHONY: bump-patch
bump-patch:
	@semver bump patch $(VERSION) > VERSION
	@echo "Bumped version to $(shell cat VERSION)"

.PHONY: bump-minor
bump-minor:
	@semver bump minor $(VERSION) > VERSION
	@echo "Bumped version to $(shell cat VERSION)"

.PHONY: bump-major
bump-major:
	@semver bump major $(VERSION) > VERSION
	@echo "Bumped version to $(shell cat VERSION)"

.PHONY: bump-beta
bump-beta:
	@semver bump prerel beta $(VERSION) > VERSION
	@echo "Bumped version to $(shell cat VERSION)"

.PHONY: tag
tag: ## Create a new git tag to prepare to build a release.
	git tag -sa $(VERSION) -m "$(VERSION)"
	@echo "Run git push origin $(VERSION) to push your new tag to GitHub and trigger a release."

.PHONY: bump-release
bump-release:
	@semver bump release $(VERSION) > VERSION
	@echo "Bumped version to $(shell cat VERSION)"

