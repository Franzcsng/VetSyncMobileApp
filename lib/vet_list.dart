import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_application_2/vet_details.dart';

class VetList extends StatefulWidget {
  const VetList({super.key});

  @override
  State<VetList> createState() => _VetListState();
}

class _VetListState extends State<VetList> {
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
            child:ListView.builder(
          itemCount: 8, // Number of items in your list
          itemBuilder: (BuildContext context, int index) {
            // Build each list item
            return Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Card(
               child: SizedBox(
                height: 120,
              child: ListTile(
              contentPadding: EdgeInsets.only( top: 20, left: 10, right: 20),
              title: Text('Dr. Doctor $index',
              style: TextStyle(fontSize: 20) ,),
              subtitle: Text('Veterinarian'),
              leading: const SizedBox(
                child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/doctor1.jpg'),
              )),
              trailing: const Icon(Icons.more_horiz,
              size: 40),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VetDetails()));
              },
            ))));
          }
    )),
         
      ],
    ),
    
    
   );
  }
}