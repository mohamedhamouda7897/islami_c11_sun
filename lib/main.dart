import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:islami_c11_sun/hadeth_deatils_screen.dart';
import 'package:islami_c11_sun/home/home.dart';
import 'package:islami_c11_sun/my_theme_Data.dart';
import 'package:islami_c11_sun/providers/my_provider.dart';
import 'package:islami_c11_sun/providers/sura_details_provider.dart';
import 'package:islami_c11_sun/sura_details_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // get value
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => SuraDetailsProvider(),
        // ),
      ],
      child: EasyLocalization(
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
          ],
          path: 'assets/translations',
          saveLocale: true,
          startLocale: Locale("en"),
          child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      themeMode: pro.appTheme,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
    );
  }
}
