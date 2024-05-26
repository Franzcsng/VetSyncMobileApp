import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/vet_details.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesList();
}

class _NotesList extends State<NotesList> {

late List<dynamic> noteData = []; 

  Future getData() async{
    http.Response response = await http.get(Uri.parse("https://raw.githubusercontent.com/Franzcsng/VetSyncJsons/main/notes.json"));
    Map data = json.decode(response.body);
    setState((){
      noteData = data["food"];
    });
    debugPrint(noteData.toString());
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
          itemCount: noteData == null ? 0 : noteData.length, // Number of items in your list
          itemBuilder: (BuildContext context, int index) {
            // Build each list item
            return Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Column(
                children: [

                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 5, left:20, bottom: 3),
                      child: Text('${noteData[index]["title"]}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      )
                    ),
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 76,
                      margin: EdgeInsets.only(bottom: 5, left: 12),
                      child: Text('${noteData[index]["description"]}',
                      )
                    ),
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('- ${noteData[index]["author"]}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      )
                    ),
                  ),




                ],
              ),
            ),
            );
            
            /*Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  color: Colors.white,
               child: SizedBox(
                height: 120,
              child: ListTile(
              contentPadding: EdgeInsets.only( top: 20, left: 10, right: 20),
              title: Text('${noteData[index]['name']}',
              style: TextStyle(fontSize: 20) ,),
              subtitle: Text('Veterinarian'),
              leading: SizedBox(
                child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(noteData[index]['img']),
              )),
              trailing: const Icon(Icons.more_horiz,
              size: 40),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VetDetails(name: noteData[index]['name'], details: noteData[index]['details'], img: noteData[index]['img'])));
              },
            ))));*/
          }
    )),
         
      ],
    ),
    
    
   );
  }
}