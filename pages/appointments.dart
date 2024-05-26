import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class AppointmentList extends StatefulWidget {

  const AppointmentList({Key? key,}) : super(key: key);

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
late Map data;
  late List<dynamic> appointmentData = [];


 
 Future getData() async {
  try {
    final response = await http.get(Uri.parse("https://vetsync.000webhostapp.com/fetch_appointments.php"));

    if (response.statusCode == 200) {
      // Try to decode the response body as JSON
      try {
        List data = json.decode(response.body);
        setState(() {
          appointmentData = data;
        });
        debugPrint(appointmentData.toString());
      } catch (e) {
        // Handle JSON decoding errors
        debugPrint("Error decoding JSON: $e");
      }
    } else {
      // Handle non-200 status codes
      debugPrint("Error: Server returned status code ${response.statusCode}");
      debugPrint("Response body: ${response.body}");
    }
  } catch (e) {
    // Handle other types of errors (network errors, etc.)
    debugPrint("Error fetching data: $e");
  }
}

  @override
  void initState(){
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: const Text('Appointments',
      style: TextStyle(color: Color.fromRGBO(255, 56, 86, 1)),),
      backgroundColor: Colors.white,
    ),
    body: Column(
      children: [

        Expanded(
            child:ListView.builder(
          // ignore: unnecessary_null_comparison
          itemCount: appointmentData == null ? 0 : appointmentData.length,// Number of items in your list
          itemBuilder: (BuildContext context, int index) {
           String imageUrl = 'https://vetsync.000webhostapp.com/${appointmentData[index]['pet_book_img']}';
            // Build each list item
            return Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  color: Colors.white,
               child: SizedBox(
                height: 120,
              child: ListTile(
              contentPadding: EdgeInsets.only( top: 20, left: 10, right: 20),
              title: Text('${appointmentData[index]['pet']}',
              style: TextStyle(fontSize: 20) ,),
              subtitle: Text('${appointmentData[index]['date']}'),
              leading: SizedBox(
                child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(imageUrl),
              )),
              trailing: const Icon(Icons.more_horiz,
              size: 40),
            ))));
          }
    )),
         

      ],
      
    ), );
  }}

  