IOSEVKA_AILE_DIR := $(shell mktemp -d)
IOSEVKA_URL := https://github.com/be5invis/Iosevka/releases/download/${IOSEVKA_VERSION}/PkgTTF-IosevkaAile-$(shell echo "${IOSEVKA_VERSION}" | sed 's/^v//').zip

.PHONY : install-iosevka-aile
install-iosevka-aile : create-fontdir
	curl -SL "${IOSEVKA_URL}" -o "${IOSEVKA_AILE_DIR}/file.zip"
	cd "${IOSEVKA_AILE_DIR}" && unzip -x file.zip
	find "${IOSEVKA_AILE_DIR}" -type f -name "*.ttf" | xargs -I "{}" cp -v "{}" "${FONTDIR}/"
	@$(MAKE) update-fc-cache

test-iosevka-aile :
	fc-list -v |grep -i iosevka

INSTALL_TARGETS += install-iosevka-aile
TEST_TARGETS += test-iosevka-aile
