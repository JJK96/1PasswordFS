install_deps:
	./install_dependencies.sh

install: install_deps
	./install.sh

uninstall:
	./uninstall.sh

.PHONY: install_deps install
