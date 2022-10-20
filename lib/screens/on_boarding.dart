import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/screens/home.dart';
import 'package:masjit_vendor_app/screens/registration.dart';
import 'package:masjit_vendor_app/utils/constant.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentIndex = 0;

  PageController _pageController = PageController();

  final _frames = [
    {
      'image': "https://cdn.pixabay.com/photo/2015/10/25/21/02/abu-1006336__340.jpg",
      'heading': "",
      'description':
          'This app user for Islamic timetable of masjids.',
    },
    {
      'image': "https://images.unsplash.com/photo-1590273089302-ebbc53986b6e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bW9zcXVlfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      'heading': "",
      'description':
          'You can always update,edit prayer timings. Eid of Muslims to be edit according to the Islamic Calender',
    },
    {
      'image': "https://cdn.pixabay.com/photo/2015/01/28/23/10/mosque-615415_960_720.jpg",
      'heading': "",
      'description':
          'Molvi Can Locate their accurate masjid location for the user',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    complete() {

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Registration()));
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .7,
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _frames.length,
                onPageChanged: (value) => setState(() {
                  _currentIndex = value;
                }),
                itemBuilder: (context, index) {
                  return Frame(
                    image: _frames[index]['image'] ?? 'img',
                    heading: _frames[index]['heading'] ?? '',
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
            Container(
              color: Colors.transparent,
              width: 90,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  _currentIndex < (_frames.length - 1)
                      ? _pageController.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn)
                      : complete();
                },
                child: Text(_currentIndex < (_frames.length -1) ? 'Next' : 'Done'),
              ),
            ),
            TextButton(
              onPressed: complete,
              child: const Text('Skip'),
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child:Image.network(
                image,
                fit: BoxFit.cover,

              ),
            ) ,
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
