part of 'search_product_bloc.dart';
abstract class SearchProductEvent extends Equatable {
  const SearchProductEvent();
  @override
  List<Object> get props => [];
}

class TextChanged extends SearchProductEvent {
  const TextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}

class OnNextPage extends SearchProductEvent {
 // final String query;


  const OnNextPage(
    //  this.query,
      );

  @override
  List<Object> get props => [];
}

