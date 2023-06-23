import 'package:basics_of_animations/hero_animations/details_page.dart';
import 'package:basics_of_animations/hero_animations/peoples_data_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({super.key});

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          return Card(
            margin: const EdgeInsets.fromLTRB(20, 15, 20, 5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            color: Colors.black12,
            child: ListTile(
              tileColor: Colors.black12,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(person: person),
                  ),
                );
              },
              leading: Hero(
                tag: person.emoji,
                child: Text(
                  person.emoji,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              title: Hero(
                tag: person.name,
                child: Text(
                  person.name,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              subtitle: Hero(
                tag: person.age,
                child: Text(
                  '${person.age} years old',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
