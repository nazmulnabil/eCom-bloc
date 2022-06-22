import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../data/models/search_product.dart';
import '../../data/repositories/search_product_repository_interface.dart';


part 'search_product_event.dart';
part 'search_product_state.dart';


const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  int offset=10;
  int limit=10;
  bool hasReachedMax=false;
  late String inputText;
  SearchProductBloc({required this.searchProductRepository})
      : super( SearchStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
    on<OnNextPage>(_onNextPage, transformer: debounce(_duration));
  }

  final SearchProductRepository searchProductRepository;

  void _onTextChanged(

      TextChanged event,
      Emitter<SearchProductState> emit,
      ) async {
    final searchTerm = event.text;
    final state=this.state;
    if (searchTerm.isEmpty) return emit(SearchStateEmpty());
    emit(SearchStateLoading());

      try {

        final results = await searchProductRepository.search(term: searchTerm,
            limit: limit.toString(),offset: offset.toString());
        //if(results.isEmpty) state.hasReachedMax=true;
        emit(SearchStateSuccess(items: results,
          ));

        inputText=event.text.toString();

        // if(state is SearchStateSuccess) {
        //   inputText=event.text.toString();
        //   results.isEmpty
        //     ? emit(SearchStateSuccess(
        //         items:state.items+ results))
        //     : emit(SearchStateSuccess(
        //      items:  state.items+ results));
        // }

    } catch (error) {
        emit(error is SearchStateError
            ? SearchStateError(error.error)
            : SearchStateError('something went wrong'));
      }


  }


  void _onNextPage(
      OnNextPage event,
      Emitter<SearchProductState> emit,
      ) async {

    final searchTerm =inputText;
    final state=this.state;
    if (searchTerm.isEmpty) return emit(SearchStateEmpty());
    emit(SearchStateLoading());
if(state is SearchStateSuccess){
  try {
    final resultsOnNextPage = await searchProductRepository.search(term: searchTerm,
        limit: limit.toString(),offset: (offset+ state.items.length).toString());

    if(resultsOnNextPage.isEmpty) hasReachedMax=true;

    emit(SearchStateSuccess(items:state.items+resultsOnNextPage,));

    // if(state is SearchStateSuccess) {
    //  state.hasReachedMax!=true
    //       ? emit(SearchStateSuccess(
    //       items:state.items+ results,))
    //       : emit(SearchStateSuccess(
    //       items:  state.items+ results));
    // }

  } catch (error) {
    emit(error is SearchStateError
        ? SearchStateError(error.error)
        : SearchStateError('something went wrong'));
  }
}




  }
}
