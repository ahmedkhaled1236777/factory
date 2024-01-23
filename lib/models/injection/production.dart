class productionmodel{
final String date;
final String shift;
final String machinename;
final String worker;
final String engineer;
final String mold;
final int production;
final String cycle_time;
final int scrap;
final String stopreason;

  productionmodel({required this.engineer, required this.date, required this.shift, required this.machinename, required this.worker, required this.mold, required this.production, required this.cycle_time, required this.scrap, required this.stopreason});


factory productionmodel.fromjson(var data){
  return productionmodel(date: data["date"], 
  engineer:data["engineername"],
  shift: data["shifit"], 
  machinename: data["machine-name"],
   worker: data["workername"],
    mold: data["mold"],
     production: data["production-quantity"],
      cycle_time: data["cycle-time"], 
      scrap: data["scrap-quantity"], 
      stopreason: data["stop-reasons"]);
      
}










}