class qualitymodel{
final String engineer;
final String date;
final int timehour;
final int timeminite;
final String shift;
final String machinename;
final String productname;
final String defaul;
final String notes;

  qualitymodel({required this.timehour,required this.timeminite, required this.engineer, required this.date,  required this.shift, required this.machinename, required this.productname, required this.defaul, required this.notes});
  factory qualitymodel.fromjson(var data){
return qualitymodel(engineer: data["engineername"],
 date: data["date"], 
 timehour: data["timehour"], 
 timeminite: data["timeminite"], 
 shift: data["shifit"], 
 machinename: data["machine-name"],
  productname: data["product-name"], 
  defaul: data["default"],
   notes: data["notes"]);



  }










}