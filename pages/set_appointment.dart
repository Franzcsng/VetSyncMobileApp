import 'dart:io';
import 'package:flutter_application_2/pages/pet_details.dart';
import 'package:flutter_application_2/pages/appointments.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Appointment extends StatefulWidget {
  final ValueChanged<DateTime?>? onDateSelected;
  const Appointment({Key? key, this.onDateSelected}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
    late DateTime selectedDate = DateTime.now();

late File? _image = null;
final picker = ImagePicker();
late Map data;
late List<dynamic> petData = [];
String? selectedPet;
String? _selectedPet;
final TextEditingController petController = TextEditingController();
final TextEditingController reasonController = TextEditingController();
final TextEditingController dateController = TextEditingController();


Future choiceImage() async {
  var pickedImage = await picker.pickImage(source: ImageSource.gallery);
  if (pickedImage != null) { 
    setState(() {
      _image = File(pickedImage.path);
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
    selectedDate = DateTime.now();
    getData();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.onDateSelected?.call(selectedDate);
      dateController.text = '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
      });
    }
  }



insertDataMethod() async {
  final url = Uri.parse("https://vetsync.000webhostapp.com/upload_appointments.php");
  var request = http.MultipartRequest('POST', url);
  request.fields['petName'] = petController.text;
  request.fields['reasons'] = reasonController.text;
  request.fields['date'] = dateController.text;
  var pic = await http.MultipartFile.fromPath("image", _image!.path);
  request.files.add(pic);
  
  try {
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Image Uploaded');
    } else {
      print('Image Not Uploaded. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error uploading image: $e');
  }
}
  @override
  Widget build(BuildContext context) {


    return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: const Text('Set Appointment',
      style: TextStyle(color: Color.fromRGBO(255, 56, 86, 1)),),
      backgroundColor: Colors.white,
    ),
    body:  SingleChildScrollView(
      child: Container(
        height: 900,
        child: Column(
      children: [

         Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 10, right: 10, left: 25,),
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
                setState(() {
                  selectedPet = newValue;
                   petController.text = selectedPet ?? "";
                });
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
          controller: reasonController,
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

      SizedBox(
        height: 5,
      ),
Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 20, right: 25, left: 25,),
            child: RichText(text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Upload Pet Book Image',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
            ),
                ),
                TextSpan(
                  text: '\nPet Id and Details',
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
SizedBox(
        height: 5,
      ),
      Center(
        child: ElevatedButton(
          child: Text('Upload Image'),
          onPressed: (){
            choiceImage();
          },
          )
      ),


      Center(
        child: Container(
          width: 150,
          height: 150,
          child: _image == null ? Text('No Image Selected') : Image.file(_image!),
        ),
      ),

Text(
          'Select Appointment Date:',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            width: 230,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.calendar_today),
              ],
            ),
          ),
        ),


SizedBox(
        height: 35,
      ),
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.pink, // background color
        onPrimary: Colors.white, // text color
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20), // size
  ),
          child: Text('Confirm'),
         onPressed: () {
            insertDataMethod().then((_) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppointmentList()),
              );
            });
          },
          ),
      ],
      
    ),
      )));
  }}

  