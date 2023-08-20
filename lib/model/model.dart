class Model {
  String? img;
  String? title;
  String? subtitle;
  bool? isSelected;
  Model(this.img, this.title, this.subtitle, this.isSelected);
}

List<Model> getModel = [
  Model(
    "img/1.jpg",
    "Encrypted And Reliable Email Client Service",
    "Our products are open source & they have been independently audited by thousands of experts around the world.",
    true
  ),
  Model(
    "img/2.jpg",
    "Encrypted And Reliable Email Client Service",
    "Our products are open source & they have been independently audited by thousands of experts around the world.",
    true
  ),
];
