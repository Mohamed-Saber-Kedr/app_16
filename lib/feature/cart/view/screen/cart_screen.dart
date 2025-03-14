import 'package:app_9/feature/cart/Cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartGetSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Carts"),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: state.listCart.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 15,
                  color: Colors.grey.shade200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: NetworkImage(state.listCart[index].image),
                      ),
                      IconButton(onPressed: () {
                        CartCubit.get(context).deletCartCubit(productId: state.listCart[index].id);
                      }, icon: Icon(Icons.delete),),
                      Padding(padding: EdgeInsets.all(30),child: Row(
                        children: [
                          Text(state.listCart[index].quantity.toString()),
                          SizedBox(width: 30,),
                          SizedBox(
                            width: 20,
                            child: TextField(
                              controller: controller,
                            ),
                          ),
                          SizedBox(width: 30,),
                          IconButton(onPressed: () {
                           setState(() {
                             CartCubit.get(context).updateCartCubit(id: state.listCart[index].id, quantity: controller.text);
                           });
                          }, icon: Icon(Icons.update_outlined),),
                        ],
                      ),),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(semanticsLabel: "123",),
        );
      },
    );
  }
}
