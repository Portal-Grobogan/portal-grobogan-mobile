class HeroSlide {
  final String id;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String linkUrl;
  
  const HeroSlide({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.linkUrl,
  });

  factory HeroSlide.fromJson(Map<String, dynamic> json) {
    return HeroSlide(
      id: json['id'].toString(),
      imageUrl: json['image_url'].toString(),
      title: json['judul'].toString(),
      subtitle: (json['deskripsi'] ?? '').toString(),
      linkUrl: json['link_url']?.toString() ?? '',
    );
  }
}
