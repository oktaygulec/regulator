import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class LocalNotificationService {
  static final _localNotificationService = FlutterLocalNotificationsPlugin();
  static final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

  /// Must be initialized (it has been initialized in splash provider)
  static Future<void> init({String? icon}) async {
    tz.initializeTimeZones();

    /// Android settings
    final androidInitializationSettings =
        AndroidInitializationSettings(icon ?? "@drawable/ic_logo");

    /// Icon generator: https://romannurik.github.io/AndroidAssetStudio/icons-notification

    /// IOS settings
    const iosInitializationSettings = IOSInitializationSettings(
      requestAlertPermission: false, //true
      requestBadgePermission: false, //true
      requestSoundPermission: false, //true
      // onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    final settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _localNotificationService.initialize(
      settings,
      onSelectNotification: _onSelectNotification,
    );
  }

  static NotificationDetails _notificationDetails({
    String? channelId,
    String? channelName,
    String? channelDescription,
    Importance? importance,
    Priority? priority,
    bool? playSound,
  }) {
    final AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channelId ?? 'channel_id',
      channelName ?? 'channel_name',
      channelDescription: channelDescription ?? 'description',
      importance: importance ?? Importance.max,
      priority: priority ?? Priority.max,
      playSound: playSound ?? true,
      ticker: 'ticker text',
    );

    const IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    return NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  static Future<void> requestIOSPermissions() async {
    await _localNotificationService
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? channelId,
    String? channelName,
    String? channelDescription,
    Importance? importance,
    Priority? priority,
    bool? playSound,
  }) async {
    final details = _notificationDetails(
      channelId: channelId,
      channelName: channelName,
      channelDescription: channelDescription,
      importance: importance,
      priority: priority,
      playSound: playSound,
    );
    await _localNotificationService.show(id, title, body, details);
  }

  static Future<void> showScheduledNotification({
    required int id,
    required String title,
    required String body,
    required int seconds,
    String? channelId,
    String? channelName,
    String? channelDescription,
    Importance? importance,
    Priority? priority,
    bool? playSound,
  }) async {
    final details = _notificationDetails(
      channelId: channelId,
      channelName: channelName,
      channelDescription: channelDescription,
      importance: importance,
      priority: priority,
      playSound: playSound,
    );
    await _localNotificationService.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(
        DateTime.now().add(Duration(seconds: seconds)),
        tz.local,
      ),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future<void> showNotificationWithPayload({
    required int id,
    required String title,
    required String body,
    required String payload,
    String? channelId,
    String? channelName,
    String? channelDescription,
    Importance? importance,
    Priority? priority,
    bool? playSound,
  }) async {
    final details = _notificationDetails(
      channelId: channelId,
      channelName: channelName,
      channelDescription: channelDescription,
      importance: importance,
      priority: priority,
      playSound: playSound,
    );

    await _localNotificationService.show(
      id,
      title,
      body,
      details,
      payload: payload,
    );
  }

  // static void _onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) {
  //   print('id $id');
  // }

  static void _onSelectNotification(String? payload) async {
    /// On notification clicked
    if (payload != null && payload.isNotEmpty) {
      onNotificationClick.add(payload);
    }
  }
}
