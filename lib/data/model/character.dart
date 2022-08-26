class Character {
  Character({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.appearance,
    required this.nickname,
    required this.portrayed,
  });

  Character.fromJson(dynamic json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation =
        json['occupation'] != null ? json['occupation'].cast<String>() : [];
    img = json['img'];
    status = json['status'];
    appearance =
        json['appearance'] != null ? json['appearance'].cast<int>() : [];
    nickname = json['nickname'];
    portrayed = json['portrayed'];
  }
  late int charId;
  late String name;
  late String birthday;
  late List<String> occupation;
  late String img;
  late String status;
  late List<int> appearance;
  late String nickname;
  late String portrayed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['char_id'] = charId;
    map['name'] = name;
    map['birthday'] = birthday;
    map['occupation'] = occupation;
    map['img'] = img;
    map['status'] = status;
    map['appearance'] = appearance;
    map['nickname'] = nickname;
    map['portrayed'] = portrayed;
    return map;
  }
}
