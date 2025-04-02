APORETIC_DIR := $(shell mktemp -d)
APORETIC_URL := https://github.com/protesilaos/aporetic/archive/refs/tags/${APORETIC_VERSION}.tar.gz

.PHONY : install-aporetic
install-aporetic :
	curl -SL "${APORETIC_URL}" -o "${APORETIC_DIR}/file.tar.gz"
	cd "${APORETIC_DIR}" && gzip -cd file.tar.gz | tar -xvf -
	find "${APORETIC_DIR}" -type f -name "*.ttf" | grep -vi unhinted | xargs -I "{}" cp -v "{}" "${FONTDIR}/"

FONT_TARGETS += install-aporetic
