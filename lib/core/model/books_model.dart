class Books {
  int? _id;
  List<String>? _bookAuthor;
  String? _bookTitle;
  int? _bookPublicationYear;
  String? _bookPublicationCountry;
  String? _bookPublicationCity;
  int? _bookPages;

  Books(
      {int? id,
      List<String>? bookAuthor,
      String? bookTitle,
      int? bookPublicationYear,
      String? bookPublicationCountry,
      String? bookPublicationCity,
      int? bookPages}) {
    _id = id;
    _bookAuthor = bookAuthor;
    _bookTitle = bookTitle;
    _bookPublicationYear = bookPublicationYear;
    _bookPublicationCountry = bookPublicationCountry;
    _bookPublicationCity = bookPublicationCity;
    _bookPages = bookPages;
  }

  int? get id => _id;
  List<String>? get bookAuthor => _bookAuthor;
  String? get bookTitle => _bookTitle;
  int? get bookPublicationYear => _bookPublicationYear;
  String? get bookPublicationCountry => _bookPublicationCountry;
  String? get bookPublicationCity => _bookPublicationCity;
  int? get bookPages => _bookPages;

  Books.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _bookAuthor = json['book_author'].cast<String>();
    _bookTitle = json['book_title'];
    _bookPublicationYear = json['book_publication_year'];
    _bookPublicationCountry = json['book_publication_country'];
    _bookPublicationCity = json['book_publication_city'];
    _bookPages = json['book_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = _id;
    data['book_author'] = _bookAuthor;
    data['book_title'] = _bookTitle;
    data['book_publication_year'] = _bookPublicationYear;
    data['book_publication_country'] = _bookPublicationCountry;
    data['book_publication_city'] = _bookPublicationCity;
    data['book_pages'] = _bookPages;
    return data;
  }
}
