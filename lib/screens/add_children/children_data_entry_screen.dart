import 'package:flutter/material.dart';
import 'package:playon/providers/add_data_provider.dart';
import 'package:playon/screens/add_children/components/child_data_info_form.dart';
import 'package:provider/provider.dart';

class AddChildScreen extends StatelessWidget {
  static const String routeName = '/AddChildScreen';
  const AddChildScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Children')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<AddDataProvider>(
          builder: (_, provider, __) {
            return const ChildDataForm();
          },
        ),
      ),
    );
  }
}
