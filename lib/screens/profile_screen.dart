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
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/fake_joao_mauricio.png'),
              )
            ]
          ),
          SizedBox(height: 40),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 34),
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Appcolors.Grey,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Appcolors.GreyBorder, width: 2),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text.rich(
                          TextSpan(
                            text: 'Your are currently a member of the house "',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold
                            ),
                            children: [
                              TextSpan(
                                text: 'Cirb com os bros 🏠',
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                              TextSpan(text: '"'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerRight,
                          foregroundColor: Appcolors.Red,
                        ),
                        child: Text(
                          'Quit house',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          alignment: Alignment.centerRight,
                          backgroundColor: Appcolors.Blue,
                          foregroundColor: Appcolors.Black,
                          side: BorderSide(color: Appcolors.GreyBorder, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          'View other members',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 34),
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Appcolors.Grey,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Appcolors.GreyBorder, width: 2),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "This week, you've completed ",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold
                                  ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: "9 ",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Appcolors.Orange,
                                  ),
                                  children: [                                
                                    TextSpan(
                                      text: ' tasks! 🔥',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: Appcolors.Black,

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Great work! ",
                                  style: TextStyle(
                                    color: Appcolors.Black.withOpacity(0.5),
                                    fontSize: 26,
                                    fontWeight: FontWeight.w300,
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
