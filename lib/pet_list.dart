import 'dart:convert';
import 'package:flutter_application_2/pet_details.dart';
import 'package:flutter_application_2/pets.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class PetList extends StatefulWidget {
  const PetList({super.key});

  @override
  State<PetList> createState() => _PetListState();
}

class _PetListState extends State<PetList> {

  List<Pets> _pets = <Pets>[];

  
  @override
  void initState() {
    super.initState();
    fetchPets();
  }

Future<void> _loadPets() async {
    try {
      List<Pets> fetchedPets = await fetchPets();
      setState(() {
        _pets = fetchedPets;
      });
    } catch (error) {
      print('Failed to load pets: $error');
      // Handle error if needed
    }
  }

Future <List<Pets>> fetchPets() async{
  var url = 'https://raw.githubusercontent.com/Franzcsng/VetSyncJsons/main/pets.json';
  var response = await http.get(Uri.parse(url));
  var pets = <Pets>[];

  if(response.statusCode == 200){ 
    var jsonData = json.decode(response.body);
    var petsJson = jsonData['pets'];

    for(var petjson in petsJson){
      pets.add(Pets.fromJson(petjson));
    }
  } else {
    throw Exception('Failed to fetch pets');
  }
  return pets;
}


  @override
  Widget build(BuildContext context) {

    var images = [
              'https://github.com/Franzcsng/VetSyncJsons/blob/main/images/petimgs/dach.jpg?raw=true',
              'https://github.com/Franzcsng/VetSyncJsons/blob/main/images/petimgs/german.jpg?raw=true',
              'https://github.com/Franzcsng/VetSyncJsons/blob/main/images/petimgs/labby.jpeg?raw=true',
              'https://github.com/Franzcsng/VetSyncJsons/blob/main/images/petimgs/malin.jpg?raw=true',
              'https://github.com/Franzcsng/VetSyncJsons/blob/main/images/petimgs/pug.jpg?raw=true',
              ];
    return  Column(
      children: [
        Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 1,
            )
          ),
          child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 20),
                        child: Icon(Icons.search),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 10),
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
      childAspectRatio: 0.8,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,),
      padding: const EdgeInsets.all(10),
      itemCount: images.length,
      itemBuilder: (context, index){
       // var pet = _pets[index];
         // return petBox(_pets[index]);
         //
         return petBox(images[index], context);
      },
       ),)
      ],
    );
  }}



  Widget petBox(image, context){
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
                  image: NetworkImage(image),
                  fit: BoxFit.cover)
              ),
            ),
             Container(
              margin: EdgeInsets.only(top: 5),
              child: Text('name'), 
             ),
             Container(
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              margin: EdgeInsets.only(top: 2),
              child: Text('Breed: Hello'), 
             ),
             Container(
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              margin: EdgeInsets.only(top: 2),
              child: Text('Age: Hello '), 
             ),
          ],
        ),
      ),
     

    ),
  ),
  );
  
  
  
}

