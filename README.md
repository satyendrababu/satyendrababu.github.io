# simple_ehr

A Simple EHR project created in flutter by using [get_it] for dependency injection, [provider] for state management,
[dio] for network api calling and [go_router] for routing the pages.
This project is following the MVVM architectural design pattern.


# simple_ehr App Setup and Installation

### Prerequisites
Before setting up the project, ensure that your development environment meets the following OS-level requirements.

## Windows:

###  1. Flutter SDK 

* Download the flutter SDK from the official website the link is given below.
https://docs.flutter.dev/get-started/install/windows/mobile
* Extract the zip file in any location and add the flutter\bin directory to your system path.

###  2. Android Studio
* Download and install android studio from the official website the link is given below.
https://developer.android.com/studio
* Once the android studio installed make sure to download the plugins for Flutter and Dart by going in File->Setting->Plugin and also download the amulator

###  3. Git
* Install git from here https://git-scm.com/downloads/win

## mac OS:

###  1. Flutter SDK
*Download the flutter SDK from the official website the link is given below.
  https://docs.flutter.dev/get-started/install/windows/mobile
* Extract the zip file in any location and add the flutter\bin directory to your system path.

###  2. Android Studio
* Download and install android studio from the official website the link is given below.
  https://developer.android.com/studio
* Once the android studio installed make sure to download the plugins for Flutter and Dart by going in File->Setting->Plugin and also download the amulator

###  3. Git
* Install git from here https://git-scm.com/downloads/win


# Generate the build for Android, ios and web 

## Android:

* Navigate to Build->Flutter->build APK 
Android debug build will be generated can be distribute and install

## IOS

* Install flutter SDK and Android studio or Visual studio code
* Ensure you have latest version of Xcode installed
* Open project in android studio or visual studio
* Open the Xcode and navigate to the ios folder
* Open Runner.xcworkspace in Xcode
* Configure valid apple developer account under signing & capabilities
* Run "flutter build ios" to generate the ios build
* Ipa file will be generated under ios->build-> folder called Runner


## Web

* Navigate to the terminal and run the command "flutter build web"
* Navigate to build->web and all deployable files are there.