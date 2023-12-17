import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:playon/all_screens.dart';
import 'package:playon/all_utils.dart';
import 'package:playon/providers/add_data_provider.dart';
import 'package:playon/screens/notification/component/notification_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  await DependencyInjectionEnvironment.setup();
  runApp(const PlayOn());
}

class PlayOn extends StatelessWidget {
  const PlayOn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VACCINATION APP',
        themeMode: ThemeMode.light,
        theme: AppTheme.buildTheme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MultiProvider(
            providers: [
              ListenableProvider(create: (_) => UserProvider()),
              ListenableProvider(create: (_) => AddDataProvider()),
              ListenableProvider(create: (_) => NotificationProvider()),
            ],
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: FlutterEasyLoading(child: widget),
            ),
          );
        },
      ),
    );
  }
}
