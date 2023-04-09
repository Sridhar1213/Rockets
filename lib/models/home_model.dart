class HomeModel {

  var height;
  var diameter;
  var mass;
  var firstStage;
  var secondStage;
  var engines;
  var landingLegs;
  var payloadWeights;
  var flickerImages;
  var name;
  var type;
  var active;
  var stages;
  var boosters;
  var cost_per_launch;
  var success_rate_pct;
  var first_flight;
  var country;
  var company;
  var wikipedia;
  var description;
  var id;

  HomeModel({this.height, this.diameter, this.mass, this.firstStage, this.secondStage, this.engines, this.landingLegs, this.payloadWeights, this.flickerImages, this.name, this.type, this.active, this.stages, this.boosters, this.cost_per_launch, this.success_rate_pct, this.first_flight, this.country, this.company, this.wikipedia, this.description, this.id});

  factory HomeModel.fromJSON(map){
    return HomeModel(height: map['height'], diameter: map['diameter'], mass: map['mass'], firstStage: map['first_stage'], secondStage: map['second_stage'], engines: map['engines'], landingLegs: map['landing_legs'], payloadWeights: map['payload_weights'], flickerImages: map['flickr_images'], name: map['name'],type: map['type'], active: map['active'], stages: map['stages'], boosters: map['boosters'], cost_per_launch: map['cost_per_launch'], success_rate_pct: map['success_rate_pct'], first_flight: map['first_flight'], country: map['country'], company: map['company'], wikipedia: map['wikipedia'], description: map['description'],id: map['id']);
  }

}