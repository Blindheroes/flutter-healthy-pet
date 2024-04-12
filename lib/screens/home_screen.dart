import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:healty_pet/models/doctor_model.dart';
import 'package:healty_pet/models/layanan_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

var selectedService = 0;

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var menus = [
    FeatherIcons.home,
    FeatherIcons.heart,
    FeatherIcons.messageSquare,
    FeatherIcons.user
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 22,
            ),
            _greetings(),
            const SizedBox(
              height: 16,
            ),
            _heroCard(),
            const SizedBox(
              height: 20,
            ),
            _search(),
            const SizedBox(
              height: 20,
            ),
            _services(),
            const SizedBox(
              height: 27,
            ),
            _doctors()
          ],
        ),
      )),
    );
  }

  SizedBox _bottomNavigationBar() {
    return SizedBox(
      child: BottomNavigationBar(
        selectedItemColor: const Color(0xFF818AF9),
        type: BottomNavigationBarType.fixed,
        items: menus
            .map((e) =>
                BottomNavigationBarItem(icon: Icon(e), label: e.toString()))
            .toList(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: const Color(0xFFBFBFBF),
      ),
    );
  }

  ListView _doctors() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => _doctor(doctor[index]),
        separatorBuilder: (context, index) => const SizedBox(
              height: 11,
            ),
        itemCount: doctor.length);
  }

  Container _doctor(DoctorModel doctorModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: const Color(0xFF35385A).withOpacity(.12),
                blurRadius: 30,
                offset: const Offset(0, 2))
          ]),
      child: Row(children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.asset(
            'assets/images/${doctorModel.image}',
            width: 88,
            height: 103,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorModel.name,
                style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3F3E3F)),
              ),
              const SizedBox(
                height: 7,
              ),
              RichText(
                  text: TextSpan(
                      text: "Service: ${doctorModel.services.join(', ')}",
                      style: GoogleFonts.manrope(
                          fontSize: 12, color: Colors.black))),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  const Icon(
                    FeatherIcons.mapPin,
                    size: 14,
                    color: Color(0xFFACA3A3),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text("${doctorModel.distance}km",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: const Color(0xFFACA3A3),
                      ))
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Text(
                    "Available for",
                    style: GoogleFonts.manrope(
                        color: const Color(0xFF50CC98),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/svgs/cat.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset('assets/svgs/dog.svg'),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }

  SizedBox _services() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: selectedService == index
                        ? const Color(0xFF818AF9)
                        : const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(5),
                    border: selectedService == index
                        ? Border.all(
                            color: const Color(0xFFF1E5E5).withOpacity(.22),
                            width: 2)
                        : null),
                child: Center(
                    child: Text(Layanan.all()[index],
                        style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: selectedService == index
                                ? Colors.white
                                : const Color(0xFF3F3E3F).withOpacity(.3)))),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 5,
              ),
          itemCount: Layanan.all().length),
    );
  }

  Padding _search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: TextFormField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(FeatherIcons.search),
            hintText: "Find best vacinnate, threatment ...",
            hintStyle: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFCACACA),
                height: 150 / 100)),
      ),
    );
  }

  AspectRatio _heroCard() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 22.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFF818AF9),
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_card.png',
              fit: BoxFit.cover,
              height: double.maxFinite,
              width: double.maxFinite,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Your ",
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              color: const Color(0xFFDEE1FE),
                              height: 150 / 100),
                          children: const [
                        TextSpan(
                            text: "Catrine ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                        TextSpan(text: "will get\nvaccination "),
                        TextSpan(
                            text: "tomorrow \nat 07.00 am!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                      ])),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.4),
                        border: Border.all(
                            color: Colors.white.withOpacity(.5), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("See details!",
                        style: GoogleFonts.manrope(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _greetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello, Human!",
            style: GoogleFonts.manrope(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF3F3E3F)),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(FeatherIcons.shoppingBag),
                color: const Color(0xFF818AF9),
              ),
              Positioned(
                right: 4,
                top: 6,
                child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: const Color(0xFFEF6497),
                        borderRadius: BorderRadius.circular(15 / 2)),
                    child: Center(
                        child: Text(
                      "2",
                      style: GoogleFonts.mPlus1(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ))),
              )
            ],
          )
        ],
      ),
    );
  }
}
