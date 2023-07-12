/// id : 1
/// email : "John@gmail.com"
/// username : "johnd"
/// password : "m38rmF$"
/// name : {"firstname":"John","lastname":"Doe"}
/// address : {"city":"kilcoole","street":"7835 new road","number":3,"zipcode":"12926-3874","geolocation":{"lat":"-37.3159","long":"81.1496"}}
/// phone : "1-570-236-7033"

class UserModel {
  UserModel({
      num? id, 
      String? email, 
      String? username, 
      String? password, 
      Name? name,
      Address? address, 
      String? phone,}){
    _id = id;
    _email = email;
    _username = username;
    _password = password;
    _name = name;
    _address = address;
    _phone = phone;
}

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _username = json['username'];
    _password = json['password'];
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _phone = json['phone'];
  }
  num? _id;
  String? _email;
  String? _username;
  String? _password;
  Name? _name;
  Address? _address;
  String? _phone;
UserModel copyWith({  num? id,
  String? email,
  String? username,
  String? password,
  Name? name,
  Address? address,
  String? phone,
}) => UserModel(  id: id ?? _id,
  email: email ?? _email,
  username: username ?? _username,
  password: password ?? _password,
  name: name ?? _name,
  address: address ?? _address,
  phone: phone ?? _phone,
);
  num? get id => _id;
  String? get email => _email;
  String? get username => _username;
  String? get password => _password;
  Name? get name => _name;
  Address? get address => _address;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['username'] = _username;
    map['password'] = _password;
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['phone'] = _phone;
    return map;
  }

}

/// city : "kilcoole"
/// street : "7835 new road"
/// number : 3
/// zipcode : "12926-3874"
/// geolocation : {"lat":"-37.3159","long":"81.1496"}

class Address {
  Address({
      String? city, 
      String? street, 
      num? number, 
      String? zipcode, 
      Geolocation? geolocation,}){
    _city = city;
    _street = street;
    _number = number;
    _zipcode = zipcode;
    _geolocation = geolocation;
}

  Address.fromJson(dynamic json) {
    _city = json['city'];
    _street = json['street'];
    _number = json['number'];
    _zipcode = json['zipcode'];
    _geolocation = json['geolocation'] != null ? Geolocation.fromJson(json['geolocation']) : null;
  }
  String? _city;
  String? _street;
  num? _number;
  String? _zipcode;
  Geolocation? _geolocation;
Address copyWith({  String? city,
  String? street,
  num? number,
  String? zipcode,
  Geolocation? geolocation,
}) => Address(  city: city ?? _city,
  street: street ?? _street,
  number: number ?? _number,
  zipcode: zipcode ?? _zipcode,
  geolocation: geolocation ?? _geolocation,
);
  String? get city => _city;
  String? get street => _street;
  num? get number => _number;
  String? get zipcode => _zipcode;
  Geolocation? get geolocation => _geolocation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    map['street'] = _street;
    map['number'] = _number;
    map['zipcode'] = _zipcode;
    if (_geolocation != null) {
      map['geolocation'] = _geolocation?.toJson();
    }
    return map;
  }

}

/// lat : "-37.3159"
/// long : "81.1496"

class Geolocation {
  Geolocation({
      String? lat, 
      String? long,}){
    _lat = lat;
    _long = long;
}

  Geolocation.fromJson(dynamic json) {
    _lat = json['lat'];
    _long = json['long'];
  }
  String? _lat;
  String? _long;
Geolocation copyWith({  String? lat,
  String? long,
}) => Geolocation(  lat: lat ?? _lat,
  long: long ?? _long,
);
  String? get lat => _lat;
  String? get long => _long;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['long'] = _long;
    return map;
  }

}

/// firstname : "John"
/// lastname : "Doe"

class Name {
  Name({
      String? firstname, 
      String? lastname,}){
    _firstname = firstname;
    _lastname = lastname;
}

  Name.fromJson(dynamic json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
  }
  String? _firstname;
  String? _lastname;
Name copyWith({  String? firstname,
  String? lastname,
}) => Name(  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
);
  String? get firstname => _firstname;
  String? get lastname => _lastname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    return map;
  }

}