class Book {
  String title;
  String author;
  String isbn;
  int copies;

  Book(this.title, this.author, this.isbn, this.copies);

  void borrowBook() {
    if (copies > 0) {
      copies -= 1;
      print('You have borrowed $title');
    } else {
      print('No copies left to borrow');
    }
  }

  void returnBook() {
    copies += 1;
    print('You have returned $title');
  }
}

class Member {
  String name;
  String memberId;
  List<Book> borrowedBooks = [];

  Member(this.name, this.memberId);

  void borrowBook(Book book) {
    book.borrowBook();
    borrowedBooks.add(book);
  }

  void returnBook(Book book) {
    book.returnBook();
    borrowedBooks.remove(book);
  }
}

class Library {
  List<Book> books = [];
  List<Member> members = [];

  void addBook(Book book) {
    books.add(book);
    print('Added ${book.title} to the library');
  }

  void removeBook(Book book) {
    books.remove(book);
    print('Removed ${book.title} from the library');
  }

  void registerMember(Member member) {
    members.add(member);
    print('Registered member ${member.name}');
  }

  void borrowBook(String memberId, String isbn) {
    Member? member = members.firstWhere((m) => m.memberId == memberId, orElse: () => Member('null', 'null'));
    Book? book = books.firstWhere((b) => b.isbn == isbn, orElse: () => Book('null', 'null', 'null', 0));

    if (member.memberId != 'null' && book.isbn != 'null') {
      member.borrowBook(book);
    } else {
      print('Member or Book not found');
    }
  }

  void returnBook(String memberId, String isbn) {
    Member? member = members.firstWhere((m) => m.memberId == memberId, orElse: () => Member('null', 'null'));
    Book? book = books.firstWhere((b) => b.isbn == isbn, orElse: () => Book('null', 'null', 'null', 0));

    if (member.memberId != 'null' && book.isbn != 'null') {
      member.returnBook(book);
    } else {
      print('Member or Book not found');
    }
  }

  void listBooks() {
    print('Books in Library:');
    for (var book in books) {
      print('${book.title} by ${book.author}, ISBN: ${book.isbn}, Copies: ${book.copies}');
    }
  }

  void listMembers() {
    print('Members:');
    for (var member in members) {
      print('Member: ${member.name}, ID: ${member.memberId}');
    }
  }
}

void main() {
  Library library = Library();

  // เพิ่มหนังสือ
  library.addBook(Book('Book One', 'Author One', 'ISBN001', 3));
  library.addBook(Book('Book Two', 'Author Two', 'ISBN002', 2));

  // ลงทะเบียนสมาชิก
  library.registerMember(Member('John Cena', 'MEM001'));
  library.registerMember(Member('Randy Rrton', 'MEM002'));

  // รายการหนังสือ
  library.listBooks();
  print('');

  // รายการสมาชิก
  library.listMembers();
  print('');

  // ยืมหนังสือ
  library.borrowBook('MEM001', 'ISBN001');
  library.borrowBook('MEM002', 'ISBN002');
  print('');

  // รายการหนังสือหลังจากยืม
  library.listBooks();
  print('');

  // คืนหนังสือ
  library.returnBook('MEM001', 'ISBN001');
  library.returnBook('MEM002', 'ISBN002');
  print('');

  // รายการหนังสือหลังจากคืน
  library.listBooks();
}
