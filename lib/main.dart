import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:listmap/google_map.dart';
import 'package:share/share.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {
    final List<String>items=
        new List<String>.generate(10, (i)=>"item ${i+1}");

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue[900],
        title: Text('demo'),
      ),
      body: ListView.separated(
          separatorBuilder: (context,index)=>Divider(
        color: Colors.black,
      ),
          itemCount: items.length,
        itemBuilder: (context,int index){
        return Slidable(
        secondaryActions: <Widget>[
          IconSlideAction(
            icon: Icons.thumb_up,
            caption: 'Share',
            color: Colors.blue,
            onTap: (){
              Share.share('check out my website https://example.com');

              print("share pop is  ${items[index]} opened");
            },
          ),
          IconSlideAction(
            icon: Icons.delete_outline,
            caption: 'Delete',
            color: Colors.red,
            onTap: (){
              print(" Item is Deleted ${items[index]}");
            },
          )
        ],
          child: ListTile(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMap()),);
          },
          title:Text("${items[index]}"),
            ),
          actionPane: SlidableDrawerActionPane(),
        );
          }
      ),
    );
  }
}
    // TODO: implement createState

