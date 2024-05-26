import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter_application_2/pages/set_appointment.dart';

class VetDetails extends StatefulWidget {
final String name;
final String details;
final String img;

  const VetDetails({
    super.key, 
    required this.name, 
    required this.details, 
    required this.img,
    });

  @override
  State<VetDetails> createState() => _VetDetails();
}

class _VetDetails extends State<VetDetails> {
late Map data;
late List<dynamic> petData = [];
String? selectedPet;
String? _selectedPet;

void _updateSelectedPet(String? newPet) {
  setState(() {
    _selectedPet = newPet;
  });
}

 DateTime _selectedDate = DateTime.now();
 late String formattedDateTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

Color bgColor = const Color.fromRGBO(149, 145, 145, 1);  
File? _selectedFile;

Future<void> _pickFile() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
      });
    }
}

  Future getData() async{
    final response = await http.get(Uri.parse("https://raw.githubusercontent.com/Franzcsng/VetSyncJsons/main/pets.json"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        petData = data["pets"];
        if (petData.isNotEmpty) {
          selectedPet = petData[0]["name"];
        }
      });
    } else {
      throw Exception('Failed to load pet data');
    }
  }

  @override
  void initState(){
    super.initState();
     formattedDateTime = _selectedDate.toString(); // Initialize formattedDateTime in initState
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(216, 215, 215, 1),
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
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
              ),
              margin: const EdgeInsets.only(top: 170,),
              width: 372,
              height: 700,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[

                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 120),
                    child: Text( widget.name/*'Dr. Alliana Klein Smith'*/,
                    style: const TextStyle(
                      fontSize: 16,
                    )),
                  ),

                  Container(
                    width: 163,
                    margin: const EdgeInsets.only(top: 0, left: 120),
                    child: const Text('Doctor of Veterinary Medicine',
                    style: TextStyle(
                      fontSize: 14,
                    )),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 140, top: 6,),
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                        width: 7,
                        height: 7,
                      ),

                      Container(
                        margin: const EdgeInsets.only(left: 7, top: 5,),
                        child: const Text("Available Now",
                         style: TextStyle(
                        fontSize: 12,
                      ),)
                      ),

                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 3,),
                        child: const Row(
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
                      margin: const EdgeInsets.only(left: 20, top: 5,),
                        child: const Text("Veterinarian Details",
                        style: TextStyle(
                          fontSize: 20,
                        ),)
                      ),

                    Container(
                      width: 315,
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 5,),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(241, 241, 241, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                        child: Padding(padding: const EdgeInsets.all(7),
                        child: Text(widget.details/*"James, DVM and the team at Zitro Vet Bacolod are passionate about providing quality veterinary care to the animals in the community and the surrounding areas. Our office provides full-service veterinary care including grooming, boarding, vaccinations, dental exams, surgeries, pharmaceuticals, and annual wellness checkups to make sure your pet is in top shape!"*/,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),))
                      ),

                      Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 20, top: 5,),
                        child: const Text("Address",
                        style: TextStyle(
                          fontSize: 20,
                        ),)
                      ),

  
                      Container(
                      width: 315,
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(top: 5,),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(241, 241, 241, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                        child: Column(
                          children: [
                          Row(
                          children: [

                            Container(
                              margin: const EdgeInsets.all(10),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/zitroclinic.png',),
                            ),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 10),
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
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.redAccent),
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/mapp.png',),
                            ),
                           
                          ))
                        ],)
                      ),

                    Container (
                      margin: const EdgeInsets.only(top: 10,),
                      width: 330,
                          child: Row(
                          children: [ 
                            Card(
                            color:const Color.fromRGBO(242, 93, 120, 1),
                            child: SizedBox(
                            width: 150,
                            height: 70,
                            child: Center(
                              child:  Container(
                                margin: const EdgeInsets.only(left: 25,),
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
                            margin: const EdgeInsets.only(left: 30,),
                            child: const Column(
                              children: [
                                 SizedBox(
                                  child: Text('Vet check up',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),),
                                ),
                                  SizedBox(
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

                    ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Appointment()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(242, 93, 120, 1),
                          minimumSize: const Size(320, 60),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)), 
                          ),
                        ),
                        child: const Text(
                          'Book an Appointment',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),

                ]
              )
            ),
            ),
          Positioned(
            top: 140,
            left: 16,
            child: CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(widget.img),//AssetImage('assets/images/doctor1.jpg'),
          )),
          
         

        ],
      ), 
      ),
      ),
    );
  }
}

/*
Future displayBottomSheet(BuildContext context, VoidCallback pickFileCallback, List<dynamic> petData, String? selectedPet, void Function(String?) updateSelectedPet,  Future<void> Function(BuildContext) selectDateCallBack, String formattedDateTime ){
  return showModalBottomSheet(context: context,
  isScrollControlled: true,
   builder: (context) => Container(
    height: 800,
    width: double.infinity,
    child: SingleChildScrollView(
      child: Expanded(child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 30, right: 10, left: 25,),
            child: RichText(text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Which pet is this appointment for?',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
            ),
                ),
                TextSpan(
                  text: '\n*add new pet',
                  style: TextStyle(
                  color: Colors.red,
                  fontSize: 17,
            ),
                ),
              ]
            ))
          )
        ),

        Container(
          margin: const EdgeInsets.only(top: 10,),
          width: 350,
          height: 60,
          padding: const EdgeInsets.all(10),
         decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.pink),
          borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: selectedPet,
          items: petData.map<DropdownMenuItem<String>>((dynamic pet) {
              return DropdownMenuItem<String>(
                value:  pet["name"],
                child: Text( pet["name"],
                style: const TextStyle(
                  color: Colors.pink,
                ),),
              );
            }).toList(),
              onChanged: (String? newValue) {
              if (newValue != null) {
                updateSelectedPet(newValue);
                }
              },
            ),
          ),
       
       Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 20, right: 25, left: 25,),
            child: RichText(text: const TextSpan(
              children: [
                TextSpan(
                  text: 'What is the reason for appointment?',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
            ),
                ),
                TextSpan(
                  text: '\nPlease indicate the reason for consultation and appointment',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
            ),
                ),
              ]
            ))
          )
        ),

        Container(
          width: 350,
          height: 100,
          margin: const EdgeInsets.only(top: 13,),
        child: TextField(
          maxLines: 10,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.pink),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.pink), // Set border color here
            borderRadius: BorderRadius.circular(10),
          ),
          ),
        ), 
        ),

       Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 20, right: 25, left: 25,),
            child: RichText(text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Upload files',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
            ),
                ),
                TextSpan(
                  text: '\nPrescriptions, referrals, diagnostics, etc.',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
            ),
                ),
              ]
            ))
          )
        ),

        GestureDetector(
          onTap: pickFileCallback,
          child: Container(
            margin: const EdgeInsets.only(top:13,),
            width: 350,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.pink),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.pink,
                size: 30,
              ),
            ),
          ),
        ),

      Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 20, right: 25, left: 25,),
            child: RichText(text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Schedule your appointment',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
            ),
                ),
              ]
            ))
          )
        ),

     

          ElevatedButton(
                        onPressed: () {
                          selectDateCallBack(context);
                        },
                        child: Text('Select date'),
                      ),

               Center(
          child: Text(formattedDateTime),
        ),    
     


    Container(
      margin: const EdgeInsets.all(20),
      child: const Card(
                            color:Color.fromRGBO(242, 93, 120, 1),
                            child: SizedBox(
                            width: 150,
                            height: 50,
                            child: 
                              Center(
                                child: Text("Confirm",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),),
                              ),
                            ),
                          ),
    ),
    
      

      ],
    ),)),
   ),
   );
}
*/
