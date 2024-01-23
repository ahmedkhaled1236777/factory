class materialmodel{
  final String material;
 final String date;
  final int quantity;
  final String engineer;

  materialmodel({required this.engineer,required this.date,required this.material, required this.quantity});
  factory materialmodel.fromjsom(var data){
    return materialmodel(material: data["material-name"], 
    quantity: data["quantity"],
    date: data["date"],
    engineer: data["engineername"]);
  }
  
}