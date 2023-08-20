class PrimaryClass {
  String? img;
  String? name;
  String? type;
  String? description;
  String? timePase;
  bool? isRead;
  PrimaryClass(
    this.img,
    this.name,
    this.type,
    this.description,
    this.timePase,
    this.isRead,
  );
}

List<PrimaryClass> getPrimaryClass = [
  PrimaryClass(
    "img/1p.jpg",
    "Kathrin",
    "Congratulation!",
    "You just win the Email client challenge 2022.",
    "57 m",
    false,
  ),
  PrimaryClass(
    "img/2p.jpg",
    "Leslie Alexander",
    "Design Summit 2022",
    "We are looking for a Senior UX designer to retouch our work.",
    "4 hr",
    false,
  ),
  PrimaryClass(
    "img/3p.jpg",
    "Robert Fox",
    "UX Job Interview",
    "We are looking for a Senior UX designer to retouch our work.",
    "1 day",
    true,
  ),
  PrimaryClass(
    "img/4p.jpg",
    "Work Inquiry from Doug",
    "Design Summit 2022",
    "We are looking for a Senior UX designer to retouch our work.",
    "1 day",
    true,
  ),
];
