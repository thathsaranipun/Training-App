import 'package:check/Article/bloc/article_list_bloc.dart';
import 'package:check/Article/bloc/bloc_provider.dart';
import 'package:check/Article/ui/app_colors.dart';
import 'package:check/Article/ui/article_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ArticleFinder());
}

class ArticleFinder extends StatelessWidget {
  const ArticleFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w700BitterFont = GoogleFonts.bitter(
      fontWeight: FontWeight.w700,
    );
    return BlocProvider<ArticleListBloc>(
        bloc: ArticleListBloc(),
        child: Scaffold(
          body: const ArticleListScreen(),
        ));
  }
}
