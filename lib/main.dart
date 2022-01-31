import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_widget/home_page.dart';
import 'package:teste_widget/person_controller.dart';

void main() {
  runApp(ChangeNotifierProvider<PersonController>(
    create: (_) => PersonController(),
    child: const MaterialApp(
      home: HomePage(),
    ),
  ));
}
