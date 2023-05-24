import 'dart:ffi';

class UserOrder {
  final int orderId;
  final String restaurantId;
  final int pickUpPlace;
  final String assignedDriverId;
  final DateTime createdAt;
  final Float deliveryFee;
  final Float serviceFee;
  final Float totalAmount;
  final DateTime requestedDeliveryDatetime;
  final int customerRestaurantRating;
  final int paymentId;

  UserOrder({
    required this.orderId,
    required this.restaurantId,
    required this.pickUpPlace,
    required this.assignedDriverId,
    required this.createdAt,
    required this.deliveryFee,
    required this.serviceFee,
    required this.totalAmount,
    required this.requestedDeliveryDatetime,
    required this.customerRestaurantRating,
    required this.paymentId,
  });
}
