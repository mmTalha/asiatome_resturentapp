import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/screen4.dart';
import 'package:untitled3/widgets/widgets.dart';

final List<String> imgList = [
  'assets/bg.png',
  'assets/Rectangle.png',
  'assets/bg.png',
  'assets/bg.png',
  ];
class screen3 extends StatefulWidget {
  const screen3({Key? key}) : super(key: key);

  @override
  _screen3State createState() => _screen3State();
}

class _screen3State extends State<screen3> {
  int _current = 0;
  final CarouselController _controller = CarouselController();



  final List<Widget> imageSliders = imgList.map((item) => Container(
    child: Container(
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: Image(image: AssetImage(item),width: 2000,height: 185,fit: BoxFit.cover),
    ),
  )))
      .toList();

  @override
  Widget build(BuildContext context) {
    List a = [
      "assets/Rice.png",
      "assets/Rice.png",
      "assets/Noodles.png",
      "assets/Rice.png",
      "assets/Noodles.png",
      "assets/Rice.png",
      "assets/Noodles.png",
      "assets/Rice.png",
    ];
    List b = [
      "Rice",
      "Noodles",
      "Snacks",
      "Healthy",
      "Fast Food",
      "Drink",
      "Snacks",
      "Sea Food",];
    List items=[
      "assets/bg.png",
      "assets/bg.png",
      "assets/bg.png",
      "assets/bg.png",
      "assets/bg.png",
      "assets/bg.png",
      "assets/bg.png",
      "assets/bg.png",
    ];


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(
          Icons.room,
          color: Color(0xFFC61820),
        ),
        title: Text('17230 NE Sacramento Street',
          style: TextStyle(color: Colors.grey,
          fontSize: 16.0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(

        child: Container(

          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 30.0,bottom: 20.0,top: 15.0),
                child: Container(
                  height: 50,
                  child: TextField(
                    decoration: new InputDecoration(
                    hintText: 'Search food nearby',
            prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 50.0,right: 20.0),
                child: Icon(Icons.search,color: Color(0xFF4F4F4F),),
            ),
            hintStyle: TextStyle(color: Colors.black38,fontSize: 16.0,
            fontFamily: 'Roboto' ),
            filled: true,
            fillColor: Color(0xFFF3F3F3),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Color(0xFFF3F3F3),width: 0),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Color(0xFFF3F3F3), width: 0),
                    ),
                  ),
                  )
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Column(children: [
                      CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : Color(0xFFBC1C23))
                                      .withOpacity(_current == entry.key ? 0.8 : 0.1)),
                            ),
                          );
                        }).toList(),
                      ),
                    ]),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text('Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,fontSize:24.0,
                ),),
              ),


              Container(
                height: 200,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: false,
                  crossAxisCount: 4,
                  children:  List<Widget>.generate(8, (index) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child:  Container(
                        margin: EdgeInsets.all(13.0),
                        child: Padding(

                          padding: EdgeInsets.only(left: 3.0,top: 3.0),
                          child: Text(b[index],
                            style: TextStyle(color: Colors.white, fontSize: 8,fontWeight: FontWeight.bold),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration:   BoxDecoration(
                            image: DecorationImage(image: AssetImage(a[index]))

                        ),),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text('Stories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,fontSize:24.0,
                  ),),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    widgets().Stories("assets/Ellipse.png", 'Food'),
                    widgets().Stories("assets/Ellipse2.png", 'Drink'),
                    widgets().Stories("assets/Ellipse.png", 'Cake'),
                    widgets().Stories("assets/Ellipse2.png", 'Fast Food'),
                    widgets().Stories("assets/Ellipse.png", 'Food'),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 12.0,top: 12.0),
                child:InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              screen4()),
                    );

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('National Favoirites',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize:24.0,
                        ),),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text('See all',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.red
                        ),),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 2200.0,
                //height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:13,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (2 / 3.5),
                  ),
                  itemBuilder: (context,index,) {
                    return Container(
                      child: Column(

                        children: [
                          grid().grid1(context),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
