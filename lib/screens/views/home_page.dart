import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ta/core/model/books_model.dart';
import 'package:ta/core/services/book_service.dart';

import '../widgets/app_bar.dart';
import '../widgets/book_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageNo = 1;
  bool isLoadingMore = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<BookService>().getBook(pageNo);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Reached the end of the list.
      if (!isLoadingMore) {
        setState(() {
          isLoadingMore = true;
        });

        // Load more data here, for example, using BookService().getBook(pageNo).
        // After loading data, update the UI and increment pageNo.
        context.read<BookService>().getBook(pageNo + 1).then((newData) {
          if (newData.isNotEmpty) {
            setState(() {
              pageNo++;
              isLoadingMore = false;
            });
          } else {
            setState(() {
              isLoadingMore = false;
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Books> books = context.watch<BookService>().bookResponse;
    return Scaffold(
        appBar: const CustomAppBar(),
        body: books.isEmpty
            ? const Center(child: CupertinoActivityIndicator())
            : ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  return index < books.length
                      ? BookCard(
                          book: books[index],
                        )
                      : const Center(
                          child: CupertinoActivityIndicator(),
                        );
                },
                itemCount: books.length + 1,
              ));
  }
}
