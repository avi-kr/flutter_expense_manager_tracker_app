import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Cardmodel.dart';

class CardProvider with ChangeNotifier {
  List<CardModel> cards = [];

  void initialState() {
    syncDataWithProvider();
  }

  void addCard(CardModel _card) {
    cards.add(_card);
    updateSharedPrefrences();
    notifyListeners();
  }

  void remove(CardModel _card) {
    cards.removeWhere((card) => card.number == _card.number);

    updateSharedPrefrences();

    notifyListeners();
  }

  int getCardLength() {
    return cards.length;
  }

  Future updateSharedPrefrences() async {
    List<String> myCards = cards.map((f) => jsonEncode(f.toJson())).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('cards', myCards);
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getStringList('cards');

    if (result != null) {
      cards = result.map((f) => CardModel.fromJson(jsonDecode(f))).toList();
    }

    notifyListeners();
  }
}
