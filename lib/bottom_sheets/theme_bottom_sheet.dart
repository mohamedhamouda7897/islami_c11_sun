import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_c11_sun/app_colors.dart';
import 'package:islami_c11_sun/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Container(
      // height: MediaQuery.of(context).size.height * 0.80,
      decoration: BoxDecoration(
        color: provider.appTheme == ThemeMode.dark
            ? AppColors.primaryDark
            : Colors.white,
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
              provider.changeTheme(ThemeMode.light);

              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "light".tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: provider.appTheme == ThemeMode.dark
                          ? Colors.white
                          : AppColors.primary),
                ),
                provider.appTheme == ThemeMode.dark
                    ? SizedBox()
                    : Icon(
                        Icons.done,
                        size: 35,
                      )
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              //change var
              // setState
              provider.changeTheme(ThemeMode.dark);

              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("dark".tr(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: provider.appTheme == ThemeMode.dark
                            ? AppColors.yellowColor
                            : AppColors.colorBlack)),
                provider.appTheme == ThemeMode.light
                    ? SizedBox()
                    : Icon(
                        Icons.done,
                        size: 35,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
