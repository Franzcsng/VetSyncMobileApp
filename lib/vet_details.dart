import 'package:flutter/material.dart';

class VetDetails extends StatefulWidget {
  const VetDetails({super.key});

  @override
  State<VetDetails> createState() => _VetDetails();
}

class _VetDetails extends State<VetDetails> {

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
                image: AssetImage('assets/images/clinic1.jpg'),
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
                    width: 163,
                    margin: EdgeInsets.only(top: 0, left: 120),
                    child: Text('Doctor of Veterinary Medicine',
                    style: TextStyle(
                      fontSize: 14,
                    )),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 140, top: 6,),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                        width: 7,
                        height: 7,
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 7, top: 5,),
                        child: const Text("Available Now",
                         style: TextStyle(
                        fontSize: 12,
                      ),)
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20, top: 3,),
                        child: Row(
                          children: [
                            Icon(Icons.star_outlined,
                            size: 15,
                            color: Colors.yellow),
                            Icon(Icons.star_outlined,
                            size: 15,
                            color: Colors.yellow),
                            Icon(Icons.star_outlined,
                            size: 15,
                            color: Colors.yellow),
                            Icon(Icons.star_outlined,
                            size: 15,
                            color: Colors.yellow),
                            Icon(Icons.star_outlined,
                            size: 15,
                            color: Colors.yellow),
                            Text("5.0")
                          ],)
                      ),
                    ],),

                     Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20, top: 5,),
                        child: Text("Veterinarian Details",
                        style: TextStyle(
                          fontSize: 20,
                        ),)
                      ),

                    Container(
                      width: 315,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 5,),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(241, 241, 241, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                        child: Padding(padding: EdgeInsets.all(7),
                        child: Text("James, DVM and the team at Zitro Vet Bacolod are passionate about providing quality veterinary care to the animals in the community and the surrounding areas. Our office provides full-service veterinary care including grooming, boarding, vaccinations, dental exams, surgeries, pharmaceuticals, and annual wellness checkups to make sure your pet is in top shape!",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),))
                      ),

                      Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20, top: 5,),
                        child: Text("Address",
                        style: TextStyle(
                          fontSize: 20,
                        ),)
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
                          Row(
                          children: [

                            Container(
                              margin: EdgeInsets.all(10),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage('assets/images/zitroclinic.png',),
                            ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(left: 10),
                              width: 190,
                              child: const Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_pin,
                                      size: 20,),
                                      Text("Zitro Vet Bacolod City",
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_filled,
                                       size: 20,),
                                      Text("Monday to Saturday \n7:00am - 5:30pm",
                                      style: TextStyle(
                                        fontSize: 13,
                                      )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.phone,
                                       size: 20,),
                                      Text("09357875621",
                                      style: TextStyle(
                                        fontSize: 13,
                                      )),
                                    ],
                                  ),

                                  
                                ],
                              )
                            ),

                            


                          ]),

                          Container(
                            width: 293,
                            height: 75,
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.redAccent),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/mapp.png',),
                            ),
                           
                          ))
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
          const Positioned(
            top: 140,
            left: 16,
            child: CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/doctor1.jpg'),
          )),
          
         

        ],
      ), 
      ),
      ),
    );
  }
}