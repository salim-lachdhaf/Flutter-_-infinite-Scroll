import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget  {

 @override
  _ChatServerDividedState createState() => new _ChatServerDividedState();

 }
  class _ChatServerDividedState extends State<MyApp> {
    final List<String> items = List<String>.generate(10, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    final title = 'Long List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          //itemCount: items.length,
          itemBuilder: (context, index) {
            if(index< items.length){
            return ListTile(
              title: Text('${items[index]}'),
            );
            }else{
              myTypedFuture();
              return Center(child:CircularProgressIndicator());
            }
          },
           itemCount: items.length + 1,
        ),
      ),
    );
  }
  
  Future myTypedFuture() async {
  await Future.delayed(Duration(seconds: 3));
    setState((){
      final List<String> items2 = List<String>.generate(10, (i) => "Item $i");
      items.addAll(items2);
    });
}
}
