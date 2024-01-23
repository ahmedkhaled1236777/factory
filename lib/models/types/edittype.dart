class edittypemodel{
  final String typename;
  final String type;
 final String date;
  final int quantity;
  final String engineer;
  final String packet;

  edittypemodel({required this.engineer,required this.date,required this.typename, required this.quantity,required this.type,required this.packet});
  factory edittypemodel.fromjsom(var data){
    return edittypemodel(typename: data["type-name"], 
    type:data["type"],
    packet: data["packet"],
    quantity: data["quantity"],
    date: data["date"],
    engineer: data["engineername"]);
  }
  
}