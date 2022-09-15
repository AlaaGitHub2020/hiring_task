import 'package:flutter/cupertino.dart';
import 'package:hiring_task/generated/l10n.dart';

abstract class APIError {
  int code;
  String description;

  APIError(this.code, this.description);

  getTranslation(BuildContext context) {}
}

class ExampleError extends APIError {
  ExampleError() : super(1, "DescriptionTheError");

  @override
  getTranslation(BuildContext context) {
    return S.of(context).exampleAPIError;
  }
}
