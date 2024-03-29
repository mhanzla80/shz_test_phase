import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/models/child_data_model.dart';
import 'package:playon/screens/module_admin/add_children/children_data_entry_screen.dart';

class ViewChildrenScreen extends StatelessWidget {
  static const String routeName = "/ViewChildrenScreen";

  const ViewChildrenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Children'),
      ),
      body: FutureBuilder<List<ChildDataModel>>(
        future: _getChildren(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            }

            final data = snapshot.data;
            if (data != null && data.isNotEmpty) {
              return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: data.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, AddChildScreen.routeName,
                          arguments: data[index]),
                      title: Text(data[index].firstName),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                  child: Text(
                'No Data',
                style: TextStyle(fontSize: 18),
              ));
            }
          }

          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }

  Future<List<ChildDataModel>> _getChildren() async {
    // Reference to your Firestore collection
    final childrenCollection =
        FirebaseFirestore.instance.collection('children');

    // Query to retrieve children where the 'email' field matches the provided email
    final querySnapshot = await childrenCollection
        .where('parentEmail', isEqualTo: PrefsStorage.instance.user?.email)
        .get();

    // Process the retrieved documents
    final children = querySnapshot.docs;

    final List<ChildDataModel> childrenList = [];
    for (var child in children) {
      // Access data within each document
      final data = child.data();
      childrenList.add(ChildDataModel.fromJson(data));
      // Do something with the data
      print('Child: ${data.toString()}');
    }
    return childrenList;
  }
}
