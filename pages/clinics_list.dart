import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/map_address.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ClinicMap extends StatefulWidget {
  const ClinicMap({super.key});

  @override
  State<ClinicMap> createState() => _ClinicMapState();
}

class _ClinicMapState extends State<ClinicMap> {
  late List<dynamic> clinicData = []; 

 Future getData() async {
  try {
    final response = await http.get(Uri.parse("https://vetsync.000webhostapp.com/fetch_clinics.php"));

    if (response.statusCode == 200) {
      // Try to decode the response body as JSON
      try {
        List data = json.decode(response.body);
        setState(() {
          clinicData = data;
        });
        debugPrint(clinicData.toString());
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
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'VetSync',
          style: TextStyle(color: Color.fromRGBO(255, 56, 86, 1)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            color: const Color.fromRGBO(255, 56, 86, 1),
            tooltip: 'Show Snackbar',
            onPressed: () {},
          ),
        ],
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 65,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 11, left: 20),
                  child: Icon(Icons.search),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0, left: 10, bottom: 5),
                  width: 300,
                  height: 50,
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: clinicData == null ? 0 : clinicData.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapAddress(name: clinicData[index]['clinic_name'], details: clinicData[index]['details'], img: clinicData[index]['img'])));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: const Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(top: 2, bottom: 2, left: 10, right: 10),
                    width: 290,
                    height: 130,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: const Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(clinicData[index]["img"]),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 100,
                          width: 170,
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  clinicData[index]["clinic_name"],
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  clinicData[index]["clinic_address"],
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}