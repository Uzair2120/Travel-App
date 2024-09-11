import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/destination_model.dart';
import 'package:travel_app/screens/destinationScreen.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Destinations',
                style: GoogleFonts.poppins(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.6),
              ),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    'See All',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  ))
            ],
          ),
          SizedBox(height: 15,),
          Container(
              height: 330,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Destination destination = destinations[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationScreen(destination)));
                      },
                      child: Container(
                        width: 220,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                height: 130,
                                width: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0.0, 2.0),
                                          blurRadius: 6)
                                    ]
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${destination.activities?.length} Activities',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text('${destination.description}', style: GoogleFonts.poppins(
                                        fontSize: 13,
                                    color: Colors.grey),)
                                  ],
                                ),
                              ),
                              bottom: 10,
                            ),
                            Positioned(
                              left: 10,
                              child: Container(
                                // padding: EdgeInsets.symmetric(horizontal: 8),
                                // color: Colors.green,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0.0, 2.0),
                                          blurRadius: 6)
                                    ]),
                                height: 210,
                                width: 200,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Hero(
                                        tag: '${destination.imageUrl}',
                                        child: ClipRRect(
                                          child: Image.asset(
                                            '${destination.imageUrl}',
                                            fit: BoxFit.cover,
                                            height: 210,
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 10,
                                        left: 10,
                                        child: Container(
                                          // color: Colors.yellowAccent,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${destination.city}',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    letterSpacing: -0.6),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons
                                                        .locationArrow,
                                                    color: Colors.white60,
                                                    size: 16,
                                                  ),
                                                  Text(
                                                    '${destination.country}',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white60,
                                                        letterSpacing: -0.6),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 15,
                      ),
                  itemCount: destinations.length))
        ],
      ),
    );
  }
}
