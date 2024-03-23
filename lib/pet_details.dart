import 'package:flutter/material.dart';

class PetDetails extends StatefulWidget {
  const PetDetails({super.key});

  @override
  State<PetDetails> createState() => _PetDetails();
}

class _PetDetails extends State<PetDetails> {

Color bgColor = Color.fromRGBO(149, 145, 145, 1);  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(216, 215, 215, 1),
    body: SingleChildScrollView(
      child: Container(
        height: 950,
        child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/petbg.jpg'),
                fit: BoxFit.cover)
            ),
          ),
          Center(
              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
              ),
              margin: EdgeInsets.only(top: 170,),
              width: 372,
              height: 700,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.only(top: 10, left: 120),
                    child: Text('Dr. Alliana Klein Smith',
                    style: TextStyle(
                      fontSize: 16,
                    )),
                  ),


                      Container(
                      width: 315,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 5,),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(241, 241, 241, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                        child: Column(
                          children: [
                          
                        ],)
                      ),

                    Container (
                      margin: EdgeInsets.only(top: 10,),
                      width: 330,
                          child: Row(
                          children: [ 
                            Card(
                            color:Color.fromRGBO(242, 93, 120, 1),
                            child: SizedBox(
                            width: 150,
                            height: 70,
                            child: Center(
                              child:  Container(
                                margin: EdgeInsets.only(left: 25,),
                                child: const  Row(
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 35,
                              ),
                              Center(
                                child: Text("Call",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),),
                              ),
                               
                          ]
                            )

                              ),
                            ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(left: 30,),
                            child: Column(
                              children: [
                                Container(
                                  child: Text('Vet check up',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),),
                                ),
                                Container(
                                  child: Text('300 PHP',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),),
                                ),
                              ],
                            ),
                          ),

                          ]
                        ),
                    ),

                     const Card(
                            color:Color.fromRGBO(242, 93, 120, 1),
                            child: SizedBox(
                              width: 320,
                              height: 60,
                              child: Center(
                                child: Text(
                                'Book an Appointment',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              ),
                            ),
                            
                          ),

                ]
              )
            ),
            ),
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top:100),
            child: CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage('https://github.com/Franzcsng/VetSyncJsons/blob/main/images/petimgs/dach.jpg?raw=true'),
          )),
          
         

        ],
      ), 
      ),
      ),
    );
  }
}