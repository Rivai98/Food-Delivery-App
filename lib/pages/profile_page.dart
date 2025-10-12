import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Center(
              child: CircleAvatar(
                radius: size.width * 0.3,
                backgroundImage: AssetImage("assets/images/omar.png"),
              ),
            ),
          ),

          Text(
            "Omar Abd El Nasser Ahmed",
            textScaler: TextScaler.linear(1.2),
            style: TextStyle(fontSize: 25.0, fontFamily: 'Pacifico'),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              orderItemVoucher(50, "Orders", context),
              orderItemVoucher(10, "Vouchers", context),
            ],
          ),
          SizedBox(height: 24.0),
          Divider(height: 2, indent: 50.0, endIndent: 50.0),
          onTappedProFile(
            context,
            leadingIcon: Icons.shopping_bag,
            title: "Past Orders",
          ),
          SizedBox(height: 10),
          Divider(height: 2, indent: 50.0, endIndent: 50.0),
          onTappedProFile(
            context,
            leadingIcon: Icons.card_giftcard,
            title: "Available Vouchers",
          ),
          Divider(height: 2, indent: 50.0, endIndent: 50.0),
        ],
      ),
    );
  }
}

Widget orderItemVoucher(int number, String type, BuildContext context) {
  return Column(
    children: [
      Text(
        number.toString(),
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 25.0),
      ),
      Text(type, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
    ],
  );
}

Widget onTappedProFile(
  BuildContext context, {
  required IconData leadingIcon,
  required String title,
  String? subtitle,
}) {
  return ListTile(
    onTap: () => debugPrint("$title clicked"),
    leading: Icon(
      leadingIcon,
      color: Theme.of(context).primaryColor,
      size: 20.0,
    ),
    title: Text(title, style: TextStyle(fontFamily: 'SpaceGrotesk')),
    subtitle: subtitle != null ? Text(subtitle) : null,
    trailing: Icon(
      Icons.chevron_right_rounded,
      size: 20,
      color: Theme.of(context).primaryColor,
    ),
  );
}
