class articleModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String url; // Add the URL field

  articleModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.url, // Include the URL in the constructor
  });

  // Factory method to create articleModel from JSON
  factory articleModel.fromJson(Map<String, dynamic> json) {
    return articleModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      url: json['url'], // Make sure to include the URL
    );
  }
}
