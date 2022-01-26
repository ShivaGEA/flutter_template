# Template
Flutter Basic Template Application


**Architecture Design**

![Architecture Diagram](resources/clean_architecture_diagram.png)


**Environments**
	Configuration will be done based on below respective file(environment)
- [Dev](lib/config/env/dev.dart)
- [Prod](lib/config/env//prod.dart)
- [QA](lib/config/env//qa.dart)
- [UAT](lib/config/env//uat.dart)


**Folder Structure**
![Flutter Folder Structure](resources/Flutter%20Folder%20Structure.png)


**Localization**
- add .arb file in [lib/config/localization](lib/config/localization)
- run below command to generate changes
		[flutter gen-l10n]

**Theme**
- add theme file by extending by [MyTheme](lib/config/theme/theme.dart)
- add [theme] instance in [getTheme( themeType)] method in [MyTheme](lib/config/theme/theme.dart)

**Libraries**
- 	State management
	- 	[get](https://pub.dev/packages/get)
- 	Route Management/Routing
	- 	[get](https://pub.dev/packages/get)
- 	Localization & Internationalization
	- 	[flutter_localization]
	- 	[intl](https://pub.dev/packages/intl)
- 	Dependency Injection
	- 	[get](https://pub.dev/packages/get)
- 	Networking
	- 	[dio](https://pub.dev/packages/dio)
	- 	[retrofit](https://pub.dev/packages/retrofit)
- 	Local Storage
	- 	[sqflite](https://pub.dev/packages/sqflite)
	- 	[floor](https://pub.dev/packages/floor) & [floor_annotation](https://pub.dev/packages/floor_annotation)
	- 	[shared_preferences](https://pub.dev/packages/shared_preferences)
- 	Network Images Loading
	- 	[cached_image_network](https://pub.dev/packages/cached_network_image)
- 	Code Analysis
	- 	[lint](https://pub.dev/packages/lint)



