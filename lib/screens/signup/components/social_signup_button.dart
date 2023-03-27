import 'package:playon/all_utils.dart';

class SocialSignupButton extends StatelessWidget {
  final String imageName;
  final BuildContextCallback onTap;

  const SocialSignupButton(
      {required this.imageName, required this.onTap, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: SizedBox(
        width: 100,
        height: 60,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 2,
          shadowColor: AppTheme.lightBlueGreyColor,
          child: Center(
            child: SizedBox(
              width: 20.w,
              height: 25.h,
              child: Image.asset('assets/icons/$imageName.png'),
            ),
          ),
        ),
      ),
    );
  }
}
