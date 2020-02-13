.PHONY: main

main: clean bundle installer

install:
	@echo "Opening installer..."
	@open "build/KhmerUnicodeInstaller/Khmer Unicode Installer.pkg"

bundle:
	@echo "Building Khmer Unicode Keyboard [Bundle]\n"
	@xcodebuild -project src/KhmerUnicode.xcodeproj \
				-scheme "[Release] KhmerUnicode" \
				build

installer:
	@echo "Building Khmer Unicode Keyboard [Installer]\n"
	@echo "Copying KhmerUnicode.bundle..."
	@cp -r "build/KhmerUnicode/Build/Products/Release/KhmerUnicode.bundle" \
		"Library/Keyboard Layouts"
	@mkdir build/KhmerUnicodeInstaller
	@/usr/local/bin/packagesbuild \
		--verbose \
		./Packages.pkgproj

clean:
	@echo "Cleaning up..."
	@echo "Removing build/KhmerUnicode directory..."
	@rm -rf "build/KhmerUnicode"
	@echo "Removing build/KhmerUnicodeInstaller directory..."
	@rm -rf "build/KhmerUnicodeInstaller"
	@echo "Removing build/ModuleCache.noindex directory..."
	@rm -rf "build/ModuleCache.noindex"
	@echo "Removing Library/Keyboard Layouts/KhmerUnicode.bundle from project..."
	@rm -rf "Library/Keyboard Layouts/KhmerUnicode.bundle"
