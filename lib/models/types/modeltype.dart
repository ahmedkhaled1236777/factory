class typemodel{
  final String type;
 final String date;
  final int quantity;
  final String engineer;
  final String barcode;
final String packet;
  typemodel({required this.engineer,required this.date,required this.type, required this.quantity,required this.packet,required this.barcode});
  factory typemodel.fromjsom(var data){
    return typemodel(type: data["type-name"], 
    quantity: data["quantity"],
    barcode: data["barcode"],
    packet: data["packet"],
    date: data["date"],
    engineer: data["engineername"]);
  }
  
}