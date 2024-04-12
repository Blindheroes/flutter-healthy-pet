import 'package:healty_pet/models/layanan_model.dart';

class DoctorModel {
  String name;
  String image;
  List<String> services;
  int distance;

  DoctorModel(
      {required this.name,
      required this.image,
      required this.services,
      required this.distance});
}

var doctor = [
  DoctorModel(
      name: "Dr. Stone ",
      image: "Dr. Stone.jpg",
      services: [Layanan.vaccine, Layanan.surgery],
      distance: 10),
  DoctorModel(
      name: "Dr. Stone ",
      image: "Dr. Stone.jpg",
      services: [Layanan.vaccine, Layanan.surgery],
      distance: 10),
  DoctorModel(
      name: "Dr. Stone ",
      image: "Dr. Stone.jpg",
      services: [Layanan.vaccine, Layanan.surgery],
      distance: 10)
];
