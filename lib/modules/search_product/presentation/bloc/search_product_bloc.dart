import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
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

        emit(
            SearchStateSuccess(items: results, hasReachedMax: false,
          ));

        inputText=event.text.toString();

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

    if(state is SearchStateSuccess){

      if (state.hasReachedMax) return;
      emit(SearchStateLoading());
  try {
    final resultsOnNextPage = await searchProductRepository.search(term: searchTerm,
        limit: limit.toString(),offset: (offset+ state.items.length).toString());

    if (kDebugMode) {
      print('resultsOnNextPage>>>>>>>>>>>>>>>>>>>>>>>>>> $resultsOnNextPage');
    }
    if(resultsOnNextPage.isEmpty) {
      state.hasReachedMax==true;
    }


         resultsOnNextPage.isEmpty? emit(state.copyWith(hasReachedMax:true )):
        emit(state.copyWith(items: List.of(state.items)..addAll(resultsOnNextPage),));

    if (kDebugMode) {
      print('resultsOnNextPage max>>>>>>>>>>>>>>>>>>>>>>>>>> ${state.hasReachedMax}');
    }
  } catch (error) {
    emit(error is SearchStateError
        ? SearchStateError(error.error)
        : SearchStateError('something went wrong'));
  }
}




  }
}
