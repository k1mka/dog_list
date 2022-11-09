abstract class AnalyticService {
  Future sendAnalyticsEvent({
    required String eventName,
    required String? clickEvent,
  });
}
