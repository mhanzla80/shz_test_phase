import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/models/role.dart';
import 'package:playon/providers/add_data_provider.dart';
import 'package:playon/screens/module_admin/tab/admin_tab_screen.dart';

class LoadingDataWidget extends StatefulWidget {
  const LoadingDataWidget({super.key});

  @override
  _LoadingDataWidgetState createState() => _LoadingDataWidgetState();
}

class _LoadingDataWidgetState extends State<LoadingDataWidget> {
  @override
  void initState() {
    super.initState();
    _initializeEveryThing();
  }

  void _initializeEveryThing() async {
    final provider = context.read<AddDataProvider>();
    provider.allChildren = await provider.getAllChildren();
    provider.allHospitals = await provider.getAllHospitals();

    try {
      _moveToNextScreen(context);
    } on Exception catch (e) {
      EasyLoading.showError(
          'An error occurred while fetching location! Please re-run the app.');
    }
  }

  void _moveToNextScreen(BuildContext context) async {
    final user = context.read<UserProvider>().user;
    if (user == null) {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } else if (user.role == Role.admin) {
      Navigator.pushReplacementNamed(context, AdminTabScreen.routeName);
    } else if (user.role == Role.hospital) {
      Navigator.pushReplacementNamed(context, AdminTabScreen.routeName);
    } else if (user.role == Role.parent) {
      Navigator.pushReplacementNamed(context, AdminTabScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: const [
          VerticalSpacing(of: 10),
          LinearProgressIndicator(
            backgroundColor: AppTheme.lightBlueGreyColor,
          ),
        ],
      ),
    );
  }
}
