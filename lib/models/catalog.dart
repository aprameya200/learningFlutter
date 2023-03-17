class CatalogModel {
  //class to save and store containing list of items
  final items = [
    Item(
        id: 1,
        name: "Apple AirPods 3",
        desc: "Airpods are the best for listening to music",
        price: 200,
        color: "White",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/d/d2/AirPods_3rd_generation.jpg"),
    Item(
        id: 2,
        name: "Samsung Galaxy S23",
        desc: "Make everyday epic. Introducing Galaxy S22 and S22+ .",
        price: 700,
        color: "Green",
        image:
            "https://image-us.samsung.com/us/smartphones/galaxy-s22/images/gallery/R0-Green/FLRC-214-R0-Green-01-PDP-GALLERY-1600x1200.jpg")
  ];

  int getItemLength() {
    return this.items.length;
  }
}

class Item {
  //class to specify item
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
