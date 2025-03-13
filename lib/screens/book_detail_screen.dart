import 'package:flutter/material.dart';
import '../models/book.dart';
import '../theme/app_theme.dart';
import 'edit_book_screen.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายละเอียดหนังสือ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditBookScreen(book: book),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ส่วนด้านบน - รูปหนังสือ
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: _getCategoryColor(book.category).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: Center(
                    child: Text(
                      book.title.isNotEmpty ? book.title[0].toUpperCase() : '?',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: _getCategoryColor(book.category),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // ชื่อหนังสือ
              Center(
                child: Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              
              // ชื่อผู้แต่ง
              Center(
                child: Text(
                  'โดย ${book.author}',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.textSecondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              
              // ประเภทหนังสือ
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: _getCategoryColor(book.category).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    book.category,
                    style: TextStyle(
                      color: _getCategoryColor(book.category),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // ข้อมูลเพิ่มเติม (สามารถเพิ่มได้ในอนาคต)
              const Divider(thickness: 1),
              const SizedBox(height: 16),
              
              // ปุ่มแก้ไข
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.edit),
                  label: const Text(
                    'แก้ไขข้อมูลหนังสือ',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditBookScreen(book: book),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'นิยาย':
        return const Color(0xFFFFAFCC);
      case 'การศึกษา':
        return const Color(0xFFA2D2FF);
      case 'วิทยาศาสตร์':
        return const Color(0xFF9ED2C6);
      case 'ประวัติศาสตร์':
        return const Color(0xFFFFD166);
      case 'การท่องเที่ยว':
        return const Color(0xFF06D6A0);
      case 'ธุรกิจ':
        return const Color(0xFF118AB2);
      default:
        return const Color(0xFFBDE0FE);
    }
  }
}