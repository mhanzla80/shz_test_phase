import 'package:playon/all_utils.dart';
import 'package:playon/screens/splash/components/loading_data.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash.png', width: 0.8.sw),
            const VerticalSpacing(of: 40),
            const LoadingDataWidget(),
          ],
        ),
      ),
    );
  }
}
