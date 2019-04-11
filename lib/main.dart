import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Digital Wardrobe dress'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index1=null;
  setIndex(int index1) {
    print(index1);
    setState(() {
      index1=index1;
    });

  }


  getSwiper()
  {
    return Swiper(
        layout: SwiperLayout.CUSTOM,
        customLayoutOption: new CustomLayoutOption(
            startIndex: -1,
            stateCount: 7
        ).addRotate([
          0.0,
          0.2,
          -0.2,
          0.0,
          0.2,
          -0.2,
          0.0
        ]).addTranslate([
          new Offset(-0.0, -130.0),//1
          new Offset(-110.0, -50.0),//2
          new Offset(-90.0, 20.0),//3
          new Offset(0.0, 100.0),//4
          new Offset(90.0, 20.0),//5
          new Offset(110.0, -50.0),//6
          new Offset(-0.0, -130)
        ]),
        itemWidth: 120.0,
        itemHeight: 70.0,
        itemBuilder: (context, index) {
          Widget swiper=new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage('assets/images/a${index+1}.jpeg'),
              ),
            ),
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 1.8, sigmaY: 1.8),
            ),
          );
          return swiper;
        },
        onIndexChanged:(i){


          setState(() {

            index1=((i+2)%10)+1;
            print("value in index1 " + index1.toString());

          });


        },
        itemCount: 10);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: Stack(
            children:<Widget>[
              Container(
                  height:340.0,
                  child:getSwiper()
              ),
              //lets start
              new Positioned(
                  top:MediaQuery.of(context).size.width/4,
                  left: MediaQuery.of(context).size.width/3+10,
                  child: index1==null?Text('No Image'):
                  Image.asset('assets/images/a${index1}.jpeg',width: 100)
              )
            ]),

    );
  }
}

//new Image.asset('assets/images/a${index+1}.jpeg',width: 100,height: 100,);