
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'Block.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


  bool accepted = false;

  List<int> currentmoves = new List();

  int shape, ih, iw, direction ;

  static int row = 10;

  List<Square> board = new List.generate(row*row,(index){
    return Square(7, true,false);
      });
 
  List<Block> sugesst1 ;


  List<int> left = new List() , right = new List();
  
  int color , score = 0;






  @override
  void initState() {
    for(int i = 0 ; i < row; i++){
      left.add(row*i);
      right.add((i+1)*row-1);

  }
    super.initState();
  }

  void randomize(int index){
    List<Color> colors = 
    [
      Colors.indigo,
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.amber, 
    ];

 
    setState(() {
      sugesst1.insert(index,Block(Random().nextInt(6),Random().nextInt(7)+1,Random().nextInt(4)+1));

    });
  }

  bool check(int index){
   
  switch(shape){
    case 1:
           switch (direction) {
              case 1: 
                 if((index-row<1)|| left.contains(index-row) || right.contains(index-row) || (index-row>row*row-row-2))
                 return false;
                 if (board[index-(row+1)].filled || board[index-(row-1)].filled)
                 return false;
                 if (board[index-row].filled || board[index+1].filled)
                 return false;
                break;

              case 2: 
                 if((index<row)|| left.contains(index) || right.contains(index-1) || (index-row>row*row-row-2))
                 return false;
                 if (board[index-(row+1)].filled || board[index-row].filled)
                 return false;
                 if (board[index+(row-1)].filled || board[index-1].filled)
                 return false;
                break; 
               
              case 3: 
                 if((index<row)|| left.contains(index+1) || right.contains(index) || (index-row>row*row-row-2))
                 return false;
                 if (board[index+(row+1)].filled || board[index+row].filled)
                 return false;
                 if (board[index-(row-1)].filled || board[index+1].filled)
                 return false;
                break;  

              case 4: 
                 if((index<0)|| left.contains(index) || right.contains(index) || (index-row>row*row-row-2))
                 return false;
                 if (board[index+(row+1)].filled || board[index+row].filled)
                 return false;
                 if (board[index+(row-1)].filled || board[index-1].filled)
                 return false;
                break;      
            }
    break;

    case 2:
           switch (direction) {
              case 1: 
                 if((index<row)|| left.contains(index) || right.contains(index) || (index>row*row-2))
                 return false;
                 if (board[index-(row+1)].filled || board[index-(row-1)].filled)
                 return false;
                 if (board[index-row].filled || board[index].filled)
                 return false;
                break;

              case 2: 
                 if((index<row)|| left.contains(index) || right.contains(index-1) || (index-row>row*row-row-2))
                 return false;
                 if (board[index-(row+1)].filled || board[index+(row-1)].filled)
                 return false;
                 if (board[index].filled || board[index-1].filled)
                 return false;
                break; 
               
              case 3: 
                 if((index<0)|| left.contains(index) || right.contains(index) || (index-row>row*row-row-2))
                 return false;
                 if (board[index+(row+1)].filled || board[index+row].filled)
                 return false;
                 if (board[index+(row-1)].filled || board[index].filled)
                 return false;
                break;  

              case 4: 
                 if((index<row)|| left.contains(index+1) || right.contains(index) || (index-row>row*row-row-2))
                 return false;
                 if (board[index+(row+1)].filled || board[index+1].filled)
                 return false;
                 if (board[index-(row-1)].filled || board[index].filled)
                 return false;
                break;      
            }
    break;


    case 3:
           switch (direction) {
              case 1: 
                 if((index<row)|| left.contains(index) || right.contains(index) || (index>row*row-2))
                 return false;
                 if (board[index+1].filled || board[index-(row-1)].filled)
                 return false;
                 if (board[index+row].filled || board[index+(row-1)].filled)
                 return false;
                 if (board[index+(row+1)].filled )
                 return false;
                break;

              case 2: 
                 if((index<row)|| left.contains(index) || right.contains(index) || (index-row>row*row-row-2))
                 return false;
                 if (board[index-(row+1)].filled || board[index+(row-1)].filled)
                 return false;
                 if (board[index+row+1].filled || board[index-1].filled)
                 return false;
                  if (board[index+row].filled)
                 return false;
                break; 
               
              case 3: 
                 if((index<row)|| left.contains(index) || right.contains(index) || (index-row>row*row-row-2))
                 return false;
                 if (board[index-row+1].filled || board[index-row-1].filled)
                 return false;
                 if (board[index+row-1].filled || board[index-1].filled)
                 return false;
                  if (board[index-row].filled)
                 return false;
                break;  

              case 4: 
                 if((index<row)|| left.contains(index) || right.contains(index) || (index-row>row*row-row-2))
                 return false;
                 if (board[index+(row+1)].filled || board[index+1].filled)
                 return false;
                 if (board[index-(row-1)].filled || board[index-row].filled)
                 return false;
                 if (board[index-(row+1)].filled )
                 return false;
                break;      
            }
    break;


   case 4:
           switch ((direction/2).round()) {
              case 1: 
                 if((index<row)||(index>row*row-row-1))
                 return false;
                 if (board[index].filled || board[index-row].filled)
                 return false;
                 if (board[index+row].filled )
                 return false;
                break;

              case 2: 
                 if((index<0)|| left.contains(index) || right.contains(index) || (index>row*row-2))
                 return false;
                 if (board[index+1].filled || board[index-1].filled)
                 return false;
                  if (board[index].filled)
                 return false;
                break; 
               
            }
    break;


    case 5:    
                 if(right.contains(index) || index <row || index>row*row-2)
                 return false;
                 if (board[index-(row-1)].filled || board[index-row].filled)
                 return false;
                 if (board[index].filled || board[index+1].filled )
                 return false;

                  
    break;

    case 6:    
                 if(right.contains(index) || index <row || index>row*row-row-2 || left.contains(index))
                 return false;
                 if (board[index].filled || board[index-1].filled || board[index+1].filled )
                 return false;
                 if (board[index-(row-1)].filled || board[index-row].filled || board[index-(row+1)].filled )
                 return false;
                 if (board[index+(row-1)].filled || board[index+row].filled || board[index+(row+1)].filled )
                 return false;
                
   break;

    case 7:
           switch (direction) {
              case 1: 
                 if((index<row)|| left.contains(index+1) || right.contains(index) || (index>row*row-2))
                 return false;
                 if (board[index+1].filled || board[index-row+1].filled)
                 return false;
                 if (board[index-row].filled )
                 return false;
                break;

              case 2: 
                 if((index<0)|| left.contains(index+1) || right.contains(index) || (index-row>row*row-row-2))
                 return false;
                 if (board[index+(row+1)].filled || board[index+row].filled)
                 return false;
                  if (board[index+1].filled)
                 return false;
                break; 
               
              case 3: 
                 if((index<0)|| left.contains(index) || right.contains(index-1) || (index-row>row*row-row-2))
                 return false;
                 if (board[index+row].filled || board[index+row-1].filled)
                 return false;
                  if (board[index-1].filled)
                 return false;
                break;  

              case 4: 
                 if((index<row)|| left.contains(index) || right.contains(index-1) || (index-row>row*row-2))
                 return false;
                 if (board[index-row-1].filled || board[index-1].filled)
                 return false;
                 if (board[index-row].filled )
                 return false;
                break;      
            }
    break;

    }
     return true;
  }

  void update(int index,Square t){
  
  switch(shape){
  
    case 1:
            switch (direction) {
              case 1:

                   board.removeAt(index-row);
                   board.insert(index-row, t);

                   board.removeAt(index-(row+1));
                   board.insert(index-(row+1), t);

                   board.removeAt(index+1);
                   board.insert(index+1,t);

                   board.removeAt(index-(row-1));
                   board.insert(index-(row-1), t);                     

                break;

              case 2:

                   board.removeAt(index-row);
                   board.insert(index-row, t);

                   board.removeAt(index-(row+1));
                   board.insert(index-(row+1), t);

                   board.removeAt(index-1);
                   board.insert(index-1,t);

                   board.removeAt(index+(row-1));
                   board.insert(index+(row-1), t);                     

                break;
           case 3:

                   board.removeAt(index+row);
                   board.insert(index+row, t);

                   board.removeAt(index+(row+1));
                   board.insert(index+(row+1), t);

                   board.removeAt(index+1);
                   board.insert(index+1,t);

                   board.removeAt(index-(row-1));
                   board.insert(index-(row-1), t);                     

                break;


           case 4:

                   board.removeAt(index+row);
                   board.insert(index+row, t);

                   board.removeAt(index+(row+1));
                   board.insert(index+(row+1), t);

                   board.removeAt(index-1);
                   board.insert(index-1,t);

                   board.removeAt(index+(row-1));
                   board.insert(index+(row-1), t);                     

                break;
        
            }
    break;



    case 2:
            switch (direction) {
              case 1:

                   board.removeAt(index-row);
                   board.insert(index-row, t);

                   board.removeAt(index-(row+1));
                   board.insert(index-(row+1), t);

                   board.removeAt(index);
                   board.insert(index,t);

                   board.removeAt(index-(row-1));
                   board.insert(index-(row-1), t);                     

                break;

              case 2:

                   board.removeAt(index+(row-1));
                   board.insert(index+(row-1), t);

                   board.removeAt(index-(row+1));
                   board.insert(index-(row+1), t);

                   board.removeAt(index-1);
                   board.insert(index-1,t);

                   board.removeAt(index);
                   board.insert(index, t);                     

                break;
           case 3:

                   board.removeAt(index+row);
                   board.insert(index+row, t);

                   board.removeAt(index+(row+1));
                   board.insert(index+row, t);

                   board.removeAt(index);
                   board.insert(index,t);

                   board.removeAt(index+(row-1));
                   board.insert(index+(row-1), t);                     

                break;


           case 4:

                   board.removeAt(index-(row-1));
                   board.insert(index-(row-1), t);

                   board.removeAt(index+(row+1));
                   board.insert(index+(row+1), t);

                   board.removeAt(index+1);
                   board.insert(index+1,t);

                   board.removeAt(index);
                   board.insert(index, t);                     

                break;
        
            }
    break;

case 3:
            switch (direction) {
              case 1:

                   board.removeAt(index+row);
                   board.insert(index+row, t);

                   board.removeAt(index+(row+1));
                   board.insert(index+(row+1), t);

                   board.removeAt(index+1);
                   board.insert(index+1,t);

                   board.removeAt(index+(row-1));
                   board.insert(index+(row-1), t);       

                   board.removeAt(index-(row-1));
                   board.insert(index-(row-1), t);               

                break;

              case 2:

                   board.removeAt(index+(row+1));
                   board.insert(index+(row+1), t);

                   board.removeAt(index-(row+1));
                   board.insert(index-(row+1), t);

                   board.removeAt(index-1);
                   board.insert(index-1,t);

                   board.removeAt(index+row);
                   board.insert(index + row, t);       

                   board.removeAt(index+(row-1));
                   board.insert(index+(row-1), t);               

                break;
           case 3:

                   board.removeAt(index-row);
                   board.insert(index-row, t);

                   board.removeAt(index-row+1);
                   board.insert(index-row+1, t);

                   board.removeAt(index-1);
                   board.insert(index-1,t);

                   board.removeAt(index+row-1);
                   board.insert(index+row-1, t);   

                   board.removeAt(index-row-1);
                   board.insert(index-row-1, t);                   

                break;


           case 4:

                   board.removeAt(index-(row-1));
                   board.insert(index-(row-1), t);

                   board.removeAt(index-(row+1));
                   board.insert(index-(row+1), t);

                   board.removeAt(index+1);
                   board.insert(index+1,t);

                   board.removeAt(index-row);
                   board.insert(index-row, t);  

                   board.removeAt(index+(row+1));
                   board.insert(index+(row+1), t);                    

                break;
        
            }
    break;

   case 4:
            switch ((direction/2).round()) {
              case 1:

                   board.removeAt(index-row);
                   board.insert(index-row, t);

                   board.removeAt(index+row);
                   board.insert(index+row, t);

                   board.removeAt(index);
                   board.insert(index,t);

                break;

              case 2:

                   board.removeAt(index-1);
                   board.insert(index-1, t);

                   board.removeAt(index+1);
                   board.insert(index+1, t);

                   board.removeAt(index);
                   board.insert(index,t);                  

                break;
            }
    break;

    case 5:       
                 
                   board.removeAt(index-row);
                   board.insert(index-row, t);

                   board.removeAt(index-(row-1));
                   board.insert(index-(row-1), t);

                   board.removeAt(index+1);
                   board.insert(index+1,t);

                   board.removeAt(index);
                   board.insert(index, t);                     

            
    break;

    case 6:       
                 
                   board.removeAt(index-row);
                   board.insert(index-row, t);

                   board.removeAt(index-(row-1));
                   board.insert(index-(row-1), t);

                   board.removeAt(index-(row+1));
                   board.insert(index-(row+1), t);

                   
                   board.removeAt(index+row);
                   board.insert(index+row, t);

                   board.removeAt(index+(row-1));
                   board.insert(index+(row-1), t);

                   board.removeAt(index+(row+1));
                   board.insert(index+(row+1), t);
 
                   board.removeAt(index+1);
                   board.insert(index+1,t);

                   board.removeAt(index);
                   board.insert(index, t);

                   board.removeAt(index-1);
                   board.insert(index-1, t);                        

            
    break;




    case 7:
            switch (direction) {
              case 1:

                   board.removeAt(index-row);
                   board.insert(index-row, t);

                   board.removeAt(index-row+1);
                   board.insert(index-row+1, t);

                   board.removeAt(index+1);
                   board.insert(index+1,t);

                  

                break;

              case 2:

                   board.removeAt(index+row);
                   board.insert(index+row, t);

                   board.removeAt(index+row+1);
                   board.insert(index+row+1, t);


                   board.removeAt(index+1);
                   board.insert(index+1, t);                     

                break;
           case 3:

                   board.removeAt(index+row);
                   board.insert(index+row, t);

                   board.removeAt(index+row-1);
                   board.insert(index+row-1, t);

                   board.removeAt(index-1);
                   board.insert(index-1,t);

                break;


           case 4:

                   board.removeAt(index-row-1);
                   board.insert(index-row-1, t);

                   board.removeAt(index-row);
                   board.insert(index-row, t);

                   board.removeAt(index-1);
                   board.insert(index-1, t);                     

                break;
        
            }
    break;
    }
  }
 
  void Checkline(){

    List<Square> list;
    bool go;
    List<int> roww = new List();
     List<int> colom = new List();

    for(int i = 0 ; i < row ; i++)
    {
      go = true;
      list = new List();
      list.addAll(board.getRange(i*row, (i+1)*row));
      list.forEach((f){
        if(!f.filled)
        go = false;
      });
      if(go)
      roww.add(i);
    }

     for(int i = 0 ; i < row ; i++)
    {
      go = true;
      list = new List();
      for(int j = 0 ; j < row ; j++)
      {
        list.add(board[j*row+i]);
      }
      list.forEach((f){
        if(!f.filled)
        go = false;
      });
      if(go)
      colom.add(i);
    }

  if(roww.isNotEmpty) 
  {

    roww.forEach((line){
      
      int c = line * row;
       score +=100;
      int i =0 ;

      Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {    
         board.removeAt(c+i);
         board.insert(c+i,new Square(7, true,false));
        });
        if(i==row-1)
        timer.cancel();
        else
        i++;
        
        });
        
    });

  } 


  if(colom.isNotEmpty){
    colom.forEach((col){
      int c = col * row;
        score +=100;
        int i =0;
      Timer.periodic(Duration(milliseconds: 50), (timer) {
        int c = i * row;
      setState(() {  
         board.removeAt(col + c);
         board.insert(c+col,new Square(7,true, false));
        });
        if(i==row-1)
        timer.cancel();
        else
        i++;
        
        });
      for(int i = 0 ; i <row; i++){
          
        
    
      }
    });
  }
  
  }
 

  @override
  Widget build(BuildContext context) {

    if(sugesst1==null)
    {  setState(() {
       sugesst1 = new List();
         });randomize(0);randomize(1);randomize(2);}
 
    return Scaffold(

      body:
       Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background.jpg',),fit: BoxFit.cover),
        ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
            Container(
              margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01, ),
              height: MediaQuery.of(context).size.height*0.08,
              width: MediaQuery.of(context).size.width*0.6,
              decoration: BoxDecoration(
                color: Colors.blue[600].withOpacity(0.8),
               borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.white,width: 2),
                boxShadow: [BoxShadow(color: Colors.black38, offset:Offset(0, 0),blurRadius: 15,spreadRadius: 5)]
              ),
              child: Center(child: Text('$score',style: TextStyle(fontSize: 28,color: Colors.white,),))),

            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(2),
                height:MediaQuery.of(context).size.height*0.5,
                width: MediaQuery.of(context).size.width*0.9,
                alignment: Alignment.center,
                child: Center(
                  child: GridView.builder(
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: row),
                    itemCount: board.length,
                    itemBuilder: (context,index){
                    return DragTarget(builder: (context, candidateData, rejectedData) 
                            {
                              return board[index];
                            },
                            onLeave:(data) {
                               try {
                                if(check(index)){
                                setState(() {
                                 update(index,Square(7, true,false));
                                });}
                                return check(index);

                              } catch (e) {
                                return false;
                              }
                           },  
                            onWillAccept: (data) {
                             
                              try {
                                if(check(index)){
                                setState(() {
                                      update(index,Square(color, true,false));
                                });
                            
                                return true;
                                }
                                else 
                                return false;
                              } catch (e) {
                                return false;
                              }
                             
                           }, 
                            onAccept: (data) {
                              try {
                                if(check(index)){
                                setState(() {
                                      update(index,Square(color,false, true));
                                });
                                Checkline();
                                return true;}
                                else return false;
                              } catch (e) {
                                return false;
                              }
                             
                           },); 
                    },

                    


                    ),
                ),
              ),
            ),
           
            Container(

              padding: EdgeInsets.all(5),
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
                color: Colors.white24.withOpacity(0.6),
                border: Border(bottom: BorderSide(color: Colors.blue,width: 2),top: BorderSide(color: Colors.blue,width: 2)),
                boxShadow: [BoxShadow(color: Colors.black38, offset:Offset(0, 0),blurRadius: 15,spreadRadius: 5)]
              ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: <Widget>[
                   Draggable(
                       onDragStarted: (){
                         setState(() {
                          
                          shape = sugesst1[0].shape;
                          direction = sugesst1[0].direction;
                          color = sugesst1[0].color;
                          
                         });
                       },
                       onDragCompleted: (){
                         score += sugesst1[0].score;
                         sugesst1.removeAt(0);
                          randomize(2);
                       },
                     child:  sugesst1[0],
                     feedback:  sugesst1[0],
                     childWhenDragging: Container(width: 120,height: 120,),
                      ),

              Draggable(
                       onDragStarted: (){
                         setState(() {
                          
                          shape = sugesst1[1].shape;
                          direction = sugesst1[1].direction;
                          color = sugesst1[1].color;
                          
                         });
                       },
                       onDragCompleted: (){
                         score += sugesst1[1].score;
                         sugesst1.removeAt(1);
                          randomize(2);
                       },
                     child:  sugesst1[1],
                     feedback:  sugesst1[1],
                     childWhenDragging: Container(width: 120,height: 120,),
                      ),


                Draggable(
                       onDragStarted: (){
                         setState(() {
                          
                          shape = sugesst1[2].shape;
                          direction = sugesst1[2].direction;
                          color = sugesst1[2].color;
                          
                         });
                       },
                       onDragCompleted: (){
                         score += sugesst1[2].score;
                         sugesst1.removeAt(2);
                          randomize(2);
                       },
                     child:  sugesst1[2],
                     feedback:  sugesst1[2],
                     childWhenDragging: Container(width: 120,height: 120,),
                      ),


               ],
             ),
             ),
             ],
           ),
       ),

    );
  }
}



class Square extends StatelessWidget {
  int square;
  bool filled;
  bool hover;

  Square(this.square,this.hover,this.filled);

  List<Image> image = [
    Image.asset('assets/images/blue.png'),
    Image.asset('assets/images/green.png'),
    Image.asset('assets/images/lightgreen.png'),
    Image.asset('assets/images/lightblue.png'),
    Image.asset('assets/images/pink.png'),
    Image.asset('assets/images/red.png'),
    Image.asset('assets/images/yellow.png'),
    Image.asset('assets/images/white.png'),

    
    ];
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Opacity(
        opacity: hover ? 0.5 : 1 ,
              child: Container(
          margin: EdgeInsets.all(0.5),      
          width:35,
          child: image[square],
          height: 35,
        ),
      ),
    );
  /*   return Center(
      child: Container(
        width:30,
        height: 30,
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
             width:30,
             height: 30,
            decoration: BoxDecoration(
              color: color.withOpacity(0.7),
              borderRadius: BorderRadius.all(Radius.circular(5))
            )
            ),
               Center(
                 child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
             width:25,
             height: 25,
            color: color.withOpacity(0.9),
            ),
               )
          ],
        ),
      ),
    ); */
  
  }
}


