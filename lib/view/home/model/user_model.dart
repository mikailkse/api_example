class UserModel {
  String name;
  String imageUrl;
  UserModel({
    required this.name,
    required this.imageUrl,
  });

  factory UserModel.fake() {
    return UserModel(
      name: 'Mikail',
      imageUrl:
          'https://pps.whatsapp.net/v/t61.24694-24/176223894_1331640290630594_5915119862977707976_n.jpg?ccb=11-4&oh=00b9141a7dbac27cfebf4199f1c15c31&oe=61D65521',
    );
  }
}
