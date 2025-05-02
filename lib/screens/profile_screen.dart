import 'package:flutter/material.dart';
import 'package:udunnit/themes/colors.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Hello, João!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://w7.pngwing.com/pngs/961/327/png-transparent-avatar-profile-profile-page-user-pinterest-twotone-icon-thumbnail.png'), // Replace with your image URL
              )
            ]
          ),

          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Appcolors.Grey,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            )
          )




        ],
      ),
    );
  }
}
