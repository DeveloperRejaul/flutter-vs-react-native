import 'package:flutter/material.dart';

class ShopAppProvider extends ChangeNotifier {
  final List<Map<String, Object>> cards = [];

  List<Map<String, Object>> get getCarts => cards;

  void addCard(Map<String, Object> card) {
    cards.add(card);
    notifyListeners();
  }

  void removeCard(Map<String, Object> card) {
    cards.remove(card);
    notifyListeners();
  }
}
