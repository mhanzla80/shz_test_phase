import 'package:playon/all_utils.dart';

class VerticalSpacing extends StatelessWidget {
  final double of;

  const VerticalSpacing({Key? key, this.of = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(height: of.h);
}

class HorizontalSpacing extends StatelessWidget {
  final double of;

  const HorizontalSpacing({Key? key, this.of = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: of.w);
  }
}

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: AppTheme.lightBlueGreyColor);
  }
}
