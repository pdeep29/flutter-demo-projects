import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expieryDate;
  late String _userId;

  Future<void> _authentication(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCQwqQK3JY6Lng14reZsrbFnAcqSsMOmNI');
    // var returnSecureToken;
    try {
      final response = await http.post(url,
          body: jsonEncode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      final responseData = jsonDecode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
    // print(jsonDecode(response.body));
  }

  Future<void> signup(String email, String password) async {
    return _authentication(email, password, 'signUp');
    // final url = Uri.parse(
    //     'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCQwqQK3JY6Lng14reZsrbFnAcqSsMOmNI');
    // // var returnSecureToken;
    // final response = await http.post(url,
    //     body: jsonEncode(
    //         {'email': email, 'password': password, 'returnSecureToken': true}));
    // print(jsonDecode(response.body));
  }

  Future<void> logIn(String email, String password) async {
    return _authentication(email, password, 'signInWithPassword');
    // final url = Uri.parse(
    //     '  https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCQwqQK3JY6Lng14reZsrbFnAcqSsMOmNI');
    // // var returnSecureToken;
    // final response = await http.post(url,
    //     body: jsonEncode(
    //         {'email': email, 'password': password, 'returnSecureToken': true}));
    // print(jsonDecode(response.body));
  }
}
