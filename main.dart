import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/clinics_list.dart';
import 'package:flutter_application_2/pages/notes.dart';
import 'package:flutter_application_2/pages/vet_list.dart';
import 'package:flutter_application_2/pages/pet_list.dart';
import 'package:flutter_application_2/pages/appointments.dart';


void main() => runApp( AppBarApp());


class AppBarApp extends StatelessWidget{
    AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  AppBarExample createState() => AppBarExample();
}

class AppBarExample extends State<Home>{

Color bgColor = Color.fromRGBO(255, 255, 255, 1);    
  

int _currentIndex = 0;

final List<Widget Function(BuildContext)> tabs = [
  (BuildContext context) => homePage(context),
  (BuildContext context) => Center(child: PetList()),
  (BuildContext context) => Center(child: Text('hello2')),
  (BuildContext context) => Center(child: Text('hello3')),
];

@override
Widget build(BuildContext context){

  return Scaffold(
    backgroundColor: bgColor,
    appBar: AppBar(
      title: const Text('VetSync',
      style: TextStyle(color: Color.fromRGBO(255, 56, 86, 1)),),
      leading: IconButton(
        icon: const ImageIcon(AssetImage('assets/images/logo.png'),
        color: Color.fromRGBO(255, 56, 86, 1),
        size: 55,),
         onPressed: (){
           Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context){
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Next page'),
                  ),
                  body: const Center(
                    child: Text(
                      'This is the next page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ));
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
    body: tabs[_currentIndex](context),
    bottomNavigationBar: BottomNavigationBar(
    currentIndex: _currentIndex,
    type: BottomNavigationBarType.fixed,
    items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'home',),
         BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/images/cat.png')),
        label: 'pets',),
         BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/images/edit.png')),
        label: 'notes',),
         BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/images/calendar-lines.png')),
        label: 'calendar',)
    ],
    onTap: (index){
      setState((){
        _currentIndex = index;
      }
      );
    },
    unselectedItemColor: Colors.red, 
    unselectedLabelStyle: const TextStyle(color: Colors.red),
    selectedItemColor: Colors.pinkAccent,
    )
  );
 }
}

Widget homePage(context){
  return SingleChildScrollView(
      child: Column(
      children: <Widget>[
        displayCardContainer(),
         Container(
          decoration: BoxDecoration(
          ),
          height: 290,
          child:  Expanded(
          child: gridView(context),
        ),
        ),
        buttonRowTwo(context),
        Padding(
          padding: EdgeInsets.only(left: 25, right: 20) ,
        child: Container(
        height: 30,
        width: double.infinity,
        child: const Text('Recent Activities',
        style: TextStyle(fontSize: 22),),
        )),
        activitySlide(),

        Container(
          height: 10,
        ),
  ],
    ));
}

Widget homeDisplayCards(image){
  return Container(
    width: 335,
    height: 100,
    margin: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.orange,
    borderRadius: BorderRadius.circular(20),
    image: const DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage('assets/images/images.jpg'),
    )),
  );
}

Widget displayCardContainer(){
  return Center(
            child: Container(
            decoration: const BoxDecoration(
            ),
            width: 500.0,
            height: 180.0,
            child: Center( 
              child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                homeDisplayCards(''),
                homeDisplayCards(''),
                homeDisplayCards(''),
              ],))
          ),
        ); 
}

Widget buttonRowOne(){
  return const Center(
          child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
          child: Row(children: <Widget>[
              
],)));
}

Widget buttonRowTwo(BuildContext context){
  return Center(
    child: Container (
      margin: EdgeInsets.only(top: 0,),
      width: double.infinity,
      height: 90,
      child: Row(children: <Widget>[
        SizedBox(width: 3.6,),
      buttonRowTwoChild(context, 'assets/images/dog-bowl.png', 'Food'),
      SizedBox(width: 7.6,),
      buttonRowTwoChild(context, 'assets/images/bath.png', 'Hygiene'),
      SizedBox(width: 7.6,),
      buttonRowTwoChild(context, 'assets/images/medicine.png', 'Treatment'),
      SizedBox(width: 7.6,),
      buttonRowTwoChild(context, 'assets/images/note.png', 'Training'),
    ],))
  );
}

Widget buttonRowTwoChild(BuildContext context, image, text){
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotesList()));
    },
    child: Card(
          color: Colors.white,
          child: SizedBox(
          width: 75,
          height: 80,
          child:Padding(
            padding: EdgeInsets.only(top:5, bottom: 5),
            child: Column(
              children: [
                Image.asset(image,
                width: 45,
                fit: BoxFit.fitWidth,),
                Text(text)
              ],
            )
               
          ),
        ) ),
  );
}


Widget gridView(context){
  return Padding(
    padding: EdgeInsets.only(top: 3, left: 20, right: 20, bottom: 0),
    child: GridView(
      physics: new NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( 
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 5,
        childAspectRatio: 2,
      ),
      children: [
       GestureDetector(
                  onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => VetList()));
                  },
         child: Card(

          color: Colors.white,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top:3, left: 10, right: 10, bottom: 3),
              child: Row(
              children: [
                Image.asset(
                  'assets/images/veterinarian.png',
                  width: 75,
                  fit: BoxFit.fitWidth,
                ),
                Container(
                margin: EdgeInsets.only(left: 5),
                child: const Text('Find a\nVet',
                style: TextStyle(fontSize: 17),)
                )
              ],
            )),
          ),
        )),
        GestureDetector(
                  onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClinicMap()));
                  },
       child: Card(
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.only(top:3, left: 10, right: 10, bottom: 3),
              child: Row(
              children: [
                Image.asset(
                  'assets/images/veterinary.png',
                  width: 50,
                  fit: BoxFit.fitWidth,
                ),
                Container( 
                margin: EdgeInsets.only(left: 0),
                child: const Text('Nearby\nVet Clinics',
                style: TextStyle(fontSize: 16),))
              ],
            )),
        )),
        GestureDetector(
          onTap: () {
            
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PetList()));
          },
        child: Card(
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.only(top:3, left: 15, right: 10, bottom: 3),
              child: Row(
              children: [
                Image.asset(
                  'assets/images/pet-shop.png',
                  width: 45,
                  fit: BoxFit.fitWidth,
                ),
                Container ( 
                  margin: EdgeInsets.only(left: 5),
                  child: const Text('Nearby\nPet Stores',
                  style: TextStyle(fontSize: 15),)),
              ],
              
            )),
            
        ),),
            GestureDetector(
              onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AppointmentList()));
          },
              child:  Card(
                color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.only(left: 13, top: 5, bottom: 5, right: 5),
                                child: Row(
                                children: [
                                  Image.asset('assets/images/appointment.png',
                                  width: 45,
                                  fit: BoxFit.fitWidth ,),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: const Text('Calendar',
                                  style: TextStyle(fontSize: 17),),
                            )
                            ],
                              )),
              ),
            ),
             
      ],
    ),
  );
}



Widget activitySlideChild(){
  return Container(
     width: 282,
     height: 125,
     margin: EdgeInsets.only(left: 20, right: 10, top: 5, bottom:5),
    decoration: BoxDecoration(
      border: const Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
      color: Color.fromRGBO(	248, 248, 255, 1), 
    borderRadius: BorderRadius.circular(12),),
    child: Row(
      children: [
        Column(
          children: [
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(left: 10, top: 10, bottom: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color.fromRGBO(255, 56, 86, 1) ),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/dog-pet1.jpg'))
              ),
            ),
            IconButton(
        icon: const ImageIcon(AssetImage('assets/images/menu-dots.png'),
        color: Color.fromRGBO(255, 56, 86, 1),
        size: 30,),
            onPressed: (){},
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10),
              child: const Text("Vaccination",
              style: TextStyle(
                fontSize: 20,
              ),),
            ),

             Container(
              margin: EdgeInsets.only(left: 10, top: 5),
              child: Text("Zitro Vet Bacolod City"),
            ),

             Container(
              margin: EdgeInsets.only(left: 10, top: 5),
              child: Text("Name: Bucky"),
            ),

             Container(
              margin: EdgeInsets.only(left: 10, top: 5),
              child: Text("January 25,2024"),
            ),


          ],
        ),
      ],),
  );
}

Widget activitySlide(){
  return Container(
    margin: const EdgeInsets.only(left: 0, right: 0,),
    width: 500,
    height: 150,
    decoration: BoxDecoration(),
    child: Center(
      child: Expanded( 
        child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        activitySlideChild(),
        activitySlideChild(),
        activitySlideChild(),
      ],)
    
  )));
}