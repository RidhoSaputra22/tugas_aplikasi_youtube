class User {
  String uid;
  String nama;
  String tanggal_lahir;
  String gender;
  String email;
  String password;
  String photo;

  User({
    required this.uid,
    required this.nama,
    required this.tanggal_lahir,
    required this.gender,
    required this.email,
    required this.password,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json['uid'],
        nama: json['nama'],
        tanggal_lahir: json['tanggal_lahir'],
        gender: json['gender'],
        email: json['email'],
        password: "",
        photo: json['photo'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'nama': nama,
        'tanggal_lahir': tanggal_lahir,
        'gender': gender,
        'email': email,
        'password': password,
        'photo': photo,
      };

  static List<User> generate() => [
        User(
          uid: "MachineLearningStreetTalk",
          nama: "Machine Learning Street Talk",
          tanggal_lahir: "1990-01-01",
          gender: "Male",
          email: "ml@talk.com",
          password: "123456",
          photo: "http://localhost:3000/user/1.png",
        ),
        User(
          uid: "JulianaChahayed",
          nama: "Juliana Chahayed",
          tanggal_lahir: "1995-05-10",
          gender: "Female",
          email: "juliana@example.com",
          password: "password123",
          photo: "http://localhost:3000/user/2.png",
        ),
        User(
          uid: "NeoUrban",
          nama: "Neo Urban",
          tanggal_lahir: "1988-08-20",
          gender: "Male",
          email: "neo@urban.com",
          password: "secure123",
          photo: "http://localhost:3000/user/3.png",
        ),
        User(
          uid: "AlphaTechOfficial",
          nama: "Alpha Tech",
          tanggal_lahir: "1992-02-28",
          gender: "Other",
          email: "alpha@tech.com",
          password: "alpha456",
          photo: "http://localhost:3000/user/4.png",
        ),
        User(
          uid: "ArtMixVision",
          nama: "ArtMix Vision",
          tanggal_lahir: "1997-11-11",
          gender: "Female",
          email: "artmix@vision.com",
          password: "vision789",
          photo: "http://localhost:3000/user/5.png",
        ),
        User(
          uid: "RomanoGeopolitics",
          nama: "Romano Geopolitics",
          tanggal_lahir: "1980-07-07",
          gender: "Male",
          email: "romano@geo.com",
          password: "romano321",
          photo: "http://localhost:3000/user/6.png",
        ),
      ];
}
