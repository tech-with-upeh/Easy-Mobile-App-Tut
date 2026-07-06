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
    _cartItems.add(item);
    notifyListeners();
  }

  void removeCartItem(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
