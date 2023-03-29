import 'package:flutter/material.dart';
import 'package:playon/providers/generate_cv_provider.dart';
import 'package:playon/screens/add_children_data/components/child_data_info_form.dart';
import 'package:provider/provider.dart';

class CVGeneratorScreen extends StatelessWidget {
  static const String routeName = '/CvGeneratorScreen';
  const CVGeneratorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Children')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<ChildrenDataProvider>(
          builder: (_, provider, __) {
            return const ChildDataForm();
          },
        ),
      ),
    );
  }
}
