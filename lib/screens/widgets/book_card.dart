import 'package:flutter/material.dart';

import '../../core/model/books_model.dart';

class BookCard extends StatelessWidget {
  final Books book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.all(12),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Book Title: ${book.bookTitle}',
                style: Theme.of(context).textTheme.bodyLarge),
            Text('Book Author: ${book.bookAuthor![0]}',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('Publication Year: ${book.bookPublicationYear}',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('Pagination: ${book.bookPages}',
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
                'Publication Address: ${book.bookPublicationCity}, ${book.bookPublicationCountry} ',
                style: Theme.of(context).textTheme.bodyMedium),
          ]),
        ));
  }
}
