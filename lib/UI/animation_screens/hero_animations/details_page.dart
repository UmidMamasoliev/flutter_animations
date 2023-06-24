import 'package:basics_of_animations/data/models/person_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Person person;
  const DetailsPage({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
        elevation: 1,
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white10,
            border: Border.all(color: Colors.green, width: 10),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: const Offset(10, 10)),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _card(
                tag: person.emoji,
                title: person.emoji,
                fontSize: 40,
              ),
              const SizedBox(height: 20),
              _card(
                tag: person.name,
                title: person.name,
                fontSize: 20,
              ),
              const SizedBox(height: 20),
              _card(
                tag: person.age,
                title: '${person.age} years old',
                fontSize: 15,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card({
    required Object tag,
    required String title,
    required double fontSize,
  }) {
    return Hero(
      flightShuttleBuilder: (
        flightContext,
        animation,
        flightDirection,
        fromHeroContext,
        toHeroContext,
      ) {
        switch (flightDirection) {
          case HeroFlightDirection.push:
            return Material(
              color: Colors.transparent,
              child: ScaleTransition(
                scale: animation.drive(
                  Tween<double>(
                    begin: 0.0,
                    end: 1.0,
                  ).chain(
                    CurveTween(
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                ),
                child: toHeroContext.widget,
              ),
            );

          case HeroFlightDirection.pop:
            return Material(
              color: Colors.transparent,
              child: fromHeroContext.widget,
            );
        }
      },
      tag: tag,
      child: Text(
        title,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
