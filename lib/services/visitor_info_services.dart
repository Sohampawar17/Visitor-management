import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocation/model/visitor_info_model.dart';
import 'package:logger/logger.dart';

import '../constants.dart';

class visitorinfoservices {
  Future<List<Product>> fetchProduct() async {
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Product?fields=["product_name","description", "product_image", "name"]',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(json.encode(response.data));
        List<Product> caneList = List.from(jsonData['data'])
            .map<Product>((data) => Product.fromJson(data))
            .toList();
        return caneList;
      } else {
        Fluttertoast.showToast(msg: "Unable to fetch products");
        return [];
      }
    } catch (e) {
      Logger().e(e);
      Fluttertoast.showToast(msg: "Unauthorized products!");
      return [];
    }
  }

  Future<visitor_information?> getvisitor(String id) async {
    try {
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Visitor Information/$id',
        options: Options(
          method: 'GET',
          headers: {'Authorization': await getTocken()},
        ),
      );

      if (response.statusCode == 200) {
        Logger().i(response.data["data"]);
        return visitor_information.fromJson(response.data["data"]);
      } else {
        // print(response.statusMessage);
        return null;
      }
    } catch (e) {
      Logger().i(e);
      Fluttertoast.showToast(msg: "Error while fetching visitor");
    }
    return null;
  }

  Future<bool> Updatevisitor(visitor_information visitor) async {
    try {
      // var data = json.encode({farmer});
      var dio = Dio();
      var response = await dio.request(
        '$baseurl/api/resource/Visitor Information/${visitor.name.toString()}',
        options: Options(
          method: 'PUT',
          headers: {'Authorization': await getTocken()},
        ),
        data: visitor.toJson(),
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Visitor Updated");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO Visitor!");
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error accoured $e ");
      Logger().e(e);
    }
    return false;
  }

  Future<bool> addvisitor(visitor_information visitor) async {
    var data = json.encode({
      "data": visitor,
    });

    try {
      var dio = Dio();
      var response = await dio.request(
        apiaddvisitor,
        options: Options(
          method: 'POST',
          headers: {'Authorization': await getTocken()},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Visitor Added Successfully");
        return true;
      } else {
        Fluttertoast.showToast(msg: "UNABLE TO add Visitor!");
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error accoured $e ");
      Logger().e(e);
    }
    return false;
  }
}
