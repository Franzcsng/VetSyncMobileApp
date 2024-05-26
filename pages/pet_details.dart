import 'package:flutter/material.dart';

class PetDetails extends StatefulWidget {
  const PetDetails({super.key});

  @override
  State<PetDetails> createState() => _PetDetails();
}

class _PetDetails extends State<PetDetails> {

Color bgColor = Color.fromRGBO(149, 145, 145, 1);  

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
                image: AssetImage('assets/images/petbg.jpg'),
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
                    padding: const EdgeInsets.all(5),
                    width: 280,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 220, 220, 220),
                    ),
                    margin: const EdgeInsets.only(top: 60),
                    child: const Center(
                      child: Text('Fluffy',
                    style: TextStyle(
                      fontSize: 26,
                    )),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10,),
                    width: 280,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      
                      color: const Color.fromARGB(255, 220, 220, 220),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                      child: const Text('Breed:          Dachschund',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                    
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10,),
                    width: 280,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      
                      color: const Color.fromARGB(255, 220, 220, 220),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                      child: const Text('Birthday:   Frebruary 30, 2024',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                    
                  ),

                   Container(
                    padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10,),
                    width: 280,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      
                      color: const Color.fromARGB(255, 220, 220, 220),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                      child: const Text('Age:           1 month old',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    )),
                    
                  ),

               const  Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top:20, left: 40, bottom: 10),
                    child: Text('Pet notes',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10,),
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 220, 220, 220),
                    ),
                    child: const Text('Meet Fluffy, the adventurous golden retriever with a heart of gold. Fluffy loves to spend her days chasing butterflies in the park and cuddling up with her favorite stuffed bunny at night. She\'s always up for a game of fetch and never says no to a tasty treat. With her wagging tail and contagious enthusiasm, Fluffy brightens up every room she enters. Whether she\'s splashing in puddles or basking in the sun, Fluffy\'s playful spirit is sure to bring joy to everyone around her. Adopt Fluffy today and experience the unconditional love and companionship she has to offer!'),

                ),
                


                ]
              )
            ),
            ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top:100),
            child: const CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage('https://github.com/Franzcsng/VetSyncJsons/blob/main/images/petimgs/dach.jpg?raw=true'),
          )),
          
         

        ],
      ), 
      ),
      ),
    );
  }
}