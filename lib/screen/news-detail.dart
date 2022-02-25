import 'package:flutter/material.dart';
import 'package:newsapp/view-model/view-model.dart';
import 'package:newsapp/widget/widget.dart';

class NewsDetailScreen extends StatelessWidget {

  final ViewModel ? viewModel;
  const NewsDetailScreen({
    Key ? key,
    this.viewModel,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel!.title!),
      ),
      body: Container(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(
            children: < Widget > [
              SizedBox(
                height: 300,
                child: CircleImage(
                  imageUrl: viewModel!.urlToImage!,
                ),
              ),
              Text(
                viewModel!.publishedAt!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
                Center(
                  child: Text(
                    viewModel!.title!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const SizedBox(height: 9),
                Text(
                  viewModel!.description!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                ),
            ),
          ]
        )
      )
    );
  }
}