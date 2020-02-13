.PHONY: main

main: clean bundle installer

install:
	@echo "Opening installer..."
	@open "build/KhmerUnicodeInstaller/Khmer Unicode Installer.pkg"

bundle:
	@echo "Building Khmer Unicode Keyboard [Bundle]\n"
	@xcodebuild -project src/KhmerUnicodeBundle/KhmerUnicode.xcodeproj \
				-scheme "[Release] KhmerUnicode" \
				build
	@echo "Removing existing KhmerUnicode.bundle from KhmerUnicodeInstaller..."
	@rm -rf "src/KhmerUnicodeInstaller/Library/Keyboard Layouts/KhmerUnicode.bundle"
	@echo "Copying KhmerUnicode.bundle to KhmerUnicodeInstaller..."
	@cp -r "build/KhmerUnicodeBundle/Products/Release/KhmerUnicode.bundle" \
		"src/KhmerUnicodeInstaller/Library/Keyboard Layouts"
	@echo "\n[DONE] Ready to build the installer!"

installer:
	@echo "Building Khmer Unicode Keyboard [Installer]\n"
	@mkdir build/KhmerUnicodeInstaller
	@/usr/local/bin/packagesbuild \
		--verbose \
		./src/KhmerUnicodeInstaller/Packages.pkgproj

clean:
	@echo "Cleaning up..."
	@rm -rf build/temp/*/
	@echo "Removing build/KhmerUnicodeBundle directory..."
	@rm -rf "build/KhmerUnicodeBundle"
	@echo "Removing build/KhmerUnicodeInstaller directory..."
	@rm -rf "build/KhmerUnicodeInstaller"
	@echo "[DONE] Cleanup completed!\n"
