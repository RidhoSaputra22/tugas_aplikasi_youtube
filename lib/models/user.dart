class User {
  final String uid;
  final String nama;
  final String photo;

  User({
    required this.uid,
    required this.nama,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      nama: json['nama'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'nama': nama,
        'photo': photo,
      };

  static List<User> generate() => [
        User(
          uid: "MachineLearningStreetTalk",
          nama: "Machine Learning Street Talk",
          photo: "images/user/1.png",
        ),
        User(
          uid: "JulianaChahayed",
          nama: "Juliana Chahayed",
          photo: "images/user/2.png",
        ),
        User(
          uid: "NeoUrban",
          nama: "Neo Urban",
          photo: "images/user/3.png",
        ),
        User(
          uid: "AlphaTechOfficial",
          nama: "Alpha Tech",
          photo: "images/user/4.png",
        ),
        User(
          uid: "ArtMixVision",
          nama: "ArtMix Vision",
          photo: "images/user/5.png",
        ),
        User(
          uid: "RomanoGeopolitics",
          nama: "Romano Geopolitics",
          photo: "images/user/6.png",
        ),
      ];
}
