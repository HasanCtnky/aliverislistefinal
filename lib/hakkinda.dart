import 'dart:convert';
import 'package:flutter/material.dart';

class Hakkinda extends StatefulWidget {
  @override
  _HakkindaState createState() => _HakkindaState();
}
class _HakkindaState extends State<Hakkinda> {

  List data;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
          title: Text("Hakkında Sayfası"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("assets/jsonhakkinda.json"),
            builder: (context, snapshot){

              var mydata = jsonDecode(snapshot.data.toString());



              return ListView.builder(
                  itemBuilder: (BuildContext context, int index)
                      {
                        return Column(
                          children: <Widget> [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text(mydata["hakkinda_data"][index]["hakkinda"]
                                        ,style: TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center, ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/');
                                        },
                                        child: Text('Ürün Listesi Sayfasına Dön'),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}




