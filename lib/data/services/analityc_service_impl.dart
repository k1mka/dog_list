import 'package:firebase_analytics/firebase_analytics.dart';
import 'analytic_service.dart';

class AnalyticServiceImpl extends AnalyticService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  Future sendAnalyticsEvent({required String eventName, required String? clickEvent}) async {
    await _analytics.logEvent(
      name: eventName,
    );
  }
}
