import 'package:app_9/feature/cart/model/cart_model.dart';
import 'package:app_9/feature/model/product_model.dart';
import 'package:dio/dio.dart';

class CartData {
  Dio dio = Dio();

  AddCart({required productId}) async {
   await dio.post("https://elwekala.onrender.com/cart/add", data:
   {
     "nationalId": "01056710052789", "productId": productId, "quantity": "1"
   });
  }

  GetCart() async {
    var responce = await dio.get(
      "https://elwekala.onrender.com/cart/allProducts",
      data:
      {
        "nationalId": "01056710052789"
      });
    List repoData = responce.data["products"];
    List<CartModel> listCartModel = repoData
      .map(
        (e) => CartModel.fromjson(e),
      )
      .toList();
    return listCartModel;
  }

  getProduct() async {
    var responce = await dio.get("https://elwekala.onrender.com/product/Laptops");
    List repoData = responce.data["product"];
    List<ProductModel> listProduct = repoData
      .map(
        (e) => ProductModel.fromjson(e),
      )
      .toList();
    return listProduct;
  }

  deletCart({required productId}) async {
    await dio.delete("https://elwekala.onrender.com/cart/delete",
    data:
    {
      "nationalId": "01056710052789",
      "productId": productId,
      "quantity": "1"
    });
  }

  updateCart({required id,required quantity})  {
    dio.put("https://elwekala.onrender.com/cart",
    data:
    {
      "nationalId": "01056710052789",
      "productId": id,
      "quantity": quantity
    });
  }

}
