class ReposModel {
  final String? topic;
  final String? subtitle;
  final List<String>? technologiesUsed;
  final String? description;
  final List<String> bullets;
  final String? githubLink;
  final String? imgURL;
  final String? youtubeLink;
  final String? liveLink;
  ReposModel({
    required this.topic,
    this.subtitle,
    required this.githubLink,
    this.youtubeLink,
    this.liveLink,
    required this.description,
    required this.technologiesUsed,
    required this.imgURL,
    this.bullets = const [],
  });
}