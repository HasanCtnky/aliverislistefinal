import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alisverislistedeneme/database/dbHelper.dart';
import 'package:alisverislistedeneme/database/Urun.dart';

class UrunEkle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UrunEkleState();
  }
}

class UrunEkleState extends State {
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Yeni ürün ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildNameField(),
            buildDescriptionField(),
            buildUnitPriceField(),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  Widget buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürünün fiyatı"),
      controller: txtPrice,
    );
  }

  Widget buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürünün adı"),
      controller: txtName,
    );
  }

  Widget buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürünün açıklaması"),
      controller: txtDescription,
    );
  }

  buildSaveButton() {
    return FlatButton(
      child: Text("Ekle"),
      textColor: Colors.black,
      onPressed: () {
        ekleUrun();
      },
    );
  }

  void ekleUrun() async {
    var result = await dbHelper.insert(Product(
        name: txtName.text,
        description: txtDescription.text,
        Price: double.tryParse(txtPrice.text)));
    Navigator.pop(context, true);
  }
}