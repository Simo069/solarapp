import 'package:google_maps_flutter/google_maps_flutter.dart';
class InstallerProfile {
  final String id;
  final String name;
  final double rating;
  final String certification;
  final String company;
  final String experience;
  final String serviceArea;
  final String contact;
  final String description;
  final String imageUrl;
  final int price;
  final LatLng position;


  InstallerProfile({
    required this.id,
    required this.name,
    required this.rating,
    required this.certification,
    required this.company,
    required this.experience,
    required this.serviceArea,
    required this.contact,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.position,
  });

  // Factory method to create profile from JSON
  factory InstallerProfile.fromJson(Map<String, dynamic> json) {
    return InstallerProfile(
      id: json['id'],
      name: json['name'],
      rating: json['rating'].toDouble(),
      certification: json['certification'],
      company: json['company'],
      experience: json['experience'],
      serviceArea: json['serviceArea'],
      contact: json['contact'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      position: LatLng(
        json['position']['latitude'],
        json['position']['longitude'],
      ),
    );
  }

}


