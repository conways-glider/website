ZOLA_VERSION := 0.22.1

.PHONY: build-wrangler
build-wrangler:
	curl -sLJO "https://github.com/getzola/zola/releases/download/v$(ZOLA_VERSION)/zola-v$(ZOLA_VERSION)-x86_64-unknown-linux-gnu.tar.gz"
	tar -xf zola-v$(ZOLA_VERSION)-x86_64-unknown-linux-gnu.tar.gz
	git submodule update --init --recursive
	./zola build

.PHONY: build
build:
	git submodule update --init --recursive
	zola build

.PHONY: serve
serve:
	zola serve

.PHONY: serve-drafts
serve-drafts:
	zola serve --drafts
