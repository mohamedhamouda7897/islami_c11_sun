import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_c11_sun/app_colors.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    Locale currentLocale = context.locale;
    return Container(
      // height: MediaQuery.of(context).size.height * 0.80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              context.setLocale(Locale("en"));
              // provider.changeLanguage(context,"en");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "english".tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: currentLocale == Locale('en')
                          ? AppColors.primary
                          : AppColors.colorBlack),
                ),
                currentLocale == Locale('en')
                    ? Icon(
                        Icons.done,
                        size: 35,
                      )
                    : SizedBox()
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              // provider.changeLanguage(context,"ar");
              context.setLocale(Locale("ar"));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("arabic".tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: currentLocale != Locale('en')
                            ? AppColors.primary
                            : AppColors.colorBlack)),
                currentLocale != Locale('en')
                    ? Icon(
                        Icons.done,
                        size: 35,
                      )
                    : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
