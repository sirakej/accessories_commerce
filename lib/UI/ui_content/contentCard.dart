 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:accessoriescommerce/UI/ui_content/contentInfo.dart';

 class ContentCard extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Color(0xFFFCFAF8),
       body:ListView(
         children: <Widget>[
           SizedBox(height: 15.0),
           Container(
             padding:EdgeInsets.only(right:15.0),
             width: MediaQuery.of(context).size.width - 30.0,
             height: MediaQuery.of(context).size.width - 50.0,
             child: GridView.count(
               crossAxisCount: 2,
               primary: false,
               crossAxisSpacing: 10.0,
               mainAxisSpacing: 15.0,
               childAspectRatio: 0.8,
               children: <Widget>[
                 _buildContentCard("Casio protrek", "\$5.5",  "assets/g-shock/casio-pro-trek.png",false, true , context),
                 _buildContentCard("Casio frogman", "\$6.8", "assets/g-shock/frogman.png", true, true , context),
                 _buildContentCard("Casio gold", "\$6.1", "assets/g-shock/casio-gold-water-resistant.png", false, false , context),
                 _buildContentCard("Casio white-blue", "\$3", "assets/g-shock/g-shock-watch-blue.png", true, false, context),
               ],
             ),
           ),
           SizedBox(height: 15.0,)
         ],
     )
     );
   }
 }

 Widget _buildContentCard(String name , String price , String imagePath ,bool added , bool isFavourite , context){
   return Padding(
     padding: EdgeInsets.only(left: 5.0 , top: 5.0 , right: 5.0 , bottom: 5.0),
     child: InkWell(
       onTap: (){
         Navigator.of(context).push(MaterialPageRoute(
             builder: (context)=>ContentInfo(
               assetPath: imagePath,
               watchPrice: price,
               watchName: name,
             )));
       },
       child: Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(15.0),
           boxShadow: [
             BoxShadow(
                 blurRadius: 5.0,
                 spreadRadius: 3.0,
                 color: Colors.grey.withOpacity(0.2)
             )
           ],
           color: Colors.white,
         ),
         child: Column(
           children: [
             Padding(
               padding: EdgeInsets.all(5.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children:[
                   isFavourite ? Icon(Icons.favorite , color: Color(0xFFEF7532)) :
                   Icon(Icons.favorite_border , color: Color(0xFFEF7532),)
                 ],
               ),
             ),
             Hero(
               tag: imagePath,
               child:Container(
                 height: 110.0,
                 width: 110.0,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage(imagePath),
                     fit: BoxFit.contain,
                   )
                 ),
               )
             ),
             SizedBox(height: 7.0,),
             Text(
               price,
               style: TextStyle(
                 color:Color(0xFFCC8053),
                 fontFamily: 'valera',
                 fontSize: 14.0,
               ),
             ),
             Text(
               name,
               style: TextStyle(
                 color:Color(0xFF575e67),
                 fontFamily: 'valera',
                 fontSize: 14.0,
               ),
             ),
             Padding(
               padding: EdgeInsets.all(8.0),
               child: Container(
                 color: Color(0xFFEBEBEB),
                 height: 1.0,
               ),
             ),
             Padding(
               padding: EdgeInsets.only(left: 5.0 , right: 5.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children:[
                   if(!added) ...[
                     Icon(Icons.add_shopping_cart,
                     color: Color(0xFFD17E50),
                       size: 12.0,
                     ),
                     Text(
                       'Add to cart',
                       style: TextStyle(
                           fontFamily: 'varela',
                           color: Color(0xFFD17E50),
                           fontSize: 12.0
                       ),
                     )
                   ],
                   if(added) ...[
                     Icon(Icons.remove_circle_outline ,
                       color: Color(0xFFD17E50),
                       size: 12.0,
                     ),
                     Text(
                       '3',
                       style: TextStyle(
                         fontFamily: 'varela',
                         color: Color(0xFFD17E50),
                         fontWeight: FontWeight.bold,
                         fontSize: 12.0,
                       ),
                     ),
                     Icon(Icons.add_circle_outline ,
                     color: Color(0xFFD1E50), size: 12.0,
                     )

                   ]
                 ],
               ),
             )
           ]
         ),
       ),
     ),
   );
 }
