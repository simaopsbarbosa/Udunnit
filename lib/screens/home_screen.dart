import 'package:flutter/material.dart';
import 'package:Udunnit/themes/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Our house 🏠',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Appcolors.Grey,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Appcolors.GreyBorder, width: 1),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "This week's most determined worker 🫡",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomPersonIcon(image: AssetImage('assets/images/fake_joao_mauricio.png'),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 24.0, 48.0, 6.0),
                        child: Text(
                          'João Maurício 👑',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Appcolors.Grey,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Appcolors.GreyBorder, width: 1),
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
                                  "This week's leaderboard",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Column(
                                  children: [
                                    CustomLeaderboardRow(
                                      index: '1',
                                      personImage: AssetImage('assets/images/fake_joao_mauricio.png'),
                                      name: 'João Maurício',
                                      points: '9',
                                    ),
                                    CustomLeaderboardRow(
                                      index: '2',
                                      personImage: AssetImage('assets/images/fake_paulo_marques.png'),
                                      name: 'Paulo Marques',
                                      points: '4',
                                    ),
                                    CustomLeaderboardRow(
                                      index: '3',
                                      personImage: AssetImage('assets/images/fake_joana_simoes.png'),
                                      name: 'Joana Simões',
                                      points: '2'
                                    ),
                                    SizedBox(height: 20.0,),
                                    Text(
                                      'This month, João Maurício is setup to win the challenge you set: ',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text(
                                        '“The winner won’t have to do any chores next week!”',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Appcolors.Black.withOpacity(0.5)
                                        )
                                      ),
                                    ),
                                  ],
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
            SizedBox(height: 20.0)
          ],
        ),
      ),
    );
  }
}

class CustomLeaderboardRow extends StatelessWidget {
  const CustomLeaderboardRow({
    super.key,
    required this.index,
    required this.personImage,
    required this.name,
    required this.points,
  });

  final String index;
  final AssetImage personImage;
  final String name;
  final String points;

  @override
  Widget build(BuildContext context) {

    String suffix;
    String medal;
    switch (index) {
      case '1':
        suffix = 'st';
        medal = '🥇';
        break;
      case '2':
        suffix = 'nd';
        medal = '🥈';
        break;
      case '3':
        suffix = 'rd';
        medal = '🥉';
        break;
      default:
        suffix = 'th';
        medal = '';
        break;
    }

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0),              
          child: Text(
            '$index',     
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomPersonIcon(image: personImage),
        Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 36.0),
          child: Text.rich(
            TextSpan(
              text: '$name ',
              style: TextStyle(fontSize: 18.0),
              children: [
                TextSpan(
                  text: '($points) ',
                  style: TextStyle(
                    color: Appcolors.Orange
                  )
                ),
                TextSpan(
                  text: medal
                ),
              ]
            ),
          )
        ),
      ],
    );
  }
}

class CustomPersonIcon extends StatelessWidget {
  const CustomPersonIcon({
    super.key,
    required this.image,
  });

  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 24.0, 0.0, 6.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Appcolors.GreyBorder, width: 1),
        ),
        child: CircleAvatar(
          radius: 40,
          backgroundImage: image,
        ),
      ),
    );
  }
}
