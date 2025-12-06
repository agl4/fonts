# renovate: datasource=github-releases depName=be5invis/Iosevka versioning=semver registryUrl=https://github.com
IOSEVKA_VERSION := v33.3.6
IOSEVKA_DIR := $(shell mktemp -d)
IOSEVKA_URL := https://github.com/be5invis/Iosevka/releases/download/${IOSEVKA_VERSION}/PkgTTF-Iosevka-$(shell echo "${IOSEVKA_VERSION}" | sed 's/^v//').zip

.PHONY : install-iosevka
install-iosevka : create-fontdir
	curl -SL "${IOSEVKA_URL}" -o "${IOSEVKA_DIR}/file.zip"
	cd "${IOSEVKA_DIR}" && unzip -x file.zip
	find "${IOSEVKA_DIR}" -type f -name "*.ttf" | xargs -I "{}" cp -v "{}" "${FONTDIR}/"
	@$(MAKE) update-fc-cache

test-iosevka :
	fc-list -v | grep -i iosevka\ aile

INSTALL_TARGETS += install-iosevka
TEST_TARGETS += test-iosevka
