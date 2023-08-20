class Notifi {
  String? title;
  String? img;

  int? noNotifi;
  Notifi(this.title, this.img, this.noNotifi);
}

List<Notifi> getNotifiList = [
  Notifi("Google", "img/search.png", 12),
  Notifi("Outlook", "img/outlook.png", 8),
  Notifi("Apple", "img/mail.svg.png", 0),
  Notifi("Thunderbird", "img/thunderbird-256.png", 0),
  Notifi("Outlook", "img/outlook.png", 0),
];
