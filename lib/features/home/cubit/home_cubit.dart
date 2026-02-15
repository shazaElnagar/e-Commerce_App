import 'package:bloc/bloc.dart';
import 'package:untitled1/features/home/cubit/home_state.dart';
import 'package:untitled1/features/home/data/home_service.dart';
import 'package:untitled1/features/home/data/product_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    print("CUBIT CREATED");
  }

  final HomeService service = HomeService();

  Future<void> getAllProducts() async {
    print("GET PRODUCTS CALLED");

    emit(HomeLoading());

    try {
      final products = await service.getProducts();
      emit(HomeSuccess(products));
    } catch (e) {
      print("CUBIT ERROR: $e");
      emit(HomeError("Failed"));
    }
  }
}