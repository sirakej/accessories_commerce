import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:accessoriescommerce/UI/ui_content/bottomBar.dart';
import 'package:accessoriescommerce/UI/ui_content/contentCard.dart';
class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 6 , vsync: this);
  }
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
        padding:EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 15.0,),
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'varela',
              //color: Color(0xFF545D68),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15.0,),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            isScrollable: true,
            labelColor: Color(0xFFC88D67),
            labelPadding: EdgeInsets.only(right: 45.0),
             unselectedLabelColor: Color(0xFFCDCDCD),
            tabs:[
              catText('Casio'),
              catText('Hublot'),
              catText('Diesel'),
              catText('Michael Kors'),
              catText('Rolex'),
              catText('dreglax'),
            ]
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children:[
                ContentCard(),
                ContentCard(),
                ContentCard(),
                ContentCard(),
                ContentCard(),
                ContentCard(),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        backgroundColor: Color(0xFFF17532),
        child: Icon(Icons.free_breakfast),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar() ,
    );
  }
}

Widget catText(String name){
  return Tab(
    child: Text(
      name,
      style: TextStyle(
        fontFamily:'varela',
        fontSize: 21.0,
      ),
    ),
  );
}
