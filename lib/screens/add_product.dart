import 'package:flutter/material.dart';
import 'package:store_app/core/services/get_all_categoris.dart';
import 'package:store_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomTextFormField(
                hintText: 'Product name ..............',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Price ...........',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Description .............',
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<List<dynamic>>(
                  future: AllCategoriesServises().getCategoriesServise(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      String selectedItem = 'wifi connection error';
                      void changeItem(item) {
                        selectedItem = item;
                      }

                      List<dynamic> product = snapshot.data!;
                      return DropdownButtonFormField<dynamic>(
                        hint: const Text("choosse the category ........"),
                        items: product
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        value: selectedItem,
                        onChanged: (data) {
                          setState(() {
                            changeItem(data);
                          });
                        },
                      );
                    } else {
                      return DropdownButtonFormField(
                        items: const [],
                        onChanged: (value) {},
                      );
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Image url ..............',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'rate ........',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'count ........',
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                minWidth: double.infinity,
                height: 48.w,
                child:
                    const Text('Update', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
