.PHONY: generate-sdk
generate-sdk:
	flutter pub run build_runner build --delete-conflicting-outputs

deploy-beta:
	cd ios && fastlane beta