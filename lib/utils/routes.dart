import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/screens/add_children_data/children_data_entry_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignupScreen.routeName: (context) => const SignupScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  TabScreen.routeName: (context) => const TabScreen(),
  CVGeneratorScreen.routeName: (context) => const CVGeneratorScreen(),
};
