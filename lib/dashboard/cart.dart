import 'package:easyapp/appprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(2, 6, 22, 1),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: 36,
          ),
          child: Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              final cartItems = cartProvider.cartItems;
              if (cartItems.isEmpty) {
                return const Center(
                  child: Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }

              // return ListView.builder(
              //   itemCount: cartItems.length,
              //   itemBuilder: (context, index) {
              //     final item = cartItems[index];
              //     return ListTile(
              //       title: Text(item),
              //       subtitle: Text('Quantity: ${item}'),
              //       trailing: Text('\$${item}'),
              //     );
              //   },
              // );
              return ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Slidable(
                    key: ValueKey(item),
                    endActionPane: ActionPane(
                      extentRatio: 0.25,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            cartProvider.removeCartItem(cartItems[0]);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    cartItems[index].imageUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItems[index].name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    cartItems[index].calories.toString() +
                                        " Cal",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '\$${cartItems[index].price.toStringAsFixed(2)} / Kg',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  cartProvider.incrementCartItemCount();
                                },
                                icon: const Icon(Icons.add),
                              ),
                              Text(
                                cartProvider.cartItemCount.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                onPressed: () {
                                  cartProvider.decrementCartItemCount();
                                },
                                icon: const Icon(Icons.remove),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
