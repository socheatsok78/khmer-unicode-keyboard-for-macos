XOCDEBUILD=/usr/bin/xcodebuild
PACKAGES=/usr/local/bin/packagesbuild
CONFIGURATION_BUILD_DIR=$(PWD)/build/KhmerUnicodeBundle/Products/Release

.PHONY: main

main: clean build installer

install:
	@echo "Opening installer..."
	@open "build/KhmerUnicodeInstaller/Khmer Unicode Installer.pkg"

build-info:
	@echo "Bundle build settings..."
	@$(XOCDEBUILD) -project src/KhmerUnicodeBundle/KhmerUnicode.xcodeproj \
		-scheme "[Release] KhmerUnicode" \
		-showBuildSettings \
		CONFIGURATION_BUILD_DIR=$(CONFIGURATION_BUILD_DIR)

.PHONY: build
build: build-info
	@mkdir -p build
	@echo "Building Khmer Unicode Keyboard [Bundle]\n"
	@$(XOCDEBUILD) -project src/KhmerUnicodeBundle/KhmerUnicode.xcodeproj \
				-scheme "[Release] KhmerUnicode" \
				build \
				CONFIGURATION_BUILD_DIR=$(CONFIGURATION_BUILD_DIR)
	@echo "Copying KhmerUnicode.bundle to KhmerUnicodeInstaller..."
	@cp -r "build/KhmerUnicodeBundle/Products/Release/KhmerUnicode.bundle" \
		"src/KhmerUnicodeInstaller/Library/Keyboard Layouts"
	@echo "\n[DONE] Ready to build the installer!"

installer:
	@echo "Building Khmer Unicode Keyboard [Installer]\n"
	@rm -rf "build/KhmerUnicodeInstaller"
	@mkdir build/KhmerUnicodeInstaller
	@$(PACKAGES) \
		--verbose \
		./src/KhmerUnicodeInstaller/Packages.pkgproj \

clean:
	@echo "Cleaning up..."
	@rm -rf build
	@rm -rf "src/KhmerUnicodeInstaller/Library/Keyboard Layouts/KhmerUnicode.bundle"
	@echo "[DONE] Cleanup completed!\n"
