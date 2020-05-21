class Empregado {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Empregado(
      {this.id, this.email, this.firstName, this.lastName, this.avatar});

  Empregado.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}