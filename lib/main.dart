import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants/models/beach.dart';
import 'package:plants/models/popular.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'models/recommendation.dart';
import 'navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

var height,width;

class _HomeState extends State<Home> {
  //page controller
  final _pageController = PageController(viewportFraction: 0.877);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      bottomNavigationBar: BottomNavigationBarTravel(),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              //Navigation Drawer & search button
              Container(
                height: 57.6,
                margin: EdgeInsets.only(left: 28.8,right: 28.8,top: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.6),
                      color: Color(0x080a0928)),
                      child: Icon(Icons.format_align_left),
                    ),
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.6),
                          color: Color(0x080a0928)),
                      child: Icon(Icons.search),
                    ),
                  ],
                ),
              ),
              //title
              Padding(
                padding: EdgeInsets.only(top: 30,left: 28.8),
                child: Text('Top Contents',style: GoogleFonts.lato(
                  fontSize: 30.6,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),),
              ),
              //custom tabbar
              Container(
                margin: EdgeInsets.only(left: 14.4,top: 28.8),
                height: 40,
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                    indicatorColor: Colors.blueGrey,
                    labelPadding: EdgeInsets.only(left: 14.4,right: 14.4),
                    indicatorPadding: EdgeInsets.only(left: 14.4,right: 14.4),
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.blueGrey,
                    labelStyle: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    tabs: [
                      Tab(
                        child: Container(child: Text('Recommended')),
                      ),
                      Tab(
                        child: Container(child: Text('Popular')),
                      ),
                      Tab(
                        child: Container(child: Text('New Destination')),
                      ),
                      Tab(
                        child: Container(child: Text('Hidden Gems')),
                      ),
                    ],
                  ),
                ),
              ),
              //listview with pageview
              Container(
                height: 180,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(recommendations.length, (index) => Container(
                    margin: EdgeInsets.only(right: 28.8),
                    width: 300,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.6),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(recommendations[index].image),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.8),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 19.2,
                              sigmaY: 19.2,
                            ),
                            child: Container(
                              height: 36,
                              padding: EdgeInsets.only(left: 16.72,right: 14.4),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 9.52,),
                                  Text(recommendations[index].name,style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.2,
                                    color: Colors.white,
                                  ),),
                                ],
                              ),
                            ),
                          ),
                        ),),
                      ],
                    ),
                  )),
                ),
              ),
              //dots
              Padding(
                padding: EdgeInsets.only(left: 28.8,top: 28.8),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: recommendations.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.blueGrey,
                    dotColor: Colors.white,
                    dotHeight: 5.8,
                    dotWidth: 15,
                    spacing: 4.8,
                  ),
                ),

              ),
              //text for populer Catagories
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 30,left: 28.8,right: 28.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Catagories',style:GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),),
                      Text('Show all',style:GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.blueGrey,
                      ),),
                    ],
                  ),
                ),
              ),
              //listview for popular
              Container(
                margin: EdgeInsets.only(top: 30),
                height: 45.6,
                child: ListView.builder(
                    itemCount: populars.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 28.8,right: 9.6),
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.only(right: 19.2),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: Color(populars[index].color),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 19.2,),
                            Image.asset(
                              populars[index].image,height: 16.8,),
                            SizedBox(width: 19.2,),
                          ],
                        ),
                      );
                }),
              ),
              //listview for beach
              Container(
                margin: EdgeInsets.only(top: 28.8,bottom: 16.8),
                height: 124.8,
                child: ListView.builder(
                  itemCount: beaches.length,
                    padding: EdgeInsets.only(left: 28.8,right: 12),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                    return Container(
                      height: 124.8,
                      width: 188.4,
                      margin: EdgeInsets.only(right: 16.8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(beaches[index].image),
                        )
                      ),
                    );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

