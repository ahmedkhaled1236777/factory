class attendancemodel{
  final String employeename;
  final String departement;
  final String Dateofhiring;
  final String job;

  attendancemodel({required this.employeename, required this.departement, required this.Dateofhiring, required this.job});
  factory attendancemodel.fromjson(var data){
    return attendancemodel(employeename: data["employeename"], 
    departement: data["departement"],
     Dateofhiring: data["Dateofhiring"],
      job: data["job"]);
  }


}