import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/screen.dart';
import 'view-model/list-view-model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key ? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ListViewModel(),
          ),
        ],
        child: const NewsScreen(),
      ),
    );
  }
}