import 'package:playon/all_utils.dart';

class HeaderText extends StatelessWidget {
  final String header;
  final String subtitle;

  const HeaderText({
    required this.header,
    this.subtitle = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header.toText(
            fontSize: 32,
            textAlign: TextAlign.center,
            color: AppTheme.darkBlueGreyColor),
        subtitle.toText(color: AppTheme.lightBlueGreyColor),
      ],
    );
  }
}
