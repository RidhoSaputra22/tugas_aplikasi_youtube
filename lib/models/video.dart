import 'package:tugas_aplikasi_youtube/models/komentar.dart';
import 'package:tugas_aplikasi_youtube/models/user.dart';

class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String datePosted;
  final String views;
  final String likes;
  final String description;
  final User user;
  final List<Komentar> komentar;

  Video({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.datePosted,
    required this.views,
    required this.likes,
    required this.description,
    required this.user,
    required this.komentar,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
      datePosted: json['datePosted'],
      views: json['views'],
      likes: json['likes'],
      description: json['description'],
      user: User.fromJson(json['user']),
      komentar: (json['komentar'] as List<dynamic>)
          .map((e) => Komentar.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'thumbnailUrl': thumbnailUrl,
      'datePosted': datePosted,
      'views': views,
      'likes': likes,
      'description': description,
      'user': user.toJson(),
      'komentar': komentar.map((e) => e.toJson()).toList(),
    };
  }

  static List<Video> generate() => [
        Video(
          id: "1",
          title: "Wild breakthrough on Math after 56 years... [Exclusive]",
          thumbnailUrl: "images/video/1.png",
          datePosted: "15 Mei 2025",
          views: "46K",
          likes: "1,7 rb", // Data jumlah likes tidak tersedia
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ", // Data jumlah likes tidak tersedia
          user: User.generate()[0],
          komentar: Komentar.generate(),
        ),
        Video(
          id: "2",
          title: "lain sings u duvet",
          thumbnailUrl: "images/video/2.png",
          datePosted: "15 Mei 2023",
          views: "1.1M",
          likes: "", // Data jumlah likes tidak tersedia
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ", // Data jumlah likes tidak tersedia
          user: User.generate()[1],
          komentar: Komentar.generate(),
        ),
        Video(
          id: "3",
          title: "New maths discoveries! All announced at once!",
          thumbnailUrl: "images/video/3.png",
          datePosted: "15 Mei 2025",
          views: "87K",
          likes: "1,5 jt", // Data jumlah likes tidak tersedia
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ", // Data jumlah likes tidak tersedia
          user: User.generate()[2],
          komentar: Komentar.generate(),
        ),
        Video(
          id: "4",
          title: "Google's New \"AlphaEvolve\" SHOCKING Ability...",
          thumbnailUrl: "images/video/4.png",
          datePosted: "15 Mei 2025",
          views: "50K",
          likes: "2,34 rb", // Data jumlah likes tidak tersedia
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ", // Data jumlah likes tidak tersedia
          user: User.generate()[3],
          komentar: Komentar.generate(),
        ),
        Video(
          id: "5",
          title: "Lain sings u duvet - Juliana Chahayed's Cover of Bôa - Duvet",
          thumbnailUrl: "images/video/5.png",
          datePosted: "15 Mei 2023",
          views: "1.6M",
          likes: "", // Data jumlah likes tidak tersedia
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ", // Data jumlah likes tidak tersedia
          user: User.generate()[4],
          komentar: Komentar.generate(),
        ),
        Video(
          id: "6",
          title: "New \"Absolute Zero\" Model Learns with NO DATA",
          thumbnailUrl: "images/video/6.png",
          datePosted: "9 Mei 2025",
          views: "60K",
          likes: "", // Data jumlah likes tidak tersedia
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ", // Data jumlah likes tidak tersedia
          user: User.generate()[5],
          komentar: Komentar.generate(),
        ),
      ];
}
