# See LICENSE for licensing information.

REBAR := $(shell command -v rebar 2>&1 >/dev/null; if [ $$? -eq 0 ]; then command -v rebar; else echo $(shell pwd)/rebar; fi)
REBAR_BUILD_DIR := $(shell pwd)/.rebar-build

.PHONY: build clean

all: build

build: $(REBAR)
	@$(REBAR) compile

clean:
	@$(REBAR) clean

##
## rebar
##
.PHONY: rebar

rebar: $(REBAR)

$(REBAR):
	@rm -rf $(REBAR_BUILD_DIR)
	git clone git://github.com/rebar/rebar.git $(REBAR_BUILD_DIR)
	cd $(REBAR_BUILD_DIR) && ./bootstrap
	mv $(REBAR_BUILD_DIR)/rebar $(REBAR)
	@rm -rf $(REBAR_BUILD_DIR)