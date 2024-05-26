class Pets{
  String id = '';
  String name = '';
  String age = '';
  String breed = '';
  String img = '';

  Pets(this.id, this.name, this.age, this.breed, this.img,
  );

  Pets.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    age = json['age'];
    breed = json['breed'];
    img = json['img'];
  }
}