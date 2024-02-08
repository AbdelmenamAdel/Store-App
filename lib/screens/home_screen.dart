import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/models/product_model.dart';
import 'package:store_app/core/services/get_all_categoris.dart';
import 'package:store_app/core/services/get_all_product_servise.dart';
import 'package:store_app/core/widgets/custom_cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Trend',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.cartPlus),
          ),
          SizedBox(
            width: 5.w,
          )
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 60, bottom: 16),
        child: FutureBuilder<List<ProductModel>>(
            future: AllProductServises().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 75,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.4, // Height : Width
                  ),
                  itemBuilder: (context, index) => CustomCart(
                    product: products[index],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
