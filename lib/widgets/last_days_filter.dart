import 'package:flutter/material.dart';
import 'package:playon/utils/app_theme.dart';

class LastDaysFilter extends StatelessWidget {
  const LastDaysFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const list = [3, 7, 14, 30, 90];
    final buttons = list.map((e) {
      return Column(
        children: [
          Material(
            color: AppTheme.primary,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(e),
              child: Container(
                height: 35,
                padding: const EdgeInsets.all(5),
                child: Text('Last $e days',
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: Colors.white)),
                alignment: Alignment.centerLeft,
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      );
    });
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Filter by', style: Theme.of(context).textTheme.headline5),
          const SizedBox(height: 20),
          ...buttons,
        ],
      ),
    );
  }
}
