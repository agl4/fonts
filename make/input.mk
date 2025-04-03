INPUT_DIR := $(shell mktemp -d)
INPUT_URL := https://input.djr.com/build/?fontSelection=whole&a=0&g=0&i=0&l=0&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do&email=agl%40kxxp.net

.PHONY : install-input
install-input : create-fontdir
	curl -SL "${INPUT_URL}" -o "${INPUT_DIR}/file.zip"
	cd "${INPUT_DIR}" && unzip -x file.zip
	find "${INPUT_DIR}" -type f -name "*.ttf" | xargs -I "{}" cp -v "{}" "${FONTDIR}/"

INSTALL_TARGETS += install-input
