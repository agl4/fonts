APORETIC_DIR := $(shell mktemp -d)
APORETIC_URL := https://github.com/protesilaos/aporetic/archive/refs/tags/${APORETIC_VERSION}.tar.gz

.PHONY : install-aporetic
install-aporetic : create-fontdir
	curl -SL "${APORETIC_URL}" -o "${APORETIC_DIR}/file.tar.gz"
	cd "${APORETIC_DIR}" && gzip -cd file.tar.gz | tar -xvf -
	find "${APORETIC_DIR}" -type f -name "*.ttf" | grep -vi unhinted | xargs -I "{}" cp -v "{}" "${FONTDIR}/"

test-aporetic :
	fc-list -v | grep -i aporetic

INSTALL_TARGETS += install-aporetic
TEST_TARGETS += test-aporetic
