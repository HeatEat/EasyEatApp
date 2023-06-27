part of 'recommended_restaurants_bloc.dart';

abstract class RecommendedRestaurantsState extends Equatable {
  const RecommendedRestaurantsState();
  
  @override
  List<Object> get props => [];
}

class RecommendedRestaurantsInitial extends RecommendedRestaurantsState {}
