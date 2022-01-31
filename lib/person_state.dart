import 'package:teste_widget/person.dart';

abstract class PersonState {}

class PersonStateStart implements PersonState {}

class PersonStateLoading implements PersonState {}

class PersonStateSuccess implements PersonState {
  final Person result;

  PersonStateSuccess(this.result);
}

class PersonStateError implements PersonState {
  final String message;

  PersonStateError(this.message);
}
