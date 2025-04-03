IOSEVKA_DIR := $(shell mktemp -d)
IOSEVKA_URL := https://github.com/be5invis/Iosevka/releases/download/${IOSEVKA_VERSION}/PkgTTF-Iosevka-$(shell echo "${IOSEVKA_VERSION}" | sed 's/^v//').zip

.PHONY : install-iosevka
install-iosevka : create-fontdir
	curl -SL "${IOSEVKA_URL}" -o "${IOSEVKA_DIR}/file.zip"
	cd "${IOSEVKA_DIR}" && unzip -x file.zip
	find "${IOSEVKA_DIR}" -type f -name "*.ttf" | xargs -I "{}" cp -v "{}" "${FONTDIR}/"

test-iosevka :
	fc-list -v | grep -i iosevka

INSTALL_TARGETS += install-iosevka
TEST_TARGETS += test-iosevka
