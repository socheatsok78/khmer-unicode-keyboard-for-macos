# Changelogs

## 1.2.5 (Build 520)

- New: CMS signature support. This should help notarizing a distribution/flat package.
- New: Dark Mode support first attempt.
- Enh: Use labeled colors in UI whenever possible.
- Enh: The contents of the menu of the popup button of the Presentation > Installation step closely matches the order of languages in the License step of - Installer.app. (This could also be seen as a regression rdar://45713825 )
- Enh: Switching the selected language through the popup button of the Presentation > Installation step switches the localization of the right part of the "window".
- Fix: Fix some native language names.
- Fix: The Introduction and ReadMe documents should have been rendered in Black & White on macOS Mojave in the Presentation tab to match what Installer.app does.
- Fix: The list of documents for the Introduction, ReadMe, License and Summary panes was not sorted when needed.
- Fix: The ReadMe and License text views were not resized appropriately in the Presentation tab.
- Fix: Drag and dropping a document in the list of localized licenses could create a broken English entry if all supported localizations were already in the list.
- Fix: The owner and group of symbolic links were not automatically set appropriately.
- Fix: The domains XML entity could be added in cases it should not be.
- Fix: A choice could disappear when performing multiple grouping in the Presentation > Installation Type step.
- Fix: Duplicating a package within a distribution project would not work correctly if the payload pane has not been visited at least once. Many thanks to the user - who reported this bug and the one above.
- Fix: The background of some group views would not be rendered correctly when the window was resized.
- Fix: Fix a crash that could occur when closing the "Must Close Applications" editor.
