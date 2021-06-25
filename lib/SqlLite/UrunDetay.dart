import 'package:flutter/material.dart';
import 'package:alisverislistedeneme/database/dbHelper.dart';
import 'package:alisverislistedeneme/database/Urun.dart';

class UrunDetay extends StatefulWidget {
  Product product;
  UrunDetay(this.product);
  @override
  State<StatefulWidget> createState() {
    return _UrunDetayState(product);
  }
}

enum Options { delete, update }

class _UrunDetayState extends State {
  Product product;
  _UrunDetayState(this.product);
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtPrice = TextEditingController();

  @override
  void initState() {
    txtName.text = product.name;
    txtDescription.text = product.description;
    txtPrice.text = product.Price.toString();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(" Ürün detayı : ${product.name}"),
        actions: <Widget>[
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              PopupMenuItem<Options>(
                value: Options.delete,
                child: Text("Sil"),
              ),
              PopupMenuItem<Options>(
                value: Options.update,
                child: Text("Güncelle"),
              ),
            ],
          )
        ],
      ),
      body: buildUrunDetay(),
    );
  }

  buildUrunDetay() {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          buildNameField(),
          buildDescriptionField(),
          buildUnitPriceField()
        ],
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

  void selectProcess(Options options) async {
    switch (options) {
      case Options.delete:
        await dbHelper.delete(product.id);
        Navigator.pop(context, true);
        break;
      case Options.update:
        await dbHelper.update(Product.widthId(
            id: product.id,
            name: txtName.text,
            description: txtDescription.text,
            Price: double.tryParse(txtPrice.text)));
        Navigator.pop(context, true);
        break;
      default:
    }
  }
}