import 'package:flutter/material.dart';

class PaginatedListView extends StatefulWidget {
  const PaginatedListView({
    required this.hasReachedMax,
    required this.onLoadMore,
    required this.itemBuilder,
    this.valueKey,
    required this.itemCount,
    super.key,
  });

  final bool hasReachedMax;
  final Future<void> Function() onLoadMore;
  final Widget Function(BuildContext, int) itemBuilder;
  final String? valueKey;
  final int itemCount;

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView> {
  late ScrollController _scrollController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!widget.hasReachedMax &&
        _scrollController.position.pixels >=
            0.7 * _scrollController.position.maxScrollExtent) {
      widget.onLoadMore();
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    if (!isLoading) {
      setState(() => isLoading = true);
      await widget.onLoadMore();
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      key: ValueKey(widget.valueKey),
      controller: _scrollController,
      itemBuilder: widget.itemBuilder,
      itemCount: widget.itemCount,
    );
  }
}
