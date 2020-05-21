class CriarUsuarioModel {
  String name;
  String email;
  String username;
  String password;

  CriarUsuarioModel({
    this.name,
    this.email,
    this.username,
    this.password,
  });

  CriarUsuarioModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
