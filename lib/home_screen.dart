import 'package:flutter/material.dart';
import 'package:readlog/mock_books.dart';

class Book {
  final String title;
  final String author;
  final BookStatus status;
  bool isFavourite;

  Book({
    required this.title,
    required this.author,
    required this.status,
    this.isFavourite = false,
  });
}

enum BookStatus { reading, completed, wishList }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Book> _bookList = mockBooks;
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String _searchQuery = '';
  BookStatus? _statusFilter;
  BookStatus? _dialogStatus;

  bool _showFab = true;
  bool _showFilters = true;

  double _lastOffset = 0;

  @override
  Widget build(BuildContext context) {
    final books = _getFilteredBooks();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Books'),
        forceMaterialTransparency: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(_showFilters ? 120 : 0),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
            child:
                _showFilters
                    ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildSearchAndFilterSection(),
                    )
                    : const SizedBox.shrink(),
          ),
        ),
      ),
      floatingActionButton:
          _showFab
              ? FloatingActionButton(
                onPressed: _showAddBookDialog,
                child: const Icon(Icons.add),
              )
              : null,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child:
                  books.isEmpty
                      ? const Center(
                        child: Text('No books found. Tap + to add one.'),
                      )
                      : ListView.separated(
                        controller: _scrollController,
                        itemCount: books.length,
                        padding: const EdgeInsets.only(bottom: 80),
                        itemBuilder:
                            (context, index) =>
                                _buildBookCard(books[index], index),
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                      ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final currentOffset = _scrollController.offset;

      if (currentOffset > _lastOffset + 5 && _showFab) {
        setState(() {
          _showFab = false;
          _showFilters = false;
        });
      } else if (currentOffset < _lastOffset - 5 && !_showFab) {
        setState(() {
          _showFab = true;
          _showFilters = true;
        });
      }

      _lastOffset = currentOffset;
    });
  }

  Widget _buildBookCard(Book book, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 75),
                child: Image.network(
                  'https://covers.openlibrary.org/b/id/6424160-M.jpg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    book.author,
                    style: const TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Chip(
                    label: Text(book.status.label),
                    backgroundColor: book.status.color.withValues(alpha: 0.1),
                    shape: StadiumBorder(
                      side: BorderSide(color: book.status.color),
                    ),
                    labelStyle: TextStyle(
                      color: book.status.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    book.isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: book.isFavourite ? Colors.red : null,
                  ),
                  onPressed:
                      () =>
                          setState(() => book.isFavourite = !book.isFavourite),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => setState(() => _bookList.removeAt(index)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 8,
        children:
            BookStatus.values.map((status) {
              final selected = _statusFilter == status;
              return ChoiceChip(
                label: Text(status.label),
                selected: selected,
                onSelected: (selected) {
                  setState(() {
                    _statusFilter = selected ? status : null;
                  });
                },
              );
            }).toList(),
      ),
    );
  }

  Widget _buildSearchAndFilterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child:
              _showFilters
                  ? _buildSearchBar()
                  : const SizedBox(key: ValueKey('empty'), height: 0),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child:
              _showFilters
                  ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: _buildFilterChips(),
                  )
                  : const SizedBox(key: ValueKey('empty2'), height: 0),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      key: const ValueKey('searchBar'),
      decoration: const InputDecoration(
        hintText: 'Search books...',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      onChanged: (val) => setState(() => _searchQuery = val),
    );
  }

  void _clearForm() {
    _titleController.clear();
    _authorController.clear();
    _dialogStatus = null;
  }

  List<Book> _getFilteredBooks() {
    return _bookList.where((book) {
      final matchesStatus =
          _statusFilter == null || book.status == _statusFilter;
      final matchesSearch =
          _searchQuery.isEmpty ||
          book.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          book.author.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesStatus && matchesSearch;
    }).toList();
  }

  void _showAddBookDialog() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Add a Book'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Book Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _authorController,
                  decoration: const InputDecoration(
                    labelText: 'Author',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<BookStatus>(
                  value: _dialogStatus,
                  decoration: const InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(),
                  ),
                  items:
                      BookStatus.values.map((status) {
                        return DropdownMenuItem(
                          value: status,
                          child: Text(status.label),
                        );
                      }).toList(),
                  onChanged: (value) => setState(() => _dialogStatus = value),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _clearForm();
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_titleController.text.isEmpty ||
                      _authorController.text.isEmpty ||
                      _dialogStatus == null) {
                    return;
                  }

                  setState(() {
                    _bookList.add(
                      Book(
                        title: _titleController.text,
                        author: _authorController.text,
                        status: _dialogStatus!,
                      ),
                    );
                  });
                  _clearForm();
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              ),
            ],
          ),
    );
  }
}

extension BookStatusExtension on BookStatus {
  Color get color {
    switch (this) {
      case BookStatus.reading:
        return Colors.blue;
      case BookStatus.completed:
        return Colors.green;
      case BookStatus.wishList:
        return Colors.orange;
    }
  }

  String get label {
    switch (this) {
      case BookStatus.reading:
        return 'Reading';
      case BookStatus.completed:
        return 'Completed';
      case BookStatus.wishList:
        return 'Wish List';
    }
  }
}
