/// id : 1
/// title : "..."
/// price : "..."
/// category : "..."
/// description : "..."
/// image : "..."

class ProductModel {
  ProductModel({
      num? id, 
      String? title, 
      String? price, 
      String? category, 
      String? description, 
      String? image,}){
    _id = id;
    _title = title;
    _price = price;
    _category = category;
    _description = description;
    _image = image;
}

  ProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'].toString();
    _category = json['category'];
    _description = json['description'];
    _image = json['image'];
  }
  num? _id;
  String? _title;
  String? _price;
  String? _category;
  String? _description;
  String? _image;
ProductModel copyWith({  num? id,
  String? title,
  String? price,
  String? category,
  String? description,
  String? image,
}) => ProductModel(  id: id ?? _id,
  title: title ?? _title,
  price: price ?? _price,
  category: category ?? _category,
  description: description ?? _description,
  image: image ?? _image,
);
  num? get id => _id;
  String? get title => _title;
  String? get price => _price;
  String? get category => _category;
  String? get description => _description;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['category'] = _category;
    map['description'] = _description;
    map['image'] = _image;
    return map;
  }

}