import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  static const bgURL =
      "https://i.insider.com/5e4448b93b62b76ef829b89c?width=1300&format=jpeg&auto=webp";
  static const smallImageURL =
      "https://i.computer-bild.de/imgs/1/2/3/5/2/4/9/9/Nike-Adapt-BB-2-0-2048x1152-6090794f1680a042.jpg";

  AnimationController _controller;
  Animation<double> _animation;

  double containerHeight = 100;

  static const List<String> shoeSizes = ['6', '7', '8', '9', '10'];
  int selectedShoeSize = 0;

  static const List<String> imageLinks = [
    'https://secureservercdn.net/198.71.233.87/zpz.ef3.myftpupload.com/wp-content/uploads/2020/01/adapt2_cov.jpg',
    'https://s3.amazonaws.com/nikeinc/assets/93394/NikeNews_SP20_BB_Nike_Adapt_BB_2.0_Primary_Hero_Square_01_native_1600.jpg',
    'https://s3.amazonaws.com/nikeinc/assets/93396/NikeNews_SP20_BB_Nike_Adapt_BB_2.0_Detail_Crop_Zoom_Cushioning_01_native_1600.jpg?1579111073',
    'https://s3.amazonaws.com/nikeinc/assets/93399/NikeNews_SP20_BB_Nike_Adapt_BB_2.0_Detail_Crop_Heel_Plate_native_1600.jpg?1579111085',
    'https://s3.amazonaws.com/nikeinc/assets/93395/NikeNews_SP20_BB_Nike_Adapt_BB_2.0_Secondary_Hero_Square_01_native_1600.jpg?1579111069',
    'https://s3.amazonaws.com/nikeinc/assets/93398/NikeNews_SP20_BB_Nike_Adapt_BB_2.0_Detail_Crop_TPU_Yarns_01_native_1600.jpg?1579111083',
  ];

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 8));

    _animation = Tween<double>(begin: -400, end: -150).animate(_controller)
      ..addListener(() {
        setState(() {});
        if (_controller.isCompleted) {
          _controller.forward();
        }
        if (_controller.isDismissed) {
          _controller.forward();
        }
        if (!_controller.isAnimating) {
          _controller.reverse();
        }
      });
    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF160639),
      body: Stack(
        children: <Widget>[
          _animatedBg(_animation, height),
          _nikeLogo(),
          _backButton(),
          Positioned(
              top: height * .2,
              left: 40,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: containerHeight == 500 ? 0 : 1,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text("NIKE",
                          style: TextStyle(color: Colors.white, fontSize: 50)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Adapt",
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.white.withOpacity(.8)),
                      )
                    ]),
              )),
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: containerHeight == 500 ? 0 : 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                      width: 40,
                      child: FlatButton(
                          padding: EdgeInsets.only(
                              left: 0, top: 0, bottom: 0, right: 15),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50))),
                          color: Colors.black.withOpacity(.3),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.white.withOpacity(.5),
                          )),
                    ),
                    SizedBox(
                      height: 80,
                      width: 40,
                      child: FlatButton(
                          padding: EdgeInsets.only(
                              left: 15, top: 0, bottom: 0, right: 0),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(50))),
                          color: Colors.black.withOpacity(.3),
                          child: Icon(Icons.arrow_forward_ios,
                              size: 20, color: Colors.white.withOpacity(.5))),
                    ),
                  ],
                ),
              )),
          AnimatedOpacity(
            duration: Duration(milliseconds: 250),
            opacity: containerHeight == 500 ? 0 : 1,
            child: Center(
              child: Text(
                "BB 2.0",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    containerHeight = containerHeight == 500 ? 100 : 500;
                  });
                },
                child: AnimatedSize(
                  vsync: this,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: Container(
                    height: containerHeight,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20)),
                    child: containerHeight == 500
                        ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: AnimatedOpacity(
                              duration: Duration(seconds: 1),
                              opacity: containerHeight != 500 ? 0 : 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: <Widget>[
                                        Text("NIKE",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30)),
                                        SizedBox(width: 10),
                                        Text(
                                          "Adapt",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontStyle: FontStyle.italic,
                                              color:
                                                  Colors.white.withOpacity(.8)),
                                        )
                                      ]),
                                  SizedBox(height: 20),
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    child: PageView.builder(
                                        controller: PageController(
                                            viewportFraction: 0.7,
                                            initialPage: 1),
                                        scrollDirection: Axis.horizontal,
                                        onPageChanged: (pageIndex) {},
                                        itemCount: imageLinks.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                              margin: const EdgeInsets.only(
                                                  left: 8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.network(
                                                  imageLinks[index],
                                                  fit: BoxFit.cover,
                                                ),
                                              ));
                                        }),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Nike E.A.R.L ( Electric Apaptable Reacting Lacing) is the technology that makes self-lacing shoes possible',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  SizedBox(height: 16),
                                  Text('Select your size',
                                      style: TextStyle(color: Colors.grey)),
                                  SizedBox(height: 16),
                                  Row(
                                    children: shoeSizes.map((size) {
                                      int currentIndex =
                                          shoeSizes.indexOf(size);
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedShoeSize = currentIndex;
                                          });
                                        },
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          margin:
                                              const EdgeInsets.only(left: 8),
                                          decoration: BoxDecoration(
                                              color: selectedShoeSize ==
                                                      currentIndex
                                                  ? Colors.white
                                                  : Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Center(
                                            child: Text(
                                              size,
                                              style: TextStyle(
                                                fontSize: 25,
                                                color: selectedShoeSize ==
                                                        currentIndex
                                                    ? Colors.deepOrange
                                                    : Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  )
                                ],
                              ),
                            ),
                          )
                        : Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset('assets/images/nike.png',
                                        width: 50),
                                    SizedBox(height: 15),
                                    RichText(
                                      text: TextSpan(
                                          text: '\$400 ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' USD',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 10,
                                                ))
                                          ]),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      smallImageURL,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _animatedBg(Animation<double> animation, double height) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    physics: NeverScrollableScrollPhysics(),
    child: Transform.translate(
      offset: Offset(animation.value, 0),
      child: Image.asset(
        "assets/images/sneakers.png",
        fit: BoxFit.cover,
        height: height,
      ),
    ),
  );
}

Widget _backButton() {
  return Padding(
    padding: const EdgeInsets.only(left: 16, top: 32),
    child: SizedBox(
      width: 45,
      height: 45,
      child: FlatButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {},
          color: Colors.white.withOpacity(.1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Icon(Icons.arrow_back_ios, color: Colors.white)),
    ),
  );
}

Widget _nikeLogo() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.only(top: 20),
    child: Column(
      children: <Widget>[
        Image.asset('assets/images/nike.png', width: 50),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text('E.A.R.L',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
        ),
      ],
    ),
  );
}
