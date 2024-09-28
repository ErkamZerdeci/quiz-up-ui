class Response<T> {
  final int statusCode;
  final T? data;

  Response({required this.statusCode, this.data});
}