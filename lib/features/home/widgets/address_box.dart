import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/providers/user.provider.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      height: 40.0,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 114, 226, 221),
        Color.fromARGB(255, 162, 236, 233),
      ], stops: [
        0.5,
        1.0
      ])),
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 20.0,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              'Delivery to ${user.name} - ${user.address}',
              style: const TextStyle(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          )),
          const Padding(
            padding: EdgeInsets.only(left: 5.0, top: 2.0),
            child: Icon(
              Icons.arrow_drop_down_outlined,
              size: 18.0,
            ),
          )
        ],
      ),
    );
  }
}
