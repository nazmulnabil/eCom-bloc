part of 'search_product_bloc.dart';



abstract class SearchProductState extends Equatable {

   SearchProductState();
   bool hasReachedMax=false;
  @override
  List<Object> get props => [];
}

class SearchStateEmpty extends SearchProductState {
   SearchStateEmpty();
}

class SearchStateLoading extends SearchProductState {
   SearchStateLoading();
}

// class FetchingNextPage extends SearchProductState {
//   FetchingNextPage();
// }

class SearchStateSuccess extends SearchProductState {
   SearchStateSuccess(  { this.items=const<SearchProduct>[], this.hasReachedMax=false,}) ;
  final List<SearchProduct> items;
  final bool hasReachedMax;


   SearchStateSuccess copyWith({

     List<SearchProduct>? items,
     bool? hasReachedMax,
   }) {
     return SearchStateSuccess(
       items: items ?? this.items,
       hasReachedMax: hasReachedMax ?? this.hasReachedMax,
     );
   }


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
