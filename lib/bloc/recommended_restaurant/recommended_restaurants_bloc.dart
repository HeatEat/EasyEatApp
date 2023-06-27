import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recommended_restaurants_event.dart';
part 'recommended_restaurants_state.dart';

class RecommendedRestaurantsBloc extends Bloc<RecommendedRestaurantsEvent, RecommendedRestaurantsState> {
  RecommendedRestaurantsBloc() : super(RecommendedRestaurantsInitial()) {
    on<RecommendedRestaurantsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
