class finishmodel{
final String date;
final String shift;
final String engineer;
final String job;
final String worker;
final int production;

  finishmodel( {required this.date,required this.job, required this.shift, required this.engineer, required this.worker, required this.production,});


factory finishmodel.fromjson(var data){
  return finishmodel(date: data["date"], 
  job:data["job"],
  shift: data["shifit"], 
   engineer: data["engineername"], 
   worker: data["workername"],
     production: data["production-quantity"],);
}










}