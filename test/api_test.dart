import 'package:assessment_by_maimunah_ibrahim/models/user_model.dart';
import 'package:assessment_by_maimunah_ibrahim/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  test('Constructing Service should find correct dependencies', () {
    var apiService = ApiService();
    expect(apiService != null, true);
  });
}
