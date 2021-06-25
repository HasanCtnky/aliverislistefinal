import 'package:flutter/material.dart';

class HareketAnimasyon extends StatefulWidget {
  @override
  _HareketAnimasyonState createState() => _HareketAnimasyonState();
}

class _HareketAnimasyonState extends State<HareketAnimasyon>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = 
        AnimationController(duration:Duration(seconds:1), vsync: this);
        _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut)
    ..addListener(() => this.setState(() {}))
    ..addStatusListener((durum) {
      debugPrint(durum.toString());
    });
        _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          title: Text("Giriş Sayfası"),
          backgroundColor: Colors.black,
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_basket,
                        size: 24 + _animation.value*24,
                        color: Colors.black,
                      ),
                      Text("Ürünler Sayfasi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12 + _animation.value*12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.place,
                        size: 24 + _animation.value*24,
                        color: Colors.black,
                      ),
                      Text("Marketler Sayfasi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12 + _animation.value*12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        size: 24 + _animation.value*24,
                        color: Colors.black,
                      ),

                      Text("Hakkinda Sayfasi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12 + _animation.value*12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
