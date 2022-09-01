import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/screens/home.dart';
import 'package:masjit_vendor_app/screens/registration.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentIndex = 0;
  final _frames = [
    {
      'image': '',
      'heading': 'Frame 1',
      'description':
          'Lorem Ipsum is simply dummy description of the printing and typesetting',
    },
    {
      'image': '',
      'heading': 'Frame 2',
      'description':
          'Lorem Ipsum is simply dummy description of the printing and typesetting',
    },
    {
      'image': '',
      'heading': 'Frame 3',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting',
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .7,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _frames.length,
                onPageChanged: (value) => setState(() {
                  _currentIndex = value;
                }),
                itemBuilder: (context, index) {
                  return Frame(
                    image: _frames[index]['image'] ?? 'img',
                    heading: _frames[index]['heading'] ?? 'he',
                    description: _frames[index]['description'] ?? 'desc',
                  );
                },
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _frames.length; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                    width: _currentIndex == i ? 21 : 7,
                    height: 7,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _currentIndex == i
                            ? Colors.green[900]
                            : Colors.grey[300]),
                  )
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              child: const Text('Buttoon'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Registration(),
                  ),
                );
              },
              child: const Text('Buttoon'),
            )
          ],
        ),
      ),
    );
  }
}

class Frame extends StatelessWidget {
  const Frame({
    Key? key,
    required this.image,
    required this.heading,
    required this.description,
  }) : super(key: key);

  final String heading;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * .1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(218, 109, 113, 136),
              borderRadius: BorderRadius.circular(30),
            ),
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width * .7,
          ),
          Text(
            heading,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
