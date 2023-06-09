import 'package:playon/all_utils.dart';
import 'package:playon/screens/add_children/children_data_entry_screen.dart';
import 'package:playon/screens/add_hospital/hospital_data_entry_screen.dart';
import 'package:playon/screens/book_appointment/book_appointment_screen.dart';
import 'package:playon/screens/login/login_screen.dart';
import 'package:playon/screens/tab/components/add_floating_action_button.dart';
import 'package:playon/screens/tab/components/my_bottom_navigation_bar.dart';
import 'package:playon/widgets/my_elevated_button.dart';

class TabScreen extends StatefulWidget {
  static const String routeName = "/TabScreen";
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            const SizedBox(),
            Center(
              child: MyElevatedButton(
                onTap: () async {
                  await context.read<UserProvider>().logout();
                  if (mounted) {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  }
                },
                title: 'Logout',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        isSelectedIndex: _selectedIndex,
        onItemTapped: _onItemTap,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openBottomSheet,
        child: const AddFileFloatingActionButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onItemTap(int index) => setState(() => _selectedIndex = index);

  void _openBottomSheet() => showModalBottomSheet(
        context: context,
        builder: (_) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.family_restroom_rounded),
                title: const Text('Add Child'),
                onTap: () =>
                    Navigator.pushNamed(context, AddChildScreen.routeName),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.local_hospital_rounded),
                title: const Text('Add Hospital'),
                onTap: () =>
                    Navigator.pushNamed(context, AddHospitalScreen.routeName),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.bookmark_added_rounded),
                title: const Text('Book Appointment'),
                onTap: () => Navigator.pushNamed(
                    context, BookAppointmentScreen.routeName),
              ),
            ],
          ),
        ),
      );
}
