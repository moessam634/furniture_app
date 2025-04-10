import 'package:bloc/bloc.dart';
import '../../model/data/home_data.dart';
import 'home_state.dart';

class ProductsCubit extends Cubit<ProductState> {
  ProductsCubit() : super(ProductLoadingState());
  HomeData homeProductData = HomeData();

  getProduct() async {
    var data = await homeProductData.getProduct();
    emit(ProductSuccessState(products: data));
  }
}
