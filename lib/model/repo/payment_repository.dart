import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class PaymentRepository {
  final Dio dio;

  PaymentRepository({@required this.dio});
}
