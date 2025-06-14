import 'package:alora/core/config/app_icons.dart';

class NotificationModel {
  final String title;
  final String description;
  final DateTime time;
  final String icon;

  NotificationModel({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
  });

  // Factory method to create an instance from JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'] as String,
      description: json['description'] as String,
      time: DateTime.parse(json['time'] as String),
      icon: json['icon'] as String,
    );
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'time': time.toIso8601String(),
      'icon': icon,
    };
  }

  static final List<NotificationModel> dummyNotifications = <NotificationModel>[
      NotificationModel(
        title: 'New Message',
        description: 'You have received a new message',
        time: DateTime.now().subtract(const Duration(minutes: 5)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'Friend Request',
        description: 'John sent you a friend request',
        time: DateTime.now().subtract(const Duration(minutes: 10)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'App Update',
        description: 'Version 2.0 is now available',
        time: DateTime.now().subtract(const Duration(hours: 1)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'Reminder',
        description: 'Don’t forget your meeting at 3 PM',
        time: DateTime.now().subtract(const Duration(hours: 2)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'Sale Alert',
        description: '50% off on selected items',
        time: DateTime.now().subtract(const Duration(hours: 3)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'Security Alert',
        description: 'New login from unknown device',
        time: DateTime.now().subtract(const Duration(hours: 5)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'Payment Received',
        description: 'You received \$120.00',
        time: DateTime.now().subtract(const Duration(days: 1)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'Achievement Unlocked',
        description: 'You reached level 10!',
        time: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'Battery Low',
        description: 'Battery at 15%',
        time: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'New Comment',
        description: 'Anna commented on your post',
        time: DateTime.now().subtract(const Duration(days: 2)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'Shipping Update',
        description: 'Your package is out for delivery',
        time: DateTime.now().subtract(const Duration(days: 2, hours: 4)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'Daily Tip',
        description: 'Take breaks to stay productive',
        time: DateTime.now().subtract(const Duration(days: 3)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'Subscription Expiring',
        description: 'Your subscription ends tomorrow',
        time: DateTime.now().subtract(const Duration(days: 4)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'Network Issue',
        description: 'Connection lost, trying to reconnect',
        time: DateTime.now().subtract(const Duration(days: 5)),
        icon: AppIcons.notificationIcon,
      ),
      NotificationModel(
        title: 'Weather Alert',
        description: 'Heavy rain expected today',
        time: DateTime.now().subtract(const Duration(days: 6)),
        icon: AppIcons.notificationIcon,
      ),
    ];

}
