import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  // for the light indicator animation
  List<Widget> _buildPageIndicator(){
    List<Widget> list = [];
    for(int i = 0; i< _numPages ; i++){
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFff8900) : Color(0xFF3b3b3b),
        borderRadius:  BorderRadius.all(Radius.circular(12)),
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030303),
     // backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value:  SystemUiOverlayStyle.light,
        child:Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 600,// find a way to look for screen ...........
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page){
                    setState(() {
                      currentPage = page;
                    });
                  },
                  children: <Widget>[
                    _details("assets/onboard.jpg", ""),
                    _details("assets/onboard2.jpg", ""),
                    _details("assets/jred.jpg", ""),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              currentPage != _numPages - 1
              ? Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: FlatButton(
                    onPressed: (){
                      _pageController.nextPage(duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ) : Text(''),
              currentPage == _numPages - 1 ?
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: FlatButton.icon(
                        color: Color(0xFFff8900),
                        padding: EdgeInsets.only(left: 20 , right: 20, top: 10 , bottom: 10),
                        icon: Icon(Icons.arrow_forward, color: Colors.black,),
                        label: Text("", //style: TextStyle(
                          //fontFamily: 'Montserrat-Regular',
                          //fontWeight: FontWeight.bold,
                        //),
                      ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        textColor: Colors.black,
                      ),
                    ),
                  ):Text('')
            ],
          ),
        ) ,
      ),

    );
  }
}

Widget _details(String image , String text){
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(image,),
              height: 500.0, // remember screen height
              width: 400.0,// remember screen width
            ),
          ),
          SizedBox(height: 30.0,),
          Text( text ,
            style:TextStyle(
              fontSize: 15.0,
              color:Colors.white,
            ),
          )
        ],
      ),
    ),
  );
}