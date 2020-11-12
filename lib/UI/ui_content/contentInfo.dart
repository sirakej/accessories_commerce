import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'bottomBar.dart';

class ContentInfo extends StatelessWidget {
  final assetPath, watchPrice , watchName;

  ContentInfo({this.assetPath, this.watchPrice, this.watchName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.list, color:Color(0xFF545D68), ),
          onPressed: (){},
        ),
        title: Text(
          "Store",
          style: TextStyle(
            fontFamily: 'varela',
            fontSize: 20.0,
            color: Color(0xFF545D68),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none , color: Color(0xFF545D68),),
            onPressed: (){},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0,),
//          Padding(
//            padding: EdgeInsets.only(left: 20.0),
//            child: Text(
//              '' ,
//              style: TextStyle(
//                fontFamily:'varela',
//                fontSize: 42.0,
//                fontWeight: FontWeight.bold,
//                color: Color(0xFFF17532)
//              ),
//            ),
//          ),
          SizedBox(height: 15.0,),
          Hero(
              tag: assetPath,
              child:Image.asset(assetPath,
               height: 150.0,
               width: 100.0,
               fit: BoxFit.contain,
              )
          ),
          SizedBox(height: 20.0,),
          Center(
            child: Text(
              watchPrice,
              style: TextStyle(
                color: Color(0xFFF17532),
                fontFamily: 'varela',
                fontSize: 22.0,
              ),
            ),
          ),
          SizedBox(height: 10.0,),
            Center(
              child: Text(
                watchName ,
                style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'varela',
                  fontSize: 24.0,
                ),
              ),
            ),
          SizedBox(height: 20.0,),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              child: Text('Lorem ipsum dolor sit amet, '
                  'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFB4B8B9),
                  fontFamily: 'varela',
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 60.0,),
          Center(
            child: RaisedButton(
              padding: EdgeInsets.only(left: 120 , right: 120, top: 13 , bottom: 13),
              elevation: 5.0,
              child: Text('Add to cart', style: TextStyle(
                fontFamily: 'varela',
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),),
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              textColor: Colors.white,
              color: Color(0xFFF17532),
            ),
          ),
        ],
      ),

      // A BETTER APPROACH IS TO PUT THE BASE DESIGN IN MAIN.DART
      // AND LOAD EACH PAGE IN IT
      floatingActionButton: FloatingActionButton(onPressed: (){},
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.free_breakfast),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar() ,
    );
  }
}
