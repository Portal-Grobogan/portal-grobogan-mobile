import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../config/router.dart';
import '../models/app_notification.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Handling a background message: ${message.messageId}");
  await NotificationService._saveNotificationLocal(message);
}

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  
  static final StreamController<AppNotification> _notificationStream = StreamController.broadcast();
  static Stream<AppNotification> get onNewNotification => _notificationStream.stream;

  static Future<AppNotification?> _saveNotificationLocal(RemoteMessage message) async {
    if (message.notification == null) return null;
    
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('portal_grobogan_notifications') ?? [];
    
    final notification = AppNotification(
      id: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: message.notification!.title ?? 'Notifikasi Baru',
      body: message.notification!.body ?? '',
      type: message.data['type'],
      dataId: message.data['id'],
      slug: message.data['slug'],
      timestamp: DateTime.now(),
    );
    
    jsonList.insert(0, notification.toJson());
    await prefs.setStringList('portal_grobogan_notifications', jsonList);
    return notification;
  }

  Future<void> init() async {
    try {
      NotificationSettings settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        debugPrint('User granted notification permission');
        
        final token = await _messaging.getToken();
        debugPrint('FCM Token: $token');
        
        // 8.2 Subscribe to Topics
        await _messaging.subscribeToTopic('semua-warga');
        
        // 8.3 Setup handlers
        _setupHandlers();
      }
    } catch (e) {
      debugPrint('FCM Initialization error: $e');
    }
  }

  void _setupHandlers() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
    
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) _handleNotificationTap(message);
    });
  }

  void _handleForegroundMessage(RemoteMessage message) async {
    // Save locally and broadcast
    final notification = await _saveNotificationLocal(message);
    if (notification != null) {
      _notificationStream.add(notification);
    }

    final context = rootNavigatorKey.currentContext;
    if (context != null && message.notification != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.notification!.title ?? 'Notifikasi Baru',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(message.notification!.body ?? ''),
            ],
          ),
          duration: const Duration(seconds: 4),
          action: SnackBarAction(
            label: 'LIHAT',
            textColor: Colors.blueAccent,
            onPressed: () => _handleNotificationTap(message),
          ),
        ),
      );
    }
  }

  void _handleNotificationTap(RemoteMessage message) {
    final data = message.data;
    final type = data['type'];
    final context = rootNavigatorKey.currentContext;
    
    if (context == null) return;
    
    switch (type) {
      case 'bencana':
        context.go('/layanan/kebencanaan');
        break;
      case 'pengaduan':
        final id = data['id'];
        if (id != null) {
          context.go('/pengaduan/sukses/$id');
        } else {
          context.go('/pengaduan/cek');
        }
        break;
      case 'berita':
        final slug = data['slug'];
        if (slug != null) {
          context.go('/berita/$slug');
        } else {
          context.go('/berita');
        }
        break;
    }
  }
}
