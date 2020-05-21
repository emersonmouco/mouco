class CategoriaModel {
  String id;
  String title;
  String tag;

  CategoriaModel({this.id, this.title, this.tag});

  CategoriaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['tag'] = this.tag;
    return data;
  }
}
