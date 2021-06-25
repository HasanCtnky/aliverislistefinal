import 'package:alisverislistedeneme/AnimasyonluGirisSayfasi/animasyon.dart';
import 'package:alisverislistedeneme/Marketler/MarketlerSayfasi.dart';
import 'package:alisverislistedeneme/SqlLite/UrunListe.dart';
import 'package:alisverislistedeneme/hakkinda.dart';
import 'package:flutter/material.dart';
import 'package:alisverislistedeneme/HTTP/Urun_Servis.dart';


class AlisverisListesiSayfasi extends StatefulWidget {
  @override
  _AlisverisListesiSayfasiState createState() =>
      _AlisverisListesiSayfasiState();
}

class _AlisverisListesiSayfasiState extends State<AlisverisListesiSayfasi> {
  int _secilisayfa = 1;
  final _scaffoldState = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  UrunServis _itemService;

  @override
  void initState() {
    _itemService = UrunServis();
    _pageController.addListener(() {
      int currentIndex = _pageController.page.round();
      if (currentIndex != _secilisayfa) {
        _secilisayfa = currentIndex;

        setState(() {});
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Alışveriş Listesi"),
      ),






      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                "Giriş",
                style: TextStyle(color: Colors.red),
              ),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text(
                "Ürün Listesi",
                style: TextStyle(color: Colors.red),
              ),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.place),
              title: Text(
                "Marketler Listesi",
                style: TextStyle(color: Colors.red),
              ),
              backgroundColor: Colors.black),
         BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(
                "Hakkinda",
                  style: TextStyle(color: Colors.red),
              ),
              backgroundColor: Colors.black),
        ],
        currentIndex: _secilisayfa,
        onTap: _onTap,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HareketAnimasyon(),
          UrunListe(),
          MarketlerSayfasi(),
          Hakkinda(),
        ],
      ),
    );
  }

  void _onTap(int value) {
    setState(() {
      _secilisayfa = value;
    });
    _pageController.jumpToPage(value);
  }
}
