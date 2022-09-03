import 'dart:async';

import 'package:check/Article/bloc/bloc.dart';
import 'package:check/Article/data/article.dart';
import 'package:check/Article/data/rw_client.dart';
import 'package:rxdart/rxdart.dart';

class ArticleDetailBloc implements Bloc {
  final String id;
  final _refreshController = StreamController<void>();
  final _client = RWClient();

  late Stream<Article?> articleStream;

  ArticleDetailBloc({
    required this.id,
  }) {
    articleStream = _refreshController.stream
        .startWith({})
        .mapTo(id)
        .switchMap(
          (id) => _client.getDetailArticle(id).asStream(),
        )
        .asBroadcastStream();
  }

  Future refresh() {
    final future = articleStream.first;
    _refreshController.sink.add({});
    return future;
  }

  @override
  void dispose() {
    _refreshController.close();
  }
}
