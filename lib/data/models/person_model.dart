import 'package:flutter/material.dart';

@immutable
class Person {
  final String name;
  final String age;
  final String emoji;

  const Person({
    required this.name,
    required this.age,
    required this.emoji,
  });
}

const people = [
  Person(name: 'Jhon', age: '20', emoji: '👨‍🎓'),
  Person(name: 'Lee', age: '25', emoji: '👨‍💻'),
  Person(name: 'Jimmy', age: '19', emoji: '🦸‍♂️'),
  Person(name: 'Kyle', age: '28', emoji: '👨🏽‍✈️'),
  Person(name: 'Kevin', age: '30', emoji: '👨🏻‍🔧'),
  Person(name: 'Maks', age: '24', emoji: '👨🏼‍🚒'),
  Person(name: 'Stewie', age: '26', emoji: '🤵🏿‍♂️'),
  Person(name: 'Bernard', age: '40', emoji: '👨🏽‍⚕️'),
  Person(name: 'Michel', age: '36', emoji: '👨🏻‍🏫'),
  Person(name: 'Lilly', age: '23', emoji: '👩🏼‍⚕️'),
  Person(name: 'Rose', age: '18', emoji: '🤵🏻‍♀️'),
  Person(name: 'Frank', age: '29', emoji: '👨‍🔬'),
];
