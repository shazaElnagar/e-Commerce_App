import 'package:bloc/bloc.dart';
import 'package:untitled1/features/home/cubit/home_state.dart';
import 'package:untitled1/features/home/data/home_service.dart';
import 'package:untitled1/features/home/data/product_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  HomeService service = HomeService();

  Future<void> getAllProducts() async {
    emit(HomeLoading());
    try {
      List<ProductModel> products = await service.getProducts();
      emit(HomeSuccess(products));
    }
    catch (e) {
      emit(HomeError("Failed to load products"));
    }
  }
}