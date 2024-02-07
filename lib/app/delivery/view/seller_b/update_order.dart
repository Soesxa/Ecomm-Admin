import 'dart:convert';

import 'package:ecommerce_int2/app/delivery/view/seller_b/view_all_order.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateOrderByDriver extends StatefulWidget {
  UpdateOrderByDriver(
      {super.key,
      required this.id,
      required this.driverStatus,
      required this.sellerName,
      required this.seller_phone,
      required this.shop_address,
      required this.shop_name,
      required this.userName,
      required this.user_phone});
  final String id;
  final String sellerName;
  final String userName;
  final String driverStatus;
  final String shop_name;
  final String user_phone;
  final String seller_phone;
  final String shop_address;

  @override
  State<UpdateOrderByDriver> createState() => _UpdateOrderByDriverState();
}

var status = TextEditingController(text: "1");

class _UpdateOrderByDriverState extends State<UpdateOrderByDriver> {
  Future<void> updateOrder() async {
    try {
      // var status = widget.driverStatus.toString();
      String a = widget.id;
      String b = status.text;
      var res = await http.post(
        Uri.parse(
            "http://192.168.22.165//ecom/update_status_by_driver.php?orderId=$a&driverStatus=$b"),
      );

      if (res.statusCode == 200) {
        var responseOfBody = jsonDecode(res.body);

        if (responseOfBody['success'] == true) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ViewAllOrder()));
        } else {
          print("Some Issues");
        }
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update The Status"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormField(
              controller: status,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Enter the O Or 1",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  updateOrder();
                },
                child: Text("Save Changes"))
          ],
        ),
      ),
    );
  }
}
