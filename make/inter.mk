# renovate: datasource=github-releases depName=rsms/inter versioning=semver registryUrl=https://github.com
INTER_VERSION := v4.1
INTER_DIR := $(shell mktemp -d)
INTER_URL := https://github.com/rsms/inter/releases/download/${INTER_VERSION}/Inter-$(shell echo "${INTER_VERSION}" | sed 's/^v//').zip

.PHONY : install-inter
install-inter : create-fontdir
	curl -SL "${INTER_URL}" -o "${INTER_DIR}/file.zip"
	cd "${INTER_DIR}" && unzip -x file.zip
	find "${INTER_DIR}" -type f -name "*.ttf" | xargs -I "{}" cp -v "{}" "${FONTDIR}/"
	@$(MAKE) update-fc-cache

test-inter :
	fc-list -v | grep -i inter\ display

INSTALL_TARGETS += install-inter
TEST_TARGETS += test-inter
