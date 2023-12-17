import 'package:playon/all_utils.dart';
import 'package:playon/models/role.dart';
import 'package:playon/screens/book_appointment/book_appointment_screen.dart';
import 'package:playon/screens/login/login_screen.dart';
import 'package:playon/screens/module_admin/add_children/children_data_entry_screen.dart';
import 'package:playon/screens/module_admin/tab/components/add_floating_action_button.dart';
import 'package:playon/screens/module_admin/tab/components/my_bottom_navigation_bar.dart';
import 'package:playon/screens/module_admin/view_data/view_children_screen.dart';
import 'package:playon/screens/module_admin/view_data/view_hospitals_screen.dart';
import 'package:playon/screens/module_hospital/view_appointments/view_appointments_screen.dart';
import 'package:playon/screens/module_parent/profile/parent_profile.dart';
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
    final user = PrefsStorage.instance.user;
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            if (user?.role == Role.admin)
              const AdminHomeScreen()
            else if (user?.role == Role.hospital)
              const HospitalHomeScreen()
            else if (user?.role == Role.parent)
              const ParentHomeScreen(),
            if (user?.role == Role.parent)
              const ProfileCard()
            else
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
      floatingActionButton: PrefsStorage.instance.user?.role == Role.parent
          ? FloatingActionButton(
              onPressed: _openBottomSheet,
              child: const AddFileFloatingActionButton(),
            )
          : null,
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
              // const Divider(),
              // ListTile(
              //   leading: const Icon(Icons.local_hospital_rounded),
              //   title: const Text('Add Hospital'),
              //   onTap: () =>
              //       Navigator.pushNamed(context, AddHospitalScreen.routeName),
              // ),
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

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        color: Colors.grey.shade200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ListTile.divideTiles(
            context: context,
            color: Colors.grey,
            tiles: [
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, ViewChildrenScreen.routeName);
                },
                title: const Text('View Children'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, ViewHospitalsScreen.routeName);
                },
                title: const Text('View Hospitals'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(
                      context, ViewAppointmentsScreen.routeName);
                },
                title: const Text('View Appointments'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        color: Colors.grey.shade200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ListTile.divideTiles(
            context: context,
            color: Colors.grey,
            tiles: [
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, ViewChildrenScreen.routeName);
                },
                title: const Text('View Children'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(
                      context, ViewAppointmentsScreen.routeName);
                },
                title: const Text('View Appointments'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}

class HospitalHomeScreen extends StatelessWidget {
  const HospitalHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        color: Colors.grey.shade200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: ListTile.divideTiles(
            context: context,
            color: Colors.grey,
            tiles: [
              ListTile(
                onTap: () {
                  Navigator.pushNamed(
                      context, ViewAppointmentsScreen.routeName);
                },
                title: const Text('View Appointments'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ).toList(),
        ),
      ),
    );
  }
}
