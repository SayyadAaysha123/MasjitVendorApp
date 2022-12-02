// To parse this JSON data, do
//
//     final deleteImageResponse = deleteImageResponseFromJson(jsonString);

import 'dart:convert';

List<dynamic> deleteImageResponseFromJson(String str) => List<dynamic>.from(json.decode(str).map((x) => x));

String deleteImageResponseToJson(List<dynamic> data) => json.encode(List<dynamic>.from(data.map((x) => x)));

