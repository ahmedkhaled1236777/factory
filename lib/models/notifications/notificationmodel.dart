class notificationmodel{
  final String materialname;
  final int quantity;
  final String time;

  notificationmodel({required this.materialname, required this.time,required this.quantity});
  factory notificationmodel.fromjsom(var data){
    return notificationmodel(materialname: data["material name"],
    quantity: data["quantity"],
     time: data["timestamp"]);
  }
}