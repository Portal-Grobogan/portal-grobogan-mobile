import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../models/app_notification.dart';
import '../services/notification_service.dart';

final notificationStoreProvider = NotifierProvider<NotificationStoreNotifier, List<AppNotification>>(() {
  return NotificationStoreNotifier();
});

class NotificationStoreNotifier extends Notifier<List<AppNotification>> {
  StreamSubscription? _sub;

  @override
  List<AppNotification> build() {
    _loadNotifications();
    
    // Listen for new notifications while app is in foreground
    _sub?.cancel();
    _sub = NotificationService.onNewNotification.listen((notification) {
      state = [notification, ...state];
    });

    ref.onDispose(() {
      _sub?.cancel();
    });

    return [];
  }

  static const String _storageKey = 'portal_grobogan_notifications';

  Future<void> _loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_storageKey);
    
    if (jsonList != null) {
      final notifications = jsonList
          .map((jsonStr) => AppNotification.fromJson(jsonStr))
          .toList();
      
      // Sort by newest first
      notifications.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      state = notifications;
    }
  }

  Future<void> addNotification(AppNotification notification) async {
    final prefs = await SharedPreferences.getInstance();
    
    // We add to the beginning of the list
    final updatedList = [notification, ...state];
    
    // Save to SharedPreferences
    final jsonList = updatedList.map((n) => n.toJson()).toList();
    await prefs.setStringList(_storageKey, jsonList);
    
    state = updatedList;
  }

  Future<void> markAsRead(String id) async {
    final prefs = await SharedPreferences.getInstance();
    
    final updatedList = state.map((n) {
      if (n.id == id && !n.isRead) {
        return n.copyWith(isRead: true);
      }
      return n;
    }).toList();
    
    final jsonList = updatedList.map((n) => n.toJson()).toList();
    await prefs.setStringList(_storageKey, jsonList);
    
    state = updatedList;
  }
  
  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
    state = [];
  }
  
  int get unreadCount => state.where((n) => !n.isRead).length;
}
