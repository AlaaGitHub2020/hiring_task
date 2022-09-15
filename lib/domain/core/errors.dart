import 'package:hiring_task/domain/core/failures.dart';

class NotAuthenticatedError extends Error {}

class UnexpectedValueErrors extends Error {
  final Failure valueFailure;

  UnexpectedValueErrors(this.valueFailure);

  @override
  String toString() {
    const String explanation =
        'Encountered a ValueFailure at an unrecoverable point. Termination.';
    return Error.safeToString("$explanation Failure was: $valueFailure");
  }
}
