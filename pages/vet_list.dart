import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/vet_details.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class VetList extends StatefulWidget {
  const VetList({super.key});

  @override
  State<VetList> createState() => _VetListState();
}

class _VetListState extends State<VetList> {

late List<dynamic> vetData = []; 

  Future getData() async{
    http.Response response = await http.get(Uri.parse("https://raw.githubusercontent.com/Franzcsng/VetSyncJsons/main/vetsjson.json"));
    Map data = json.decode(response.body);
    if(mounted){
      setState((){
      vetData = data["vets"];
    });}
    
    debugPrint(vetData.toString());
  }

  @override
  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('VetSync',
      style: TextStyle(color: Color.fromRGBO(255, 56, 86, 1)),),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
         onPressed: (){
           Navigator.pop(context);
         }, 
         ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.menu,),
          color: Color.fromRGBO(255, 56, 86, 1),
          tooltip: 'Show Snackbar',
          onPressed: (){},
          
        ),
      ],
      backgroundColor: Colors.white,
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
            )),
          ),
          child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0, left: 20),
                        child: Icon(Icons.search),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0, left: 10),
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
            child:ListView.builder(
          // ignore: unnecessary_null_comparison
          itemCount: vetData == null ? 0 : vetData.length, // Number of items in your list
          itemBuilder: (BuildContext context, int index) {
            // Build each list item
            return Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  color: Colors.white,
               child: SizedBox(
                height: 120,
              child: ListTile(
              contentPadding: EdgeInsets.only( top: 20, left: 10, right: 20),
              title: Text('${vetData[index]['name']}',
              style: TextStyle(fontSize: 20) ,),
              subtitle: Text('Veterinarian'),
              leading: SizedBox(
                child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(vetData[index]['img']),
              )),
              trailing: const Icon(Icons.more_horiz,
              size: 40),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VetDetails(name: vetData[index]['name'], details: vetData[index]['details'], img: vetData[index]['img'])));
              },
            ))));
          }
    )),
         
      ],
    ),
    
    
   );
  }
}