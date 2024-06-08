# Flutter Push Notification App

This Flutter application integrates Firebase Cloud Messaging (FCM) to handle push notifications. The app demonstrates handling different types of notifications (with and without images), redirects based on provided keys, and handles notifications in various app states (foreground, background, and terminated).

## Features

- **Push Notifications**: Receive notifications using Firebase Cloud Messaging.
- **Image Notifications**: Display notifications with or without images.
- **Deep Linking**: Redirect to specific screens based on notification data.
- **App States Handling**: Handle notifications in foreground, background, and terminated states.

## Setup

### Prerequisites

- Flutter SDK
- Firebase account
- Android/iOS development environment set up

### Firebase Configuration

1. **Create a Firebase Project**:
   - Go to [Firebase Console](https://console.firebase.google.com/).
   - Create a new project or use an existing project.

2. **Add Android App to Firebase**:
   - Register your Android app with Firebase.
   - Download `google-services.json` and place it in the `android/app` directory.

3. **Add iOS App to Firebase**:
   - Register your iOS app with Firebase.
   - Download `GoogleService-Info.plist` and place it in the `ios/Runner` directory.

4. **Enable Cloud Messaging**:
   - In the Firebase Console, navigate to **Cloud Messaging** and enable it.

### Flutter Configuration

1. **Add Dependencies**:
   Add the following dependencies in your `pubspec.yaml` file:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     firebase_core: latest_version
     firebase_messaging: latest_version
     app_settings:  latest_version
     firebase_messaging:  latest_version
     flutter_local_notifications:
     http:  latest_version
     path_provider:  latest_version

## 🔗 Links
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://priyanshukumar1705.blogspot.com/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/priyanshu1705/)
## Authors

- [@priyanshutaru](https://github.com/priyanshutaru)
