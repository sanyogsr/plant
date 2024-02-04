import 'package:flutter/material.dart';
import 'package:plant/constants.dart';
import 'package:plant/ui/home_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (val) {
              setState(() {
                _currentIndex = val;
              });
            },
            children: [
              // createPage(image: image, title: title, description: description)
              CreatePage(
                  description: Constants.descriptionOne,
                  image: "assets/images/plant-one.png",
                  title: Constants.titleOne),
              CreatePage(
                  description: Constants.descriptionTwo,
                  image: 'assets/images/plant-two.png',
                  title: Constants.titleTwo),
              CreatePage(
                  description: Constants.descriptionThree,
                  image: "assets/images/plant-three.png",
                  title: Constants.titleThree)
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
              bottom: 60,
              right: 30,
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.primaryColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (_currentIndex < 2) {
                          _currentIndex++;
                          if (_currentIndex < 3) {
                            pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          }
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 24,
                      color: Colors.white,
                    ),
                  )))
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Constants.primaryColor,
          borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (_currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}

class CreatePage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  CreatePage(
      {Key? key,
      required this.description,
      required this.image,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 350,
              child: Image.asset(
                image,
              )),
          SizedBox(
            height: 30,
          ),
          Text(
            "$title",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Constants.primaryColor),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "$description",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class createPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const createPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
