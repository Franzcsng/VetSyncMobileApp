import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class MapAddress extends StatefulWidget {
  final String name;
  final String details;
  final String img;

  const MapAddress({
    super.key, 
    required this.name, 
    required this.details, 
    required this.img,
    });

  @override
  State<MapAddress> createState() => _MapAddress();
}

class _MapAddress extends State<MapAddress> {

Color bgColor = Color.fromRGBO(149, 145, 145, 1);  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              height: 570,
             child: mapBody(),
            ),
          ),
          clinicInfo(widget.img, widget.name, widget.details),
        ],
      ),
    );
  }
}

Widget clinicInfo(String img, String name, String details){
  return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 380,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              border: Border(top: BorderSide(
                width: 1,
                color: Colors.grey,
              ))
            ),
            child: Column(
              children: [
               Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top:20, left: 30),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.grey,),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(img)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top:20, left: 20,),
                      width: 220,
                      child: Text(name,
                      style: TextStyle(
                        fontSize: 25,
                      ),),
                ),
                  ],
                ),
               ),

               Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  child: const Text('Address',
                  style: TextStyle(
                    fontSize: 19,
                  ),),
                ),
               ),


               Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                width: 375,
                height: 100,
                decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 234, 234),
                borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(details),
                ),
               ),

              SizedBox(
                width: 375,
                height: 100,
                child: Row(
                  children: [
                    
                    Container(
                      width: 150,
                      margin: const EdgeInsets.only(left: 10, top: 5),
                      child: Container(
                        margin: const EdgeInsets.only(top: 9),
                        child: const Column(
                        children: [
                          Text('Contact Details',
                          style: TextStyle(
                            fontSize: 17,
                          ),),

                          Text('+63 1456 1945',
                          style: TextStyle(
                            fontSize: 15,
                          ),),

                          Text('(034) 145 1945',
                          style: TextStyle(
                            fontSize: 15,
                          ),),
                        ]),
                      ),
                    ),

                    ElevatedButton(
                    onPressed:(){}, 
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 70),
                      backgroundColor: const Color.fromRGBO(242, 93, 120, 1),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)),             
                      ),
                    ),
                    child: const Text('Call',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),),)

                  ]),
              ),


              ],
            ),
          ));
}

Widget mapBody(){
  return FlutterMap(
    options:  const MapOptions(
      initialCenter: LatLng(10.667929623539987, 122.95848498256404),
      initialZoom: 15,
      interactionOptions: 
       InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
    ),
     children: [
      openStreetMapTileLayer,
      const MarkerLayer(
        markers: [
          Marker(point: LatLng(10.667929623539987, 122.95848498256404),
          width: 60,
          height: 60,
          alignment:Alignment.centerLeft,
          child: Icon(Icons.location_pin, size: 60, color: Colors.red)
          )],),
     ]);
}

TileLayer get openStreetMapTileLayer => TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
);