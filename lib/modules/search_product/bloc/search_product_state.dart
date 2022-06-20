part of 'search_product_bloc.dart';



abstract class SearchProductState extends Equatable {

   SearchProductState();
  @override
  List<Object> get props => [];
}

class SearchStateEmpty extends SearchProductState {
   SearchStateEmpty();
}

class SearchStateLoading extends SearchProductState {
   SearchStateLoading();
}

class SearchStateSuccess extends SearchProductState {
   SearchStateSuccess({required this.items}) ;
  final List<SearchProduct> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

class SearchStateError extends SearchProductState {
   SearchStateError(this.error) ;

  final String error;

  @override
  List<Object> get props => [error];
}
