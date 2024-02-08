import 'package:flutter/material.dart';
import 'package:store_app/core/models/product_model.dart';
import 'package:store_app/core/services/update_product.dart';
import 'package:store_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key, required this.product});
  ProductModel product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? title;
  String? desc;
  String? price;
  String? image;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk    ${widget.product.category}');
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                CustomTextFormField(
                    hintText: 'title', onChange: (data) => title = data),
                SizedBox(height: 10.h),
                CustomTextFormField(
                    hintText: 'Description', onChange: (data) => desc = data),
                SizedBox(height: 10.h),
                CustomTextFormField(
                    hintText: 'price',
                    keyboardType: TextInputType.number,
                    onChange: (data) => price = data),
                SizedBox(height: 10.h),
                CustomTextFormField(
                    hintText: 'image', onChange: (data) => image = data),
                SizedBox(height: 25.h),
                MaterialButton(
                  onPressed: () {
                    isLoading = true;
                    setState(() {});
                    updateProduct(widget.product);
                    try {} catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                  color: Colors.blue,
                  minWidth: double.infinity,
                  height: 48.w,
                  child: const Text('Update',
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateProduct(ProductModel product) {
    UpdateProductService().updateProduct(
      title: title == null ? product.title : title!,
      price: price == null ? product.price.toString() : price!,
      desc: desc == null ? product.description : desc!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
