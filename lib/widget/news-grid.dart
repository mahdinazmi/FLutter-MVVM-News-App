import 'package:flutter/material.dart';
import 'package:newsapp/screen/news-detail.dart';
import 'package:newsapp/view-model/view-model.dart';
import 'package:newsapp/widget/widget.dart';

class NewsGrid extends StatelessWidget {

  final List < ViewModel > ? viewModels;
  const NewsGrid({
    Key ? key,
    this.viewModels
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: viewModels!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) {
          var viewModel = viewModels![index];
          return GestureDetector(
            onTap: () {
              goToNewsDetailScreen(context, viewModel);
            },
            child: GridTile(
              child: CircleImage(imageUrl: viewModel.urlToImage),
              footer: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    viewModel.title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                ),
             ),
            ),
          ),
        );
      },
    );
  }

  void goToNewsDetailScreen(BuildContext context, ViewModel vm) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return NewsDetailScreen(viewModel: vm);
        }
      )
    );
  }
}