class MovieModel{
  final String title;
  final String description;
  final List<String> actors;
  final int like;
  final String bannerUrl;
  final List<String> screens;

  MovieModel({
    required this.title,
    required this.description,
    required this.actors,
    required this.like,
    required this.bannerUrl,
    this.screens = const [
      "3D",
      "2D",
    ],
  });

  MovieModel copyWith({
    String? title,
    String? description,
    List<String>? actors,
    int? like,
    String? bannerUrl,
    List<String>? screens,
  }) {
    return MovieModel(
      title: title ?? this.title,
      description: description ?? this.description,
      actors: actors ?? this.actors,
      like: like ?? this.like,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      screens: screens ?? this.screens,
    );
  }


}