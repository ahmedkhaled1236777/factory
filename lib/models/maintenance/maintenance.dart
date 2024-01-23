class maintenancemodel{
final String date;
final String shift;
final String machinename;
final String stopreasons;
final String stopreasonstime;
final String engineer;
final String notes;

  maintenancemodel({required this.engineer, required this.date, required this.shift, required this.machinename, required this.stopreasons, required this.stopreasonstime, required this.notes});
  factory maintenancemodel.fromjson(var data){
    return maintenancemodel(date: data["date"], 
    shift: data["shift"],
    engineer:data["engineername"],
     machinename: data["name"], 
     stopreasons: data["stopreasons"], 
     stopreasonstime: data["stopreasonstime"],
      notes: data["notes"]);





  }









}