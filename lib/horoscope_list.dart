import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/models/horoscope.dart';
import 'package:flutter_burc_rehberi/utils/content.dart';

class HoroscopeList extends StatelessWidget {
  static List<Horoscope> allHoros;
  @override
  Widget build(BuildContext context) {
    allHoros = prepareDataSource();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burçlar"),
      ),
      body: prepList(),
    );
  }

  List<Horoscope> prepareDataSource() {
    List<Horoscope> horoscopes = [];

    for (int i = 0; i < 12; i++) {
      String smallPic = Strings.HOROSCOPE_NAMES[i].toLowerCase() +
          "${i + 1}.png"; //Koc->koc->koc1.png
      String bigPic =
          Strings.HOROSCOPE_NAMES[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Horoscope addedHoro = Horoscope(
          Strings.HOROSCOPE_NAMES[i],
          Strings.HOROSCOPE_DATES[i],
          Strings.HOROSCOPES_DETAIL[i],
          smallPic,
          bigPic);
      horoscopes.add(addedHoro);
    }
    return horoscopes;
  }

  Widget prepList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return singHoroWidget(context, index);
      },
      itemCount: allHoros.length,
    );
  }

  Widget singHoroWidget(BuildContext context, int index) {
    Horoscope addedListHoroscope = allHoros[index];
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/horoscopeDetail/$index"),
          leading: Image.asset("images/" + addedListHoroscope.smallPic,
              width: 64, height: 64),
          title: Text(
            addedListHoroscope.name,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.pinkAccent[100]),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              addedListHoroscope.date,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black45),
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pink[200],
          ),
        ),
      ),
    );
  }
}
