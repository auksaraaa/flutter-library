class Book {
  final String? id;
  final String title;
  final String author;
  final String category;

  Book({
    this.id,
    required this.title,
    required this.author,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'category': category,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map, String documentId) {
    return Book(
      id: documentId,
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      category: map['category'] ?? '',
    );
  }
}