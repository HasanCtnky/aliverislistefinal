import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MarketlerSayfasi extends StatefulWidget {
  @override
  _MarketlerSayfasiState createState() => _MarketlerSayfasiState();
}

class _MarketlerSayfasiState extends State<MarketlerSayfasi> {
  final _firestore=FirebaseFirestore.instance;
  TextEditingController adController = TextEditingController();
  TextEditingController adresController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference marketlerRef = _firestore.collection('marketler');
    var migrosRef = marketlerRef.doc("Migros");

    return Scaffold(
      appBar:
      AppBar(title: Text("Marketler"),
          backgroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [

              StreamBuilder<QuerySnapshot>(
                stream: marketlerRef.snapshots(),

                builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {

                  if(asyncSnapshot.hasError){
                    return Center (
                        child: Text ("Bir Hata Oluştu, Tekrar Deneyiniz"));
                  }
                  else{
                    if(asyncSnapshot.hasData){
                      List<DocumentSnapshot> listOfDocumentSnap =
                          asyncSnapshot.data.docs;

                      return Flexible(
                        child: ListView.builder(
                          itemCount: listOfDocumentSnap.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.all(10),
                              elevation: 20,
                              color: Colors.lightBlue[200],
                              child:ListTile(
                                title:Text(
                                    '${listOfDocumentSnap[index].data()}',
                                    style: TextStyle(fontSize: 24)),
                                leading: CircleAvatar(backgroundImage: AssetImage('assets/images/market.jpg')),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () async{
                                    await listOfDocumentSnap[index].reference.delete();
                                  },

                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }else{
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
