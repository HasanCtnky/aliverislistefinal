class Product {
  int id;
  String name;
  String description;
  double Price;

  Product.widthId({this.id, this.name, this.description, this.Price});
  Product({this.name, this.description, this.Price});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["description"] = description;
    map["Price"] = Price;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Product.fromObject(dynamic o) {
    this.id = int.tryParse(o["id"].toString());
    this.name = o["name"];
    this.description = o["description"];
    this.Price = double.tryParse(o["Price"].toString());
  }
}