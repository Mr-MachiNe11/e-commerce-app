import 'package:ecommerce_app/widgets/top_titles.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopTitles(title: 'E-Commerce', subtitle: ''),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Search....'),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categoryList.map((imageUrl) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12.0, left: 12.0),
            child: Text(
              'Top Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              shrinkWrap: true,
                itemCount: topProducts.length,
                scrollDirection: Axis.vertical,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    mainAxisSpacing: 20,crossAxisSpacing: 20),
                itemBuilder: (ctx, index) {
                final singleProduct = topProducts[index];
                return Container(
                  color: Colors.red.withOpacity(0.6),
                  child: Column(
                    children: [
                      Image.network(singleProduct.image,
                      height: 100,width: 100,),


                    ],
                  ),

                );

                  }),
          ),
      ],
    ),
        ));
  }
}

final categoryList = [
//tech
  "https://free-vectors.net/_ph/10/87455441.jpg",
//groceries
  "https://thumbs.dreamstime.com/z/groceries-paper-bag-modern-flat-style-realistic-vector-illustration-isolated-white-background-69723449.jpg?w=768",
//food
  "https://static.vecteezy.com/system/resources/previews/000/964/198/large_2x/fast-food-meal-set-vector.jpg",
//clothing
  "https://d2gg9evh47fn9z.cloudfront.net/1600px_COLOURBOX37214917.jpg",
//book
  "https://img.freepik.com/free-psd/realistic-book-cover-presentation_1310-24.jpg?w=740&t=st=1700927751~exp=1700928351~hmac=bb77298313070be4e99717ce3925834b7b2728344440423bb62f490307a9e4e8",
//cosmetics
  "https://img.freepik.com/free-vector/cosmetic-product-background_1268-1385.jpg?w=740&t=st=1700921599~exp=1700922199~hmac=c7fa1ffea384ced256f5390044d5e544d5690d15d60680b0ffc370a495112821",
//toys
  "https://img.freepik.com/free-vector/font-design-word-toy-shop-with-many-toys-white-background_1308-42186.jpg?w=740&t=st=1700921909~exp=1700922509~hmac=7c5e83628cc9a61e874af7ad7f4f0775ddf7d4232b8cd535a1ed22b4c78627d3",
];

List<ProductModel> topProducts = [
  ProductModel(
    id: '1',
    name: 'Laptop',
    price: '\$999',
    description:
        'With powerful 11th Gen Intel® Core™ processors and NVIDIA® GeForce RTX™ graphics, the IdeaPad Gaming 3i Gen 6 (15" Intel) will help you reach peak gaming potential. Match the pros with pristine, ultrasmooth, and stutterless graphics on the FHD (1920 x 1080) IPS display with up to 165Hz refresh rate, drive harder with 100% N-key rollover on your keyboard, dissipate heat faster with high-performance thermals, and pinpoint your enemies’ location instantly with immersive Nahimic audio.',
    status: 'In Stock',
    isFavourite: false,
    image:
        'https://www.lenovo.com/medias/ideapad-gaming3i-photo1-1-.png?context=bWFzdGVyfHJvb3R8MTM4NTExM3xpbWFnZS9wbmd8aDk2L2g2Mi8xNDk0MTgyNzMzNDE3NC5wbmd8NzY4MDMyMzJlYzViMjkyMTQ0NjUxNDcyYTQ4ZDc4ZWE3ZWZiNGNlYWZjMzZlZDBlNDgzMDBkOTNlNDI4NzMwNg',
  ),
  ProductModel(
    id: '2',
    name: 'Fruits Basket with Pink Carnations',
    price: '\$29.99',
    description:
        'Gift online this Memorable Present of 10 Pink Carnations Basket with 2kg Fresh Fruits Basket and 500gm Assorted Dry Fruits and create an extremely joyful moment for your dear ones.',
    status: 'In Stock',
    isFavourite: false,
    image: 'https://www.indiaflowersgifts.com/images/CMH1310_big.webp',
  ),
  ProductModel(
    id: '3',
    name: 'Veg Pizza Combo',
    price: '\$19.99',
    description:
        'Go classy with our Guiltfree pizza combo of  all time favourites - farm fresh veggie and classic paneer pizza along with zero sugar cola ( 2 units ) and a delicious choco nut dates pudding.',
    status: 'In Stock',
    isFavourite: false,
    image:
        'https://curefoods-images.eatfit.in/tr:w-600,ar-0.8,c_fit//image/singles/eat/meals/COM1152/primary/1_1.jpg',
  ),
  ProductModel(
    id: '4',
    name: 'Stylish Sneakers',
    price: '\$29.99',
    description:
        'Luxury trainer sneakers fashion brand men Designer shoes Genuine leather sneaker Size 36-45 RXkhhy00001',
    status: 'In Stock',
    isFavourite: false,
    image:
        'https://img4.dhresource.com/webp/m/0x0/f3/albu/km/m/30/e2177fa3-e068-4038-8743-3978a0d92534.jpg',
  ),
  ProductModel(
    id: '5',
    name: 'Bestseller Novel',
    price: '\$13.97',
    description:
        'The most popular novel of all time, Don Quixote, is a testament to how great storytelling has no expiration date. The story follows a Hidalgo, Alonso Quixano, who proves that chivalry will, in fact, never die.',
    status: 'In Stock',
    isFavourite: false,
    image:
        'https://bestlifeonline.com/wp-content/uploads/sites/3/2020/10/Don-Quixote-cover.jpg?resize=768,1177&quality=82&strip=all',
  ),
  ProductModel(
    id: '6',
    name: 'Luxury Cosmetic Set',
    price: '\$49.99',
    description:
        'Make up Sets Gift Box suit Lipstick Concealer Eyeshadow palette Setting Powder maquiagem cosmetic makeup kit.',
    status: 'In Stock',
    isFavourite: false,
    image: 'https://ae04.alicdn.com/kf/H5bdb0bea8dab444b94641781a860c3a5L.jpg',
  ),
  ProductModel(
    id: '7',
    name: 'Toys Set',
    price: '\$39.99',
    description: 'Interactive and educational toys',
    status: 'In Stock',
    isFavourite: false,
    image: 'https://m.media-amazon.com/images/I/81K96s61uaL._AC_SL1500_.jpg',
  ),
  ProductModel(
    id: '8',
    name: 'Google-Pixel 8 128GB (Unlocked)-Obsidian',
    price: '\$699',
    description: 'High-performance smartphone with advanced features',
    status: 'In Stock',
    isFavourite: false,
    image:
        'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6559/6559236_sd.jpg;maxHeight=640;maxWidth=550',
  ),
  ProductModel(
    id: '9',
    name: 'Baby Dress',
    price: '\$39.99',
    description: "BABY FASHIONABLE DRESS (WHITE & BABY PINK)- 0 TO 3 YEAR'S",
    status: 'In Stock',
    isFavourite: false,
    image: 'https: //www.saffron.com.bd/images/detailed/206/10_ft7z-7w.jpg',
  ),
// Add more products as needed
];
