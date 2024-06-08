// // ignore_for_file: avoid_print, prefer_const_constructors
//
// import 'dart:io';
// import 'dart:math';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import '../view/redirect_screen.dart';
//
// // class NotificationServices {
// //   //initialising firebase message plugin
// //   FirebaseMessaging messaging = FirebaseMessaging.instance;
// //
// //   //initialising firebase message plugin
// //   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
// //       FlutterLocalNotificationsPlugin();
// //
// //   void requestNotificationPermission() async {
// //     NotificationSettings settings = await messaging.requestPermission(
// //       alert: true,
// //       announcement: true,
// //       badge: true,
// //       carPlay: true,
// //       criticalAlert: true,
// //       provisional: true,
// //       sound: true,
// //     );
// //
// //     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
// //       if (kDebugMode) {
// //         print('user granted permission');
// //       }
// //     } else if (settings.authorizationStatus ==
// //         AuthorizationStatus.provisional) {
// //       if (kDebugMode) {
// //         print('user granted provisional permission');
// //       }
// //     } else {
// //       if (kDebugMode) {
// //         print('user denied permission');
// //       }
// //     }
// //   }
// //
// //   Future<String> getDeviceToken() async {
// //     String token = await messaging.getToken() ?? '';
// //     debugPrint('from getDevice Token---$token');
// //     return token;
// //   }
// //
// //   void isTokenRefresh() async {
// //     messaging.onTokenRefresh.listen((event) {
// //       event.toString();
// //     });
// //   }
// //
// //   void firebaseInit(BuildContext context) {
// //     FirebaseMessaging.onMessage.listen((message) {
// //       print(message.notification!.title.toString());
// //       print(message.notification!.body.toString());
// //       print(message.data.toString());
// //       print(message.data['type']);
// //       print(message.data['id']);
// //
// //       if (Platform.isIOS) {
// //         forgroundMessage();
// //       }
// //       if (Platform.isAndroid) {
// //         initLocalNotifications(context, message);
// //         showNotification(message);
// //       }
// //     });
// //   }
// //
// //   void initLocalNotifications(
// //       BuildContext context, RemoteMessage message) async {
// //     const AndroidInitializationSettings androidInitializationSettings =
// //         AndroidInitializationSettings('last_mile_logo');
// //     var iosInitializationSettings = const DarwinInitializationSettings();
// //
// //     var initializationSettings = InitializationSettings(
// //       android: androidInitializationSettings,
// //       iOS: iosInitializationSettings,
// //     );
// //
// //     await _flutterLocalNotificationsPlugin.initialize(
// //       initializationSettings,
// //       onDidReceiveNotificationResponse: (payload) {
// //         handleMessage(context, message);
// //       },
// //     );
// //   }
// //
// //   Future<void> showNotification(RemoteMessage message) async {
// //     AndroidNotificationChannel channel = AndroidNotificationChannel(
// //       Random.secure().nextInt(100000).toString(),
// //       'High Importance Notification',
// //       importance: Importance.max,
// //     );
// //
// //     AndroidNotificationDetails androidNotificationDetails =
// //         AndroidNotificationDetails(
// //       channel.id.toString(),
// //       channel.name.toString(),
// //       channelDescription: 'Gig Partner App',
// //       importance: Importance.high,
// //       priority: Priority.high,
// //       icon: '@mipmap/ic_launcher',
// //       ticker: 'ticker',
// //     );
// //
// //     DarwinNotificationDetails darwinNotificationDetails =
// //         DarwinNotificationDetails(
// //       presentAlert: true,
// //       presentBadge: true,
// //       presentSound: true,
// //     );
// //
// //     NotificationDetails notificationDetails = NotificationDetails(
// //       android: androidNotificationDetails,
// //       iOS: darwinNotificationDetails,
// //     );
// //
// //     Future.delayed(Duration.zero, () {
// //       _flutterLocalNotificationsPlugin.show(
// //         0,
// //         message.notification!.title.toString(),
// //         message.notification!.body.toString(),
// //         notificationDetails,
// //       );
// //     });
// //   }
// //
// //   Future forgroundMessage() async {
// //     await FirebaseMessaging.instance
// //         .setForegroundNotificationPresentationOptions(
// //       alert: true,
// //       badge: true,
// //       sound: true,
// //     );
// //   }
// //
// //   void handleMessage(BuildContext context, RemoteMessage message) {
// //     if (message.data['type'] == 'msg') {
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => RedirectScreen(
// //             id: message.data['id'],
// //           ),
// //         ),
// //       );
// //     }
// //   }
// //
// //   Future<void> setupInteractMessage(BuildContext context) async {
// //     RemoteMessage? initialMessage =
// //         await FirebaseMessaging.instance.getInitialMessage();
// //
// //     if (initialMessage != null) {
// //       handleMessage(context, initialMessage);
// //     }
// //
// //     FirebaseMessaging.onMessageOpenedApp.listen((event) {
// //       handleMessage(context, event);
// //     });
// //   }
// // }
//
// class NotificationServices {
//   //initialising firebase message plugin
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   //initialising firebase message plugin
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   //function to initialise flutter local notification plugin to show notifications for android when app is active
//   void initLocalNotifications(
//       BuildContext context, RemoteMessage message) async {
//     var androidInitializationSettings =
//     const AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iosInitializationSettings = const DarwinInitializationSettings();
//
//     var initializationSetting = InitializationSettings(
//         android: androidInitializationSettings, iOS: iosInitializationSettings);
//
//     await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
//         onDidReceiveNotificationResponse: (payload) {
//           // handle interaction when app is active for android
//           handleMessage(context, message);
//         });
//   }
//
//   void firebaseInit(BuildContext context) {
//     FirebaseMessaging.onMessage.listen((message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification!.android;
//
//       if (kDebugMode) {
//         print("notifications title:${notification!.title}");
//         print("notifications body:${notification.body}");
//         print('count:${android!.count}');
//         print('data:${message.data.toString()}');
//       }
//
//       if (Platform.isIOS) {
//         forgroundMessage();
//       }
//
//       if (Platform.isAndroid) {
//         initLocalNotifications(context, message);
//         showNotification(message);
//       }
//     });
//   }
//
//   void requestNotificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       if (kDebugMode) {
//         print('user granted permission');
//       }
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       if (kDebugMode) {
//         print('user granted provisional permission');
//       }
//     } else {
//       //appsetting.AppSettings.openNotificationSettings();
//       if (kDebugMode) {
//         print('user denied permission');
//       }
//     }
//   }
//
//   // function to show visible notification when app is active
//   Future<void> showNotification(RemoteMessage message) async {
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//         message.notification!.android!.channelId.toString(),
//         message.notification!.android!.channelId.toString(),
//         importance: Importance.max,
//         showBadge: true,
//         playSound: true,
//         // sound: const RawResourceAndroidNotificationSound('jetsons_doorbell')
//     );
//
//     AndroidNotificationDetails androidNotificationDetails =
//     AndroidNotificationDetails(
//         channel.id.toString(), channel.name.toString(),
//         channelDescription: 'your channel description',
//         importance: Importance.high,
//         priority: Priority.high,
//         playSound: true,
//         ticker: 'ticker',
//         // sound: channel.sound
//           // sound: RawResourceAndroidNotificationSound('jetsons_doorbell')
//       //  icon: largeIconPath
//     );
//
//     const DarwinNotificationDetails darwinNotificationDetails =
//     DarwinNotificationDetails(
//         presentAlert: true, presentBadge: true, presentSound: true);
//
//     NotificationDetails notificationDetails = NotificationDetails(
//         android: androidNotificationDetails, iOS: darwinNotificationDetails);
//
//     Future.delayed(Duration.zero, () {
//       _flutterLocalNotificationsPlugin.show(
//         0,
//         message.notification!.title.toString(),
//         message.notification!.body.toString(),
//         notificationDetails,
//       );
//     });
//   }
//
//   //function to get device token on which we will send the notifications
//   Future<String> getDeviceToken() async {
//     String? token = await messaging.getToken();
//     return token!;
//   }
//
//   void isTokenRefresh() async {
//     messaging.onTokenRefresh.listen((event) {
//       event.toString();
//       if (kDebugMode) {
//         print('refresh');
//       }
//     });
//   }
//
//   //handle tap on notification when app is in background or terminated
//   Future<void> setupInteractMessage(BuildContext context) async {
//     // when app is terminated
//     RemoteMessage? initialMessage =
//     await FirebaseMessaging.instance.getInitialMessage();
//
//     if (initialMessage != null) {
//       handleMessage(context, initialMessage);
//     }
//
//     //when app ins background
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       handleMessage(context, event);
//     });
//   }
//
//   void handleMessage(BuildContext context, RemoteMessage message) {
//     if (message.data['type'] == 'msj') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => RedirectScreen(
//             id: message.data['id'],
//           ),
//         ),
//       );
//     }
//   }
//
//   Future forgroundMessage() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
// }



///-----------------upper code is working now I am just doing for showing the image in notification.

/*import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import '../view/redirect_screen.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
          handleMessage(context, message);
        });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (kDebugMode) {
        print("notifications title: ${notification?.title}");
        print("notifications body: ${notification?.body}");
        print('data: ${message.data.toString()}');
      }

      if (Platform.isIOS) {
        forgroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      }
    });
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  Future<void> showNotification(RemoteMessage message) async {
    // Extract the image URL from the notification payload
    String? imageUrl = message.notification?.android?.imageUrl ?? message.notification?.apple?.imageUrl;

    // Log the image URL
    if (kDebugMode) {
      print('***************** Image URL: $imageUrl *****************');
    }

    String? largeIconPath;

    if (imageUrl != null) {
      largeIconPath = await _downloadAndSaveFile(imageUrl, 'largeIcon');
    }

    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'channel_id', // Replace with your channel ID
      'channel_name', // Replace with your channel name
      channelDescription: 'your channel description',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      ticker: 'ticker',
      largeIcon: largeIconPath != null
          ? FilePathAndroidBitmap(largeIconPath)
          : null,
      styleInformation: largeIconPath != null
          ? BigPictureStyleInformation(
        FilePathAndroidBitmap(largeIconPath),
        largeIcon: FilePathAndroidBitmap(largeIconPath),
      )
          : null,
    );

    DarwinNotificationDetails darwinNotificationDetails =
    const DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    var response = await http.get(Uri.parse(url));
    var directory = await getApplicationDocumentsDirectory();
    var filePath = '${directory.path}/$fileName';
    var file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      if (kDebugMode) {
        print('refresh');
      }
    });
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data['type'] == 'msj') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RedirectScreen(
            id: message.data['id'],
          ),
        ),
      );
    }
  }

  Future<void> forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}*/


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import '../view/redirect_screen.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void initLocalNotifications(BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting, onDidReceiveNotificationResponse: (payload) {
      handleMessage(context, message);
    });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (kDebugMode) {
        print("notifications title: ${notification?.title}");
        print("notifications body: ${notification?.body}");
        print('data: ${message.data.toString()}');
      }

      if (Platform.isIOS) {
        forgroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      }
    });
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  Future<void> showNotification(RemoteMessage message) async {
    String? imageUrl = message.notification?.android?.imageUrl ?? message.notification?.apple?.imageUrl;

    if (kDebugMode) {
      print('***************** Image URL: $imageUrl *****************');
    }

    String? largeIconPath;

    if (imageUrl != null) {
      try {
        largeIconPath = await _downloadAndSaveFile(imageUrl, 'largeIcon');
      } catch (e) {
        if (kDebugMode) {
          print('Error downloading image: $e');
        }
        largeIconPath = null;
      }
    }

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'your channel description',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      ticker: 'ticker',
      largeIcon: largeIconPath != null ? FilePathAndroidBitmap(largeIconPath) : null,
      styleInformation: largeIconPath != null ? BigPictureStyleInformation(
        FilePathAndroidBitmap(largeIconPath),
        largeIcon: FilePathAndroidBitmap(largeIconPath),
      ) : null,
    );

    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails, iOS: darwinNotificationDetails,
    );

    _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    var response = await http.get(Uri.parse(url));
    var directory = await getApplicationDocumentsDirectory();
    var filePath = '${directory.path}/$fileName';
    var file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      if (kDebugMode) {
        print('refresh');
      }
    });
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) {
    if (message.data['type'] == 'msj') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RedirectScreen(
            id: message.data['id'],
          ),
        ),
      );
    }
  }

  Future<void> forgroundMessage() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}





