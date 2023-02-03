class HomeModel {
  String? title, description, category, image, menu;
  num? id, price;
  int? qua = 1;
  Rating? r1;

  HomeModel(
      {this.title,
      this.description,
      this.category,
      this.image,
      this.menu,
      this.id,
      this.qua = 1,
      this.price,
      this.r1});

  HomeModel jsonFrom(Map m1) {
    Rating r2 = Rating().fromJson(m1['rating']);
    return HomeModel(
        title: m1['title'],
        category: m1['category'],
        image: m1['image'],
        price: m1['price'],
        description: m1['description'],
        id: m1['id'],
        r1: r2);
  }
}

class Rating {
  num? rate, count;

  Rating({this.rate, this.count});

  Rating fromJson(Map m1) {
    return Rating(count: m1['count'], rate: m1['rate']);
  }
}
