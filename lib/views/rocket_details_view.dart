import 'package:carousel_slider/carousel_slider.dart';
import 'package:extraedge/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketDetailsView extends StatefulWidget {
  const RocketDetailsView({super.key});

  @override
  State<RocketDetailsView> createState() => _RocketDetailsViewState();
}

class _RocketDetailsViewState extends State<RocketDetailsView> {

  redirectToBrowser(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (snapshot) {
        return Scaffold(
          body: SafeArea(child: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Column(children: [
              Stack(
                children: [
                  snapshot.rocket!.flickerImages == null ? Container(height: MediaQuery.of(context).size.height * 0.3, child: Center(child: CircularProgressIndicator(),)) : CarouselSlider.builder(itemCount: snapshot.rocket!.flickerImages.length, itemBuilder: (context, index, ind){
                    return Image.network(snapshot.rocket!.flickerImages[index], width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height * 0.3, fit: BoxFit.fill, errorBuilder:
                                                  (context, error, stacktrace) {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height * 0.3,
                                                    width:
                                                        MediaQuery.of(context).size.width,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                );
                                              });
                  }, options: CarouselOptions(height: MediaQuery.of(context).size.height * 0.3,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,)),
                  Positioned(child: Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: GestureDetector(onTap: (){
                      Navigator.pop(context);
                    }, child: Icon(Icons.arrow_back_ios, color: Colors.white,),),
                  ))
                ],
              ),
      
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))), child: Container(
                  height: MediaQuery.of(context).size.height * 0.66, 
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ListView(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${snapshot.rocket!.name}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                        Text("${snapshot.rocket!.company}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text("Country: ", style: TextStyle(fontSize: 15.0),),
                      Text("${snapshot.rocket!.country}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                    ],),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text("Status: ", style: TextStyle(fontSize: 15.0),),
                      Text(snapshot.rocket!.active == true ? "Active" : "Not Active", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                    ],),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text("Cost Per Launch: ", style: TextStyle(fontSize: 15.0),),
                      Text("${snapshot.rocket!.cost_per_launch}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                    ],),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text("Success Rate Percentage: ", style: TextStyle(fontSize: 15.0),),
                      Text("${snapshot.rocket!.success_rate_pct}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                    ],),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Visit Page: ", style: TextStyle(fontSize: 15.0),),
                      GestureDetector(onTap: (){
                        redirectToBrowser(Uri.parse(snapshot.rocket!.wikipedia));
                      }, child: Container(width: MediaQuery.of(context).size.width * 0.7, child: Text("${snapshot.rocket!.wikipedia}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, color: Colors.blue),)))
                    ],),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Descrition: ", style: TextStyle(fontSize: 15.0),),
                      Container(width: MediaQuery.of(context).size.width * 0.7, child: Text("${snapshot.rocket!.description}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),))
                    ],),
                    SizedBox(height: 16,),
                    Text("Hardware Information", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text("Stages: ", style: TextStyle(fontSize: 15.0),),
                          Text("${snapshot.rocket!.stages}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ],),
                        Row(children: [
                          Text("Boosters: ", style: TextStyle(fontSize: 15.0),),
                          Text("${snapshot.rocket!.boosters}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ],),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Text("Engine Information", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text("Number of Engines: ", style: TextStyle(fontSize: 15.0),),
                          Text("${snapshot.rocket!.engines['number']}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ],),
                        Row(children: [
                          Text("Engine Type: ", style: TextStyle(fontSize: 15.0),),
                          Text("${snapshot.rocket!.engines['type'].toString().capitalizeFirst}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ],),
                      ],
                    ),
                     SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text("Sea Level: ", style: TextStyle(fontSize: 15.0),),
                          Text("${snapshot.rocket!.engines['isp']['sea_level']}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ],),
                        Row(children: [
                          Text("Vaccum: ", style: TextStyle(fontSize: 15.0),),
                          Text("${snapshot.rocket!.engines['isp']['vacuum']}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ],),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Text("Dimensions", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text("Height in Meters: ", style: TextStyle(fontSize: 15.0),),
                          Text("${snapshot.rocket!.height['meters']}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ],),
                        Row(children: [
                          Text("Height in Feets: ", style: TextStyle(fontSize: 15.0),),
                          Text("${snapshot.rocket!.height['feet']}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ],),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text("Diameter in Meters: ", style: TextStyle(fontSize: 15.0),),
                          Text("${snapshot.rocket!.diameter['meters']}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ],),
                        Row(children: [
                          Text("Diameter in Feets: ", style: TextStyle(fontSize: 15.0),),
                          Text("${snapshot.rocket!.diameter['feet']}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ],),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text("Mass in kgs: ", style: TextStyle(fontSize: 15.0),),
                          Text("${snapshot.rocket!.mass['kg']}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ],),
                        Row(children: [
                          Text("Mass in lbs: ", style: TextStyle(fontSize: 15.0),),
                          Text("${snapshot.rocket!.mass['lb']}", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)
                        ],),
                      ],
                    ),
                  ]),
                ),)
            ],),
          )),
        );
      }
    );
  }
}