import 'package:equatable/equatable.dart';

/*This class is used to model the error message returned from the API
  when an error occurs. It contains a single field, `errorMessage`, which
  it will change depending on the API response.
  it is temperary and will be replaced with a more specific error model when
  the API is a correct API.*/
class ErrorMessageModel extends Equatable {
  final String errorMessage;

  const ErrorMessageModel({
    required this.errorMessage,
  });

  // Factory constructor to parse from JSON
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      // Assuming the error message is in the 'message' field of the JSON
      // If the field is not present, default to a generic error message
      errorMessage: json['message'] ?? 'Unknown error occurred',
    );
  }

  @override
  List<Object?> get props => [errorMessage];
}
