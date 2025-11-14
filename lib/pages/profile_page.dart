import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AccountPage extends StatelessWidget {
  final Widget textName = Text(
    "Omar Abd El Nasser Ahmed",
    textScaler: TextScaler.linear(1.2),
    style: TextStyle(fontSize: 25.0, fontFamily: 'Pacifico'),
  );
  AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          if (isLandScape) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                avatarImage(size.width * 0.1),
                Column(
                  children: [
                    textName,
                    const SizedBox(height: 10.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        orderItemVoucher(50, "Orders", context),
                        const SizedBox(width: 20.0),

                        orderItemVoucher(10, "Vouchers", context),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],

          if (!isLandScape) ...[
            Column(
              children: [
                if (Platform.isAndroid) Text("This is a android app"),
                if (Platform.isWindows) Text("this from windwos"),
                avatarImage(size.width * 0.3),
                textName,

                const SizedBox(height: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    orderItemVoucher(50, "Orders", context),
                    orderItemVoucher(10, "Vouchers", context),
                  ],
                ),
              ],
            ),
          ],

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
  return Platform.isIOS
      ? CupertinoListTile(
        title: Text(title),
        trailing: Icon(Icons.chevron_left),
        leading: Icon(leadingIcon),
        onTap: () => debugPrint("Hello From List Tile Ios Device"),
      )
      : ListTile(
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

Widget avatarImage(double width) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    child: Center(
      child: CircleAvatar(
        radius: width,
        backgroundImage: AssetImage("assets/images/omar.png"),
      ),
    ),
  );
}
