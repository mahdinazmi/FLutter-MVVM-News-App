import 'package:flutter/material.dart';
import 'package:newsapp/constant/constants.dart';
import 'package:newsapp/view-model/list-view-model.dart';
import 'package:newsapp/widget/widget.dart';
import 'package:provider/provider.dart';


class NewsScreen extends StatefulWidget {

  const NewsScreen({Key? key}) : super(key: key);
  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<ListViewModel>(context, listen: false).fetchTopNewsHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listviewmodel = Provider.of<ListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text('News App'),
        actions: <Widget> [
          PopupMenuButton(
            onSelected: (country) {
              listviewmodel.fetchNewsByCountry(Constants.COUNTRIES[country]!);
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constants.COUNTRIES.keys.map((v)=> PopupMenuItem(value:v, child: Text(v),)).toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left:30, bottom: 15, top:15),
              child: Text('Headlines', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            Expanded(
              child: NewsGrid(viewModels: listviewmodel.viewModels),
            ),
          ],
        ),
      ),
    );
  }
}