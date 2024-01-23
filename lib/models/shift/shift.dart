class shiftmodel{
final String shift;
final String departementname;

  shiftmodel({required this.shift, required this.departementname});
  factory shiftmodel.fromjson(var data){
    return shiftmodel(shift: data["shift-name"],
     departementname: data["departement"]);
  }






}