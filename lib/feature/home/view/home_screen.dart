import 'package:app_9/feature/cart/Cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cart/view/screen/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getProductCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),),);
        },
          child: Icon(Icons.shopping_cart),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "List of Product",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is ProductGetSuccess) {
              return GridView.builder(
                itemCount: state.listproduct.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 35,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          state.listproduct[index].name,
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: SizedBox(
                              width: 250,
                              height: 250,
                              child: Image(
                                image: NetworkImage(
                                    state.listproduct[index].image),
                                fit: BoxFit.scaleDown,
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                  "Price: \$${state.listproduct[index].price}",
                                style: TextStyle(fontSize: 20),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  CartCubit.get(context).addCartCubit(productId: state.listproduct[index].id);
                                },
                                child: Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.green,
                                  size: 30,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }
            return Center(child:CircularProgressIndicator(),);
          },
        ),
      ),
    );
  }
}
