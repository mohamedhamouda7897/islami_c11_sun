import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c11_sun/app_colors.dart';
import 'package:islami_c11_sun/home/tabs/ahadeth_tab.dart';
import 'package:islami_c11_sun/home/tabs/quran_tab.dart';
import 'package:islami_c11_sun/home/tabs/radio_tab.dart';
import 'package:islami_c11_sun/home/tabs/sebha_tab.dart';
import 'package:islami_c11_sun/home/tabs/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/main_bg.png"),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              "Islami",
              style: GoogleFonts.elMessiri(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF242424),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            type: BottomNavigationBarType.shifting,
            unselectedItemColor: Colors.white,
            backgroundColor:  AppColors.primary,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  backgroundColor:  AppColors.primary,
                  icon: ImageIcon(AssetImage("assets/images/moshaf_blue.png")),
                  label: "Quran"),
              BottomNavigationBarItem(
                  backgroundColor: AppColors.primary,
                  icon: ImageIcon(AssetImage("assets/images/sebha_blue.png")),
                  label: "Sebha"),
              BottomNavigationBarItem(
                  backgroundColor:  AppColors.primary,
                  icon: ImageIcon(AssetImage("assets/images/radio_blue.png")),
                  label: "Radio"),
              BottomNavigationBarItem(
                  backgroundColor:  AppColors.primary,
                  icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                  label: "Ahadeth"),
              BottomNavigationBarItem(
                  backgroundColor:  AppColors.primary,
                  icon: Icon(Icons.settings),
                  label: "Settings")
            ],
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    SettingsTab()
  ];
}
