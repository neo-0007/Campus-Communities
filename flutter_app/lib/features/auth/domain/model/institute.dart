class Institute {
  final int id;
  final String name;
  final String website;
  final String address;
  final String logoUrl;

  Institute({
    required this.id,
    required this.name,
    required this.website,
    required this.address,
    required this.logoUrl,
  });

  factory Institute.fromJson(Map<String, dynamic> json) {
    return Institute(
      id: json['id'],
      name: json['name'],
      website: json['website'],
      address: json['address'],
      logoUrl: json['logo_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'website': website,
      'address': address,
      'logo_url': logoUrl,
    };
  }
}
