import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dental_model.dart';

class DentalService {
  final String baseUrl = 'http://localhost:3000/dentsys-api';

  Future<Dental> addDentalService(Dental dental) async {
    
    const headers = {
      'Content-Type': 'application/json'
    };
    
    try{
      final response = await http.post(
        Uri.parse('$baseUrl/add-dental-history'),
        headers: headers,
        body: jsonEncode(dental.toJson())
      );
      print('response from add dental service: ${response.body}');

      if(response.statusCode == 201) {
        return Dental.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to add dental history: ${response.body}');
      }
    } catch (error) {
      print('error in dental service: $error');
      throw Exception('Error in dental service: $error');
    }
  }

  Future<void> updateDentalService(Dental dental) async {
    const headers = {
      'Content-Type': 'application/json'
    };

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/update-dental-history/${dental.patient_id}'),
        headers: headers,
        body: jsonEncode(dental.toJson())
      );
      // print('response from update dental service: ${response.body}'); // debug line

      if(response.statusCode != 200) {
        throw Exception('Failed to update dental history: ${response.body}');
      }
    } catch (error) {
      print('error in dental service: $error');
      throw Exception('Error in dental service: $error');
    }
  }
}