import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/info.dart';
import '../../bloc/bloc/news_bloc.dart';

class CradInfoUpdate extends StatefulWidget {
  @override
  State<CradInfoUpdate> createState() => _infoUpdate();
}

class _infoUpdate extends State<CradInfoUpdate> {
  final NewsBloc _newsBloc = NewsBloc();
  @override
  void initState() {
    _newsBloc.add(GetNewsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<NewsBloc, NewsState>(
          listener: (context, state) {
            if (state is NewsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsInitial) {
                return _buildLoading();
              } else if (state is NewsLoading) {
                return _buildLoading();
              } else if (state is NewsLoaded) {
                return _buildCard(context, state.newsModel);
              } else if (state is NewsError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildCard(BuildContext context, NewsModel model) {
  return ListView.builder(
    itemCount: model.articles!.length,
    itemBuilder: (context, index) {
      final article = model.articles![index]; // Artikel pada indeks tertentu

      return Container(
        margin: EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text("Author: ${article.author}"),
                Text("Title: ${article.title}"),
                Text("Description: ${article.description}"),
                Text("URL to Image: ${article.urlToImage}"),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildLoading() => Center(
      child: CircularProgressIndicator(),
    );
