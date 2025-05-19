import 'package:tugas_aplikasi_youtube/models/user.dart';

class Komentar {
  final String id;
  final String komentar;
  final String dateCreated;
  final User user;

  Komentar({
    required this.id,
    required this.komentar,
    required this.dateCreated,
    required this.user,
  });

  factory Komentar.fromJson(Map<String, dynamic> json) {
    return Komentar(
      id: json['id'],
      komentar: json['komentar'],
      dateCreated: json['dateCreated'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'komentar': komentar,
        'dateCreated': dateCreated,
        'user': user.toJson(),
      };
  static List<Komentar> generate() => [
        Komentar(
          id: "1",
          komentar: "Video yang sangat bagus!",
          dateCreated: "15 Mei 2025",
          user: User.generate()[0],
        ),
        Komentar(
          id: "2",
          komentar: "Saya suka video ini.",
          dateCreated: "15 Mei 2023",
          user: User.generate()[1],
        ),
        Komentar(
          id: "3",
          komentar: "Kontennya menarik dan bermanfaat.",
          dateCreated: "10 Mei 2025",
          user: User.generate()[2],
        ),
        Komentar(
          id: "4",
          komentar: "Bagus banget videonya.",
          dateCreated: "12 Mei 2025",
          user: User.generate()[3],
        ),
        Komentar(
          id: "5",
          komentar: "Mantap, terus berkarya!",
          dateCreated: "13 Mei 2025",
          user: User.generate()[4],
        ),
        Komentar(
          id: "6",
          komentar: "Video ini keren!",
          dateCreated: "14 Mei 2025",
          user: User.generate()[5],
        ),
      ];
}
