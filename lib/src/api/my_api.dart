import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:twitsam/src/utils/dialogs.dart';

class MyApi {
  final Dio _dio = new Dio();

  Future<void> register(
      {String username, String email, String password}) async {
    try {
      final Response response =
          await this._dio.post('https://twitsam.herokuapp.com/registro', data: {
        "email": email,
        "password": password,
        "nombre": username,
      });

      if (response.statusCode == 200) {
        print('Nuevo registro ${response.data}');
      }
    } catch (e) {
      print(e);
      if (e is DioError) {
        print(e.response.statusCode);
        print(e.request.data);
      }
    }
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final Response response = await this._dio.post(
          'https://twitsam.herokuapp.com/login',
          data: {"email": email, "password": password});

      if (response.statusCode == 201) {
        print('Login Correcto');
        print(response.data);
        progressDialog.dismiss();
      }
    } catch (e) {
      progressDialog.dismiss();
      print(e);
      if (e is DioError) {
        print(e.response.statusCode);
        print(e.request.data);
        Dialogs.info(context, 'Error', e.message);
      } else {
        print(e);
      }
    }
  }
}
