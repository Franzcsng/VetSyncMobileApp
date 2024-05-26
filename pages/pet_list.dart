import 'package:flutter_application_2/pages/pet_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PetList extends StatefulWidget {
  const PetList({super.key});

  @override
  State<PetList> createState() => _PetListState();
}

class _PetListState extends State<PetList> {

late Map data;
late List<dynamic> petData = [];

  Future getData() async{
    http.Response response = await http.get(Uri.parse("https://raw.githubusercontent.com/Franzcsng/VetSyncJsons/main/pets.json"));
    data = json.decode(response.body);
    setState((){
      petData = data["pets"];
    });
    debugPrint(petData.toString());
  }

  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        Container(
          width: double.infinity,
          height: 70,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
              color: Colors.grey,
              width: 1,
            )),
          ),
          child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5, left: 20),
                        child: const Icon(Icons.search),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, left: 10),
                        width: 300,
                        height: 50,
                        child: const TextField(
                          decoration: InputDecoration(
                          hintText: 'Search',
                          border: OutlineInputBorder(),
                  ),
                )),
                  
                    ],
                  ),
          ),
          Expanded(
            child: GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.65,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,),
      padding: const EdgeInsets.all(10),
      itemCount: petData == null ? 0 : petData.length,
      itemBuilder: (context, index){
         return petBox(index, context, petData);
      },
       ),)
      ],
    );
  }}

  Widget petBox(index, context, petData){
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PetDetails()));
    },
    child: Card(
    child: SizedBox(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(petData[index]["img"]),
                  fit: BoxFit.cover)
              ),
            ),
             Container(
              width: 150,
              margin: EdgeInsets.only(top: 5),
              child: Text('name: ${petData[index]["name"]}'), 
             ),
             Container(
              width: 150,
              margin: EdgeInsets.only(top: 2),
              child: Text('Breed: ${petData[index]["breed"]}'), 
             ),
             Container(
              width: 150,
              margin: EdgeInsets.only(top: 2),
              child: Text('Age: ${petData[index]["age"]} '), 
             ),
          ],
        ),
      ),
     

    ),
  ),
  );
  
  
  
}

