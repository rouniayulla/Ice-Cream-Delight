import 'package:equatable/equatable.dart';

/// Base class for all failures.
abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Represents a failure due to offline status.
class OfflineFailure extends Failure {}

/// Represents a failure due to server issues.
class ServerFailure extends Failure {}

/// Represents a failure due to authentication issues.
class AuthenticationFailure extends Failure {}

/// Represents a failure when data is not found.
class DataNotFoundFailure extends Failure {}

/// Represents a failure due to timeout.
class TimeoutFailure extends Failure {}
