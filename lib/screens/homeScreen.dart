import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/Widgets/destinationCarousel.dart';
import 'package:travel_app/Widgets/hotelCarousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  var currentTab =0;
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(
              'What would you like to find?',
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.7),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 34,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Theme.of(context).hintColor
                            : Color(0xffe7ebee),
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      icons[index],
                      size: 25,
                      color: selectedIndex == index
                          ? Theme.of(context).primaryColor
                          : Color(0xffb4c1c4),
                    ),
                  ),
                );
              },
              itemCount: icons.length,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          DestinationCarousel(),
          SizedBox(
            height: 20,
          ),
          HotelCarousel(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: currentTab,
          onTap: (int index){
            setState(() {
              currentTab = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.search,
                  size: 25,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.pizzaSlice,
                  size: 25,
                ),
                label: ''),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-55958-614810.jpg&fm=jpg', ),
              ),
              label: '',
            ),
          ]),
    );
  }
}
