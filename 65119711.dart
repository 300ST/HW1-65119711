void main() {
  // Create some Book objects
  Book book1 = Book(title: "ครอบครัวตึ๋งหนืด", author: "Author 1", isbn: "1234567890", copies: 5);
  Book book2 = Book(title: "ขายหัวเราะ", author: "Author 2", isbn: "9876543210", copies: 3);

  // Create a Member object
  Member member1 = Member(name: "John Cena", memberId: "12345");

  // Example usage of borrowBook and returnBook methods
  member1.borrowBook(book1);
  member1.borrowBook(book2);
  member1.returnBook(book1);

  // You can add more logic and interaction with your Book and Member objects here
}

class Book {
  String title;
  String author;
  String isbn;
  int copies;

  // Constructor
  Book({required this.title, required this.author, required this.isbn, required this.copies});

  // Borrow book
  void borrowBook() {
    if (copies > 0) {
      copies--;
      print("$title ยืมสำเร็จ เหลือ $copies สำเนา");
    } else {
      print("$title ยืมไม่สำเร็จ หนังสือหมด");
    }
  }

  // Return book
  void returnBook() {
    copies++;
    print("$title คืนสำเร็จ มี $copies สำเนา");
  }
}

class Member {
  String name; // Initialize name
  String memberId; // Initialize memberId
  List<Book> borrowedBooks = []; // Initialize borrowedBooks as empty list

  // Constructor
  Member({required this.name, required this.memberId});

  // Borrow book
  void borrowBook(Book book) {
    if (book.copies > 0) {
      book.copies--;
      borrowedBooks.add(book);
      print("${name} ยืมหนังสือ ${book.title} สำเร็จ เหลือหนังสือ ${book.title} ${book.copies} สำเนา");
    } else {
      print("${name} ยืมหนังสือ ${book.title} ไม่สำเร็จ หนังสือหมด");
    }
  }

  // Return book
  void returnBook(Book book) {
    if (borrowedBooks.contains(book)) {
      book.copies++;
      borrowedBooks.remove(book);
      print("${name} คืนหนังสือ ${book.title} สำเร็จ มีหนังสือ ${book.title} ${book.copies} สำเนา");
    } else {
      print("${name} คืนหนังสือ ${book.title} ไม่สำเร็จ หนังสือยังอยู่");
    }
  }
}
