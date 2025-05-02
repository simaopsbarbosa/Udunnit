import 'package:flutter/material.dart';
import 'package:Udunnit/themes/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
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
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPersonIcon(
                          image: AssetImage(
                            'assets/images/fake_joao_mauricio.png',
                          ),
                          size: 35,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'João Maurício 👑',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "This month's leaderboard",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 10.0),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CustomLeaderboardRow(
                                          index: '1',
                                          personImage: AssetImage(
                                            'assets/images/fake_joao_mauricio.png',
                                          ),
                                          name: 'João Maurício',
                                          points: '14',
                                        ),
                                        CustomLeaderboardRow(
                                          index: '2',
                                          personImage: AssetImage(
                                            'assets/images/fake_paulo_marques.png',
                                          ),
                                          name: 'Paulo Marques',
                                          points: '9',
                                        ),
                                        CustomLeaderboardRow(
                                          index: '3',
                                          personImage: AssetImage(
                                            'assets/images/fake_joana_simoes.png',
                                          ),
                                          name: 'Joana Simões',
                                          points: '6',
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                  Text(
                                    'This month, João Maurício is setup to win the challenge you set: ',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.format_quote,
                                            color: Colors.grey[500],
                                            size: 24.0,
                                          ),
                                          const SizedBox(width: 8.0),
                                          Expanded(
                                            child: Text(
                                              '“The winner won’t have to do any chores next week!”',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.grey[500],
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.format_quote,
                                            color: Colors.grey[500],
                                            size: 24.0,
                                            textDirection: TextDirection.rtl,
                                          ),
                                        ],
                                      ),
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
            SizedBox(height: 10.0),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "This week's leaderboard",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 10.0),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CustomLeaderboardRow(
                                          index: '1',
                                          personImage: AssetImage(
                                            'assets/images/fake_joao_mauricio.png',
                                          ),
                                          name: 'João Maurício',
                                          points: '9',
                                        ),
                                        CustomLeaderboardRow(
                                          index: '2',
                                          personImage: AssetImage(
                                            'assets/images/fake_joana_simoes.png',
                                          ),
                                          name: 'Joana Simões',
                                          points: '4',
                                        ),
                                        CustomLeaderboardRow(
                                          index: '3',
                                          personImage: AssetImage(
                                            'assets/images/fake_paulo_marques.png',
                                          ),
                                          name: 'Paulo Marques',
                                          points: '2',
                                        ),
                                      ],
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
            const SizedBox(height: 10.0),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Our house's stats",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                children: [
                                  const SizedBox(height: 10.0),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: "✅ ",
                                            style:
                                                DefaultTextStyle.of(
                                                  context,
                                                ).style,
                                            children: [
                                              TextSpan(
                                                text: "This week:",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: " 15 tasks completed",
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: "📅 ",
                                            style:
                                                DefaultTextStyle.of(
                                                  context,
                                                ).style,
                                            children: [
                                              TextSpan(
                                                text: "This month:",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: " 29 tasks completed",
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: "⏰ ",
                                            style:
                                                DefaultTextStyle.of(
                                                  context,
                                                ).style,
                                            children: [
                                              TextSpan(
                                                text: "Remaining:",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(text: " 7 tasks left"),
                                            ],
                                          ),
                                        ),
                                      ],
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
            const SizedBox(height: 30.0),
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

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(),
            child: Text(
              '$index$suffix',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 20),
          CustomPersonIcon(image: personImage, size: 30),
          const SizedBox(width: 10),
          Text.rich(
            TextSpan(
              text: '$name ',
              style: TextStyle(fontSize: 14.0),
              children: [
                TextSpan(
                  text: '($points) ',
                  style: TextStyle(color: Appcolors.Orange),
                ),
                TextSpan(text: medal),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPersonIcon extends StatelessWidget {
  const CustomPersonIcon({super.key, required this.image, this.size = 40});

  final AssetImage image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Appcolors.GreyBorder, width: 1),
      ),
      child: CircleAvatar(radius: size, backgroundImage: image),
    );
  }
}
