class editmaterialmodel{
  final String material;
  final String type;
 final String date;
  final int quantity;
  final String engineer;

  editmaterialmodel({required this.engineer,required this.date,required this.material, required this.quantity,required this.type});
  factory editmaterialmodel.fromjsom(var data){
    return editmaterialmodel(material: data["material-name"], 
    type:data["type"],
    quantity: data["quantity"],
    date: data["date"],
    engineer: data["engineername"]);
  }
  
}