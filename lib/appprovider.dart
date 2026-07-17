import 'package:flutter/material.dart';
import './models/models.dart';

class CartProvider with ChangeNotifier {
  int _cartItemCount = 0;

  int get cartItemCount => _cartItemCount;

  void incrementCartItemCount() {
    _cartItemCount++;
    notifyListeners();
  }

  void decrementCartItemCount() {
    if (_cartItemCount > 0) {
      _cartItemCount--;
      notifyListeners();
    }
  }

  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addCartItem(CartItem item) {
    var exists = cartItems.firstWhere(
      (cartitem) => item.id == cartitem.id,
      orElse: () => CartItem(
        id: "-1",
        name: "null",
        price: 0,
        calories: 0,
        imageUrl: "null",
        count: 0,
      ),
    );
    if (exists.id == "-1") {
      _cartItems.add(item);
    } else {
      exists.count += 1;
    }
    notifyListeners();
  }

  void removeCartItem(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
