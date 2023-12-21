import 'package:ecommerce_app/widgets/single_favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    final favouriteProductList = appProvider.getFavouriteProductList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: favouriteProductList.isEmpty
          ? const Center(
              child: Text('Empty'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: favouriteProductList.length,
              itemBuilder: (context, index) {
                return SingleFavouriteItem(
                    singleProduct: favouriteProductList[index]);
              },
            ),
    );
  }
}
