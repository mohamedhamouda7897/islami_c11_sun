import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c11_sun/app_colors.dart';
import 'package:islami_c11_sun/providers/sura_details_provider.dart';
import 'package:islami_c11_sun/sura_model.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = "SuraDetailsScreen";

  SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;

    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..loadSuraFile(model.index),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);

        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/main_bg.png"))),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                model.name,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
              child: Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(color: AppColors.primary)),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(
                      "${provider.verses[index]} ($index )",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.elMessiri(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF242424),
                      ),
                    );
                  },
                  itemCount: provider.verses.length,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
