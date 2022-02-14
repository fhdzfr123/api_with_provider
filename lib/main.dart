import 'package:api_with_provider/Model/postmodel.dart';
import 'package:api_with_provider/Provider/postprovider.dart';
import 'package:api_with_provider/Screens/postdatascreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ListenableProvider(create: (_) => PostProvider())
      ],
      child: MyApp(),
    ),
  );
  /*runApp(FutureProvider<Post>(
    initialData: Post(),
    create: (context) => Future.value(null),
    child: MyApp(),
  ));*/
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostDataScreen(),
    );
  }
}
