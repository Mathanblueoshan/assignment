class Details {
  String? type;
  String? id;
  int? askingPrice;
  String? municipality;
  String? area;
  int? daysSincePublish;
  int? livingArea;
  int? numberOfRooms;
  String? streetAddress;
  String? image;
  String? description;
  String? patio;

  Details(
      {this.type,
      this.id,
      this.askingPrice,
      this.municipality,
      this.area,
      this.daysSincePublish,
      this.livingArea,
      this.numberOfRooms,
      this.streetAddress,
      this.image,
      this.description,
      this.patio});

  Details.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    askingPrice = json['askingPrice'];
    municipality = json['municipality'];
    area = json['area'];
    daysSincePublish = json['daysSincePublish'];
    livingArea = json['livingArea'];
    numberOfRooms = json['numberOfRooms'];
    streetAddress = json['streetAddress'];
    image = json['image'];
    description = json['description'];
    patio = json['patio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['askingPrice'] = this.askingPrice;
    data['municipality'] = this.municipality;
    data['area'] = this.area;
    data['daysSincePublish'] = this.daysSincePublish;
    data['livingArea'] = this.livingArea;
    data['numberOfRooms'] = this.numberOfRooms;
    data['streetAddress'] = this.streetAddress;
    data['image'] = this.image;
    data['description'] = this.description;
    data['patio'] = this.patio;
    return data;
  }
}