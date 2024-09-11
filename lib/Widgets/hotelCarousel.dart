import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/hotel_model.dart';

class HotelCarousel extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Exclusive Hotels',
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
                    Hotel hotel = hotels[index];
                    return GestureDetector(
                      onTap: (){
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
                                      '${hotel.name}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text('${hotel.address}', style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.grey),),
                                    Text('\$${hotel.price}', style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,),)
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
                                child: ClipRRect(
                                  child: Image.asset(
                                    '${hotel.imageUrl}',
                                    fit: BoxFit.cover,
                                    height: 210,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
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
                  itemCount: hotels.length))
        ],
      ),
    );
  }

}