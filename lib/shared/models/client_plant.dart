class ClientPlant {
  late String id;
  late String userId;
  late String imageUri;
  late String name;
  late String about;
  late String waterTips;
  late String txtAlarm;

  ClientPlant({
    required this.userId,
    required this.imageUri,
    required this.name,
    required this.about,
    required this.waterTips,
    required this.txtAlarm,
  });

  ClientPlant.fromMap(Map<String, dynamic> map, String id) {
    this.id = id;
    this.userId = map['userId'];
    this.imageUri = map['imageUri'];
    this.name = map['name'];
    this.about = map['about'];
    this.waterTips = map['waterTips'];
    this.txtAlarm = map['txtAlarm'];
  }

  toMap() {
    return {
      'userId': this.userId,
      'imageUri': this.imageUri,
      'name': this.name,
      'about': this.about,
      'waterTips': this.waterTips,
      'txtAlarm': this.txtAlarm
    };
  }
}
