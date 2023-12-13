import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/models/hospital.dart';
import 'package:playon/models/role.dart';
import 'package:playon/providers/add_data_provider.dart';

class ViewHospitalsScreen extends StatelessWidget {
  static const String routeName = "/ViewHospitalsScreen";

  const ViewHospitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hospitals')),
      body: FutureBuilder<List<Hospital>>(
        future: _getHospital(),
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
                    child: ExpansionTile(
                      title: Text(data[index].hospitalName),
                      children: _adminSpecific(context, data[index]),
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

  List<Widget> _adminSpecific(BuildContext context, Hospital hospital) {
    final user = context.read<UserProvider>().user;
    final provider = context.read<AddDataProvider>();

    return [
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 20)),
        child: const Text('View Details'),
      ),
      if ((user != null && user.role == Role.admin) &&
          (hospital.isAccepted == null || hospital.isAccepted == false))
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => provider.acceptRejectHospital(hospital, true),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Accept'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () => provider.acceptRejectHospital(hospital, false),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Reject'),
            ),
          ],
        ),
    ];
  }

  Future<List<Hospital>> _getHospital() async {
    // Reference to your Firestore collection
    final childrenCollection =
        FirebaseFirestore.instance.collection('hospitals');

    final querySnapshot = await childrenCollection.get();

    // Process the retrieved documents
    final children = querySnapshot.docs;

    final List<Hospital> childrenList = [];
    for (var child in children) {
      // Access data within each document
      final data = child.data();
      childrenList.add(Hospital.fromJson(data));
      // Do something with the data
      print('Child: ${data.toString()}');
    }
    return childrenList;
  }
}
