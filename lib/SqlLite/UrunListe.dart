import 'package:alisverislistedeneme/SqlLite/UrunEkle.dart';
import 'package:alisverislistedeneme/database/Urun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alisverislistedeneme/database/dbHelper.dart';
import 'package:alisverislistedeneme/SqlLite/UrunDetay.dart';

class UrunListe extends StatefulWidget {
  @override
  State createState() {
    return _UrunListeState();
  }
}

class _UrunListeState extends State {
  var dbHelper = DbHelper();
  List products;
  int productCount = 0;
  @override
  void initState() {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) {
      this.products = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Ürün Listesi"),
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        onPressed: () {
          gotoProductAdd();
        },
        child: Icon(Icons.add),
        tooltip: "Yeni ürün ekle",
      ),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
        itemCount: productCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.orangeAccent,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage('assets/images/Urun.png')),
              title: Text(this.products[position].name),
              subtitle: Text(this.products[position].description),

              onLongPress: () {
                goToDetail(this.products[position]);
              },
            ),
          );
        });
  }

  void gotoProductAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => UrunEkle()));
    if (result != null) {
      if (result == true) {
        getProducts();
      }
    }
  }

  void getProducts() async {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) {
      setState(() {
        this.products = data;
        productCount = data.length;
      });
    });
  }

  void goToDetail(Product product) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => UrunDetay(product)));
    if (result != null) {
      if (result) {
        getProducts();
      }
    }
  }
}