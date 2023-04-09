import 'package:extraedge/controllers/home_controller.dart';
import 'package:extraedge/models/home_model.dart';
import 'package:extraedge/views/rocket_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  var homeController = Get.find<HomeController>();
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState(){
    super.initState();
    widget.homeController.getRockets();
  }

   static Map<dynamic, Color> getColorForIndex(int index) {
    switch (index % 6) {
      case 0:
        return {
          'color': Color(0xFF4A3201),
          'borderColor': Color(0x4Df6bb42),
          'borderBottomColor': Color(0xFFF6BB42)
        };
      case 1:
        return {
          'color': Color(0xFF0A2C5A),
          'borderColor': Color(0x4D4a89dc),
          'borderBottomColor': Color(0xFF4A89DC)
        };
      case 2:
        return {
          'color': Color(0xFF244400),
          'borderColor': Color(0x4D8cc152),
          'borderBottomColor': Color(0xFF8CC152)
        };
      case 3:
        return {
          'color': Color(0xFF24007E),
          'borderColor': Color(0x4D967adc),
          'borderBottomColor': Color(0xFF967ADC)
        };
      case 4:
        return {
          'color': Color(0xFF005271),
          'borderColor': Color(0x4D3bafda),
          'borderBottomColor': Color(0xFF3BAFDA)
        };
      case 5:
        return {
          'color': Color(0xFF014B39),
          'borderColor': Color(0x4D37bc9b),
          'borderBottomColor': Color(0xFF37BC9B)
        };
      default:
        return {
          'color': Color(0xFF4A3201),
          'borderColor': Color(0x4Df6bb42),
          'borderBottomColor': Color(0xFFF6BB42)
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (snapshot) {
        return Scaffold(
          appBar: AppBar(title: Text("Rockets"), backgroundColor: Color.fromARGB(
                                                          255, 57, 116, 164),),
          body: snapshot.rocketsList.isEmpty ? Center(child: CircularProgressIndicator()) : SafeArea(child: Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, child: ListView.builder(
            itemCount: snapshot.rocketsList.length,
            itemBuilder: (context, index){
              HomeModel rocket = snapshot.rocketsList[index];
              var color = getColorForIndex(index);
            return GestureDetector(
              onTap: (){
                widget.homeController.updateRocket(snapshot.rocketsList[index]);
                Navigator.push( context, MaterialPageRoute(builder: (context) =>  RocketDetailsView()),
              );
              },
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                decoration: BoxDecoration(color: color['borderBottomColor'], borderRadius: BorderRadius.circular(12)),
                child: Container(
                  decoration: BoxDecoration(color: color['borderBottomColor'], borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(children: [
                  SizedBox(height: 10,),
                  Row(children: [
                    Container(width: MediaQuery.of(context).size.width * 0.63, child: Text("${rocket.name}", style: TextStyle(fontSize: 18, color: Colors.white),)),
                    Text("${rocket.first_flight}", style: TextStyle(fontSize: 13, color: Colors.white),)
                  ],),
                  SizedBox(height: 10,),
                  Container(
                    height: 80,
                    child: Text("${rocket.description}", style: TextStyle(overflow: TextOverflow.ellipsis, color: Colors.white), maxLines: 4,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 26,
                          width: 100,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                          child: Center(child: Text("${rocket.company}", style: TextStyle(color: color['borderBottomColor'],),)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 26,
                          width: 100,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text(rocket.active == true ? "Active" : "Not Active", style: TextStyle(color: Colors.white, fontSize: 16),)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                ]),),
              ),
            );
          }),)),
        );
      }
    );
  }
}