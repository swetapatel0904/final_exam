class HomeModel {
  String? name, email;

  HomeModel({this.name, this.email});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(email: m1['email'], name: m1['name']);
  }
}
