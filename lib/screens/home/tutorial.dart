import 'dart:io';
import 'package:alzhelp/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

class Tutorial extends StatefulWidget {
  @override
  _Tutorial createState() => _Tutorial();
}

class _Tutorial extends State<Tutorial> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              SlideTile(
                imagePath: mySLides[0].getImageAssetPath(),
                title: mySLides[0].getTitle(),
                desc: mySLides[0].getDesc(),
              ),
              SlideTile(
                imagePath: mySLides[1].getImageAssetPath(),
                title: mySLides[1].getTitle(),
                desc: mySLides[1].getDesc(),
              ),
              SlideTile(
                imagePath: mySLides[2].getImageAssetPath(),
                title: mySLides[2].getTitle(),
                desc: mySLides[2].getDesc(),
              ),
              SlideTile(
                imagePath: mySLides[3].getImageAssetPath(),
                title: mySLides[3].getTitle(),
                desc: mySLides[3].getDesc(),
              ),
              SlideTile(
                imagePath: mySLides[4].getImageAssetPath(),
                title: mySLides[4].getTitle(),
                desc: mySLides[4].getDesc(),
              )
            ],
          ),
        ),
        bottomSheet: slideIndex != 4
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, 'wrapper');
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "SKIP",
                        style: TextStyle(color: Color(0xFF0074E4), fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            i == slideIndex
                                ? _buildPageIndicator(true)
                                : _buildPageIndicator(false),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        print("this is slideIndex: $slideIndex");
                        controller.animateToPage(slideIndex + 1,
                            duration: Duration(milliseconds: 500), curve: Curves.linear);
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "NEXT",
                        style: TextStyle(color: Color(0xFF0074E4), fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: () {
                  Navigator.pop(context);
                  print("Get Started Now");

                  Navigator.pushNamed(context, 'wrapper');
                },
                child: Container(
                  height: Platform.isIOS ? 70 : 60,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    "GET STARTED NOW",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath),
          SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              fontFamily: 'ag',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: 'ag',
              ))
        ],
      ),
    );
  }
}

// class Main extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

//This is where the data for sliders is managed

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
      "Welcome to Alz-Help,which is a dementia test app and is found to be 95-percent effective at identifying persons with memory challenges. \n It does not require a doctor.\n It is based on standardized SAGE and MOCA Tests. ");
  sliderModel.setTitle("Alz-Help");
  sliderModel.setImageAssetPath("assets/brain.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "We have deliberately kept the test simple.\n If you have experience in dealing with cell phones or tablets you can perform the test yourself.Otherwise you should get help from a support person who has experience in using mobile.\n\n The Quiz consists of 26 MCQ questions with 60 seconds for each question. ");
  sliderModel.setTitle("Instructions");
  sliderModel.setImageAssetPath("assets/illus1.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Please perform the test in quiet and trouble-free environment.\n Please allow about 15 mins to take the test,in which you are unlikely to be distracted. \n Please carry out the test as quickly as possible.");
  sliderModel.setTitle("Instructions");
  sliderModel.setImageAssetPath("assets/care.png");
  slides.add(sliderModel);

//4
  sliderModel = new SliderModel();

  sliderModel.setDesc(
      "When you are done with all the entries.You will be informed about your test result");
  sliderModel.setTitle("Instructions");
  sliderModel.setImageAssetPath("assets/grade-sheet.png");
  slides.add(sliderModel);

  //4
  sliderModel = new SliderModel();

  sliderModel.setDesc("You are all set to begin");
  sliderModel.setTitle("All the Best");
  sliderModel.setImageAssetPath("assets/illustration3.png");
  slides.add(sliderModel);

  return slides;
}
