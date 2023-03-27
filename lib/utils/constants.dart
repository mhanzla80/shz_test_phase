import 'package:playon/all_utils.dart';

typedef BuildContextCallback = void Function(BuildContext context);
Codec<String, String> stringToBase64 = utf8.fuse(base64);
const kMapZoom = 14.0;
const kDefaultPadding = 20.0;
const kEmptyWidget = const SizedBox();
const kEventCardHeaderValueStyle = TextStyle(
    color: AppTheme.darkBlueGreyColor,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 13.0);
const kEventCardHeaderDescriptionStyle = TextStyle(
    color: AppTheme.lightBlueGreyColor,
    fontWeight: FontWeight.w700,
    fontSize: 11.0);

const kEventDateTimePriceLabelTextStyle = TextStyle(
    color: AppTheme.lightBlueGreyColor,
    fontSize: 11.0,
    fontWeight: FontWeight.w700);
const kTabBarTextStyle = TextStyle(fontSize: 18.0);
