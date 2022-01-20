# Template
Flutter Basic Template Application


**Architecture Design**
![Architecture Diagram](https://github.com/ShivaGEA/flutter_template/blob/main/resources/clean_architecture_diagram.png)


**Environments**
Configuration will be done based on below respective file(environment)
- [Dev](lib/config/env/dev.dart)
- [Prod](lib/config/env//prod.dart)
- [QA](lib/config/env//qa.dart)
- [UAT](lib/config/env//uat.dart)


**Folder Structure**

![Flutter Folder Structure](https://github.com/ShivaGEA/flutter_template/blob/main/resources/Flutter%20Folder%20Structure.png)

#!/bin/bash

#File: tree-md

tree=$(tree -tf --noreport -I '*~' --charset ascii $1 |
       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g')

printf "# Project tree\n\n${tree}"



**Libraries**
- 	State management
  	- 	get
  	- 	flutter_bloc
- 	Dependency Injection
  	- 	get
- 	Route Management/Routing
  	- 	get
- 	Localization & Internationalization
  	- 	flutter_localization
  	- 	intl
- 	Networking
  	- 	dio
  	- 	retrofit
- 	Local Storage
  	- 	sqflite
  	- 	floor & floor_annotation
  	- 	shared_preferences
  	- 	hive
- 	Network Images Loading
  	- 	cached_image_network
  	- 	image widget
- 	Code Analysis
  	- 	lint

