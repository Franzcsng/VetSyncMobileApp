import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';
import 'main.dart';

class ClinicMap extends StatefulWidget {
  const ClinicMap({super.key});

  @override
  State<ClinicMap> createState() => _ClinicMapState();
}

class _ClinicMapState extends State<ClinicMap> {
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
          height: 80,
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
                        margin: EdgeInsets.only(top: 11, left: 20),
                        child: Icon(Icons.search),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 11, left: 10),
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
            child: 
          ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top:2, bottom: 2, left: 10, right: 10),
              width: 300,
              height: 130,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage('https://raw.githubusercontent.com/Franzcsng/VetSyncJsons/main/images/vetimgs/12_cc4dd312-53f2-491f-acd6-1228e29488b1_500x.webp'),
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
                          child: const Text('ZitroClinic',
                          style: TextStyle(
                            fontSize: 25,
                          ),)
                        ),

                        Container(
                          child: const Text('Bacolod City',
                          style: TextStyle(
                            fontSize: 15,
                          ),)
                        ),
                        
                      ],)
                  ),

                  Container(
                    alignment: Alignment.centerRight,
                    width: 80,
                    height: 80,
                    child: const Center(
                      child: Icon(Icons.more_horiz,
                            size: 40,
                            color: Colors.pinkAccent,),
                    ),
                  ),
                ],
              ),
            );
          },
        ),)

        ],
      ),
    );
  }
}