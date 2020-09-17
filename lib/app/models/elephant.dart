class Elephant {
  String id;
  String name;
  String species;
  String sex;
  String image;

  Elephant({this.id, this.name, this.species, this.sex, this.image});

  Elephant.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    species = json['species'];
    sex = json['sex'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['species'] = this.species;
    data['sex'] = this.sex;
    data['image'] = this.image;
    return data;
  }
}
