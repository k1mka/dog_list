import 'package:array_names/data/models/breed.dart';
import 'package:array_names/presentation/screens/images_screen/images_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class BreedWidget extends StatelessWidget {
  BreedWidget(
    this.breed, {
    Key? key,
  }) : super(key: key);

  final Breed breed;

  void _navigateToNextScreen(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImagesScreen(
            breed: breed,
          ),
        ),
      );

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  Future sendAnalyticsEvent({required String eventName, required String? clickEvent}) async {
    await _analytics.logEvent(
      name: eventName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        sendAnalyticsEvent(eventName: 'click_on_the_${breed.getFullNameToFirebase}', clickEvent: 'clickEvent');
        _navigateToNextScreen(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          breed.fullName,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
