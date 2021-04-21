import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/horoscope_list.dart';
import 'package:flutter_burc_rehberi/models/horoscope.dart';
import 'package:palette_generator/palette_generator.dart';

class HoroscopeDetail extends StatefulWidget {
  int upcomingIndex;

  HoroscopeDetail(this.upcomingIndex);

  @override
  _HoroscopeDetailState createState() => _HoroscopeDetailState();
}

class _HoroscopeDetailState extends State<HoroscopeDetail> {
  Horoscope chosenHoro;
  Color dominantColor;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    chosenHoro = HoroscopeList.allHoros[widget.upcomingIndex];
    findDominantColor();
  }

  void findDominantColor() {
    Future<PaletteGenerator> fPaletteGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("images/" + chosenHoro.bigPic));

    fPaletteGenerator.then((value) {
      paletteGenerator = value;
      paletteGenerator.dominantColor.color.toString();

      setState(() {
        dominantColor = paletteGenerator.vibrantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        primary: true,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor:
                dominantColor != null ? dominantColor : Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + chosenHoro.bigPic,
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: Text(chosenHoro.name + " Burcu ve Özellikleri"),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 16, left: 8, right: 4),
              child: SingleChildScrollView(
                child: Text(
                  chosenHoro.detail,
                  style: TextStyle(fontSize: 18, color: Colors.black45),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
