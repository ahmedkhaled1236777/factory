
class machinesmodel{
  final String name;

  machinesmodel({required this.name,});
  factory machinesmodel.fromjson(var data){
    return machinesmodel(name: data["machine-name"]);
  }
}