

import 'package:flutter/material.dart';

import 'Home_page.dart';

class Block extends StatelessWidget {

  List<int> pattern ;
  int color;
  int shape, direction;
  int score;
  double ratio = 35;
  Block(this.color, this.shape , this.direction);

 List<int> getpatttern(){
   pattern = new List();
  switch (shape) {



    case 1:
              score =40;
            switch (direction) {
              case 1:
                  return  [1,1,1,
                           0,0,1,
                           0,0,0]; 
                break;

              case 2:
                  return  [1,1,0,
                           1,0,0,
                           1,0,0]; 
                break;

              case 3:
                  return  [0,0,1, 
                           0,0,1,
                           0,1,1]; 
                break;

              case 4:
                  return  [0,0,0,
                           1,0,0, 
                           1,1,1]; 
                break;

            }
           
             break;

    case 2:
               score =40;
            switch (direction) {
              case 1:
                  return  [1,1,1,
                           0,1,0,
                           0,0,0]; 
                break;

              case 2:
                  return  [1,0,0,
                           1,1,0,
                           1,0,0]; 
                break;

              case 3:
                  return  [0,0,0, 
                           0,1,0,
                           1,1,1]; 
                break;

              case 4:
                  return  [0,0,1,
                           0,1,1, 
                           0,0,1]; 
                break;

            }
          
            break;

    case 3:
            score =50;
            switch (direction) {
              case 1:
                  return  [0,0,1,
                           0,0,1,
                           1,1,1]; 
                break;
       
              case 2:
                  return  [1,0,0,
                           1,0,0,
                           1,1,1]; 
                break;
              
              case 3:
                  return  [1,1,1, 
                           1,0,0,
                           1,0,0]; 
                break;
              
              case 4:
                  return  [1,1,1,
                           0,0,1, 
                           0,0,1]; 
                break;
              
            }
            
            break;

    
    case 4:
            score =30;
            switch ((direction/2).round()) {
              case 1:
                  return  [0,0,1,
                           0,0,1,
                           0,0,1]; 
                break;
       
              case 2:
                  return  [1,1,1,
                           0,0,0,
                           0,0,0]; 
                break;   
              
            }
           
            break;

 
    case 5:
            score =40;
            return  [0,1,1,
                     0,1,1,
                     0,0,0];
             break;

   
    case 6:
            score =90;
            return  [1,1,1,
                     1,1,1,
                     1,1,1]; 
      
            break;


    case 7:
           score =30;
            switch (direction) {
              case 1:
                  return  [0,1,1,
                           0,0,1,
                           0,0,0]; 
                break;
      
              case 2:
                  return  [0,0,0,
                           0,0,1,
                           0,1,1]; 
                break;
              
              case 3:
                  return  [0,0,0, 
                           1,0,0,
                           1,1,0]; 
                break;
              
              case 4:
                  return  [1,1,0,
                           1,0,0, 
                           0,0,0]; 
                break;
              
            }
            break;

  }
 }

  @override
  Widget build(BuildContext context) {
    pattern = getpatttern();
      return Container(
      padding: EdgeInsets.all(2),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Center(child: pattern[0]==1 ? Square(color,false, false) : Container(height: ratio,width: ratio,)),
            Center(child: pattern[1]==1 ? Square(color,false, false) : Container(height: ratio,width: ratio,)),
            Center(child: pattern[2]==1 ? Square(color,false, false) : Container(height: ratio,width: ratio,)),

          ],),   
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Center(child: pattern[3]==1 ? Square(color,false, false) : Container(height: ratio,width: ratio,)),
            Center(child: pattern[4]==1 ? Square(color,false, false) : Container(height: ratio,width: ratio,)),
            Center(child: pattern[5]==1 ? Square(color,false, false) : Container(height: ratio,width: ratio,)),
          ],),


             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
            Center(child: pattern[6]==1 ? Square(color,false, false) : Container(height: ratio,width: ratio,)),
            Center(child: pattern[7]==1 ? Square(color,false, false) : Container(height: ratio,width: ratio,)),
            Center(child: pattern[8]==1 ? Square(color,false, false) : Container(height: ratio,width: ratio,)),
          ],),
        ],
      ),
      );
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      width: 100,
      child: GridView.builder(
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 9,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return Center(child: Text("$index"));
;          },
      ),
    );
  }
}
  