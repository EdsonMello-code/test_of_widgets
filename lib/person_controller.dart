import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teste_widget/person.dart';
import 'package:teste_widget/person_state.dart';

class PersonController extends ValueNotifier<PersonState> {
  PersonController() : super(PersonStateStart());

  getPerson() async {
    value = PersonStateLoading();
    try {
      await Future.delayed(Duration(seconds: 3));
      value = PersonStateSuccess(Person('Edson', 32));
    } catch (e) {
      value = PersonStateError('Inexpected error');
    }
  }
}
