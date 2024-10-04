class CafeItem {
  final String name;
  final double price;
  final String imageUrl;
  final String description; // Optional field for extra info
  final bool isSpecial; // Indicates whether the item is special
  final bool isPopular; // Indicates whether the item is popular
  final String category;

  CafeItem( {
    required this.category,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.description = 'no description available',
    this.isSpecial = false, // Default is not special
    this.isPopular = false, // Default is not popular
  });
}
