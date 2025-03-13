import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/book.dart';

class FirestoreService {
  final CollectionReference booksCollection = 
      FirebaseFirestore.instance.collection('Books');

  // เพิ่มหนังสือใหม่
  Future<void> addBook(Book book) {
    return booksCollection.add(book.toMap());
  }

  // ดึงข้อมูลหนังสือทั้งหมด
  Stream<List<Book>> getBooks() {
    return booksCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Book.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // แก้ไขข้อมูลหนังสือ
  Future<void> updateBook(Book book) {
    return booksCollection.doc(book.id).update(book.toMap());
  }

  // ลบหนังสือ
  Future<void> deleteBook(String bookId) {
    return booksCollection.doc(bookId).delete();
  }
}