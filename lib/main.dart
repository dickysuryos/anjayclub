import 'dart:ffi';

import 'package:anjayclub/API/ApiRequest.dart';
import 'package:anjayclub/Cell/CategoryCell.dart';
import 'package:anjayclub/Cell/HeadlineCell.dart';
import 'package:anjayclub/DetailArticle.dart';
import 'package:anjayclub/model/Drama.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


List fetchData()  {
  List result;
     FutureBuilder<List<Drama>>(
        future: ApiRequest.shared(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            List<Drama> data = snapshot.data;
            print("data ga kosong");
        result = data;
          }else if (snapshot.error != null){
            print("data ini kosong");
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        }
    );
     return result;
  }


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
   List<Drama> items = fetchData() ;
   List<String>category = ["Anime","Drama Korea","TV Series","Cartoon"];


       // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Drama>>(
        future: ApiRequest.shared(),
        builder: (context,data) {
          if (data.hasData != null){
            items = data.data;
          }
            return Column(
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      verticalDirection: VerticalDirection.down,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: HeadlineCell.headline(context,items),
                    )),
                Container(
                    height: 100,
                    child: Column(
                      verticalDirection: VerticalDirection.down,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: CategoryCell.category(items),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "POPULAR",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      CarouselSlider(

                        options: CarouselOptions(
                            height: 190,
                            autoPlay:true,
                            autoPlayCurve: Curves.fastLinearToSlowEaseIn),
                        items: items.map((i) {

                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailArticle(drama: i.urlVideo)));
                                      },
                                      child:
                                  Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              ClipRRect(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  child: Stack(children: [
                                                    Image.network(
                                                      i.image,
                                                      height: 150,
                                                      fit: BoxFit.cover,
                                                      width: MediaQuery.of(context).size.width - 100,
                                                    ),
                                                    Container(
                                                      height: 150,
                                                      width: MediaQuery.of(context).size.width -100,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          gradient: LinearGradient(
                                                              begin: FractionalOffset.topCenter,
                                                              end: FractionalOffset.bottomCenter,
                                                              colors: [
                                                                Colors.grey.withOpacity(0.0),
                                                                Colors.black,
                                                              ],
                                                              stops: [
                                                                0.0,
                                                                1.0
                                                              ])),
                                                    ),
                                                  ])

                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                              )
                              );
                            },
                          );

                        }).toList(),
                      ),

                    ],
                  ),
                ),
              ],
            );

        }

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
