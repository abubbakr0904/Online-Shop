import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:qwerty/screens/produts_screen/widgtes/widget.dart';
import 'package:qwerty/utils/images/images.dart';

import '../../data/models/product_model.dart';
import '../../services/local_database.dart';
import '../../services/notification_model.dart';
import '../../view_models/product_view_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          actions: [
            IconButton(
              onPressed: () {
                context.read<ProductsViewModel>().insertProducts(
                  ProductModel(
                    price: 12.5,
                    imageUrl:
                    AppImages.oyoqKiyim,
                    productName: "Nike Jordan",
                    docId: "",
                    productDescription: "productDescription",
                    categoryId: "kcggCJzOEz7gH1LQy44x",
                  ),
                  context,
                );
                LocalNotificationService().showNotification(
                    title: "Qoshildi",
                    body: "Muvaffaqiyatli qoshildi",
                    id: id
                );
                id++;
                _showSnackbar(text: "Qoshildi");
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: const CommunityScreen()
    );
  }
}

_showSnackbar(
{
  required String text
}
    ){
  return Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: Colors.grey,
    textColor: Colors.white,

  );
}