.PHONY: generate-sdk deploy-beta
generate-sdk:
	flutter pub run build_runner build --delete-conflicting-outputs

deploy-beta:
	cd ios && fastlane beta

new-module:
	mason make module_feature -o lib/modules