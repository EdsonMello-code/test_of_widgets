import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_widget/person_controller.dart';
import 'package:teste_widget/person_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PersonController personController;
  @override
  void initState() {
    super.initState();

    personController = context.read<PersonController>();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      personController.getPerson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          personController.getPerson();
        },
      ),
      body: ValueListenableBuilder<PersonState>(
        valueListenable: personController,
        builder: (_, value, __) {
          if (value is PersonStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (value is PersonStateSuccess) {
            return Center(
                child: Text(
              value.result.name,
            ));
          }
          return Container();
        },
      ),
    );
  }
}
