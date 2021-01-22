import 'package:flutter_app_cchat/app/constants/barrel_constants.dart';
import 'package:flutter_app_cchat/app/constants/endpoint/app_anh_quan_endpoint.dart';
import 'package:flutter_app_cchat/model/entity/attr_color.dart';
import 'package:flutter_app_cchat/model/entity/attr_size.dart';
import 'package:flutter_app_cchat/model/entity/barrel_entity.dart';
import 'package:flutter_app_cchat/model/entity/category_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/color_catergory_product_hot.dart';
import 'package:flutter_app_cchat/model/entity/sizes.dart';
import 'package:flutter_app_cchat/model/repo/barrel_repo.dart';
import 'package:flutter_app_cchat/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'buy_now_panel_event.dart';
import 'buy_now_panel_state.dart';

class BuyNowPanelBloc extends Bloc<BuyNowPanelEvent, BuyNowPanelState> {
  final CartRepository _cartRepository;

  BuyNowPanelBloc({@required CartRepository cartRepository})
      : assert(cartRepository != null),
        _cartRepository = cartRepository;

  @override
  BuyNowPanelState get initialState => BuyNowPanelState.empty();

  @override
  Stream<BuyNowPanelState> mapEventToState(BuyNowPanelEvent event) async* {
    if (event is AddProduct) {
      yield* _mapAddProductToState(event.product);
    } else if (event is SelectColor) {
      yield* _mapSelectColorToState(event.color);
    } else if (event is SelectSize) {
      yield* _mapSelectSizeToState(event.size);
    } else if (event is IncreaseQuantity) {
      yield* _mapIncreaseQuantityToState();
    } else if (event is DecreaseQuantity) {
      yield* _mapDecreaseQuantityToState();
    } else if (event is ProductDetailAddCart) {
      yield* _mapAddCartToState();
    }
  }

  Stream<BuyNowPanelState> _mapAddProductToState(
      CategoryProductHotData product) async* {
    yield state.update(product: product);
  }

  Stream<BuyNowPanelState> _mapSelectColorToState(
      ColorCatergoryProductHot color) async* {
    yield state.update(color: color);
  }

  Stream<BuyNowPanelState> _mapSelectSizeToState(Sizes size) async* {
    yield state.update(size: size);
  }

  Stream<BuyNowPanelState> _mapIncreaseQuantityToState() async* {
    yield state.update(quantity: state.quantity + 1);
  }

  Stream<BuyNowPanelState> _mapDecreaseQuantityToState() async* {
    yield state.update(quantity: state.quantity > 1 ? state.quantity - 1 : 1);
  }

  Stream<BuyNowPanelState> _mapAddCartToState() async* {
    print(state);
    if (state.isFormValid) {
      yield BuyNowPanelState.loading(state.copyWith(
          status: DioStatus(message: '', code: DioStatus.API_PROGRESS_NOTIFY)));
      int isHas;
      try {
        for (int i = 0; i < (state.product.attrQty?.length ?? 0); i++) {
          isHas = 0;
          var attrQuantity = state.product.attrQty[i];
          if (attrQuantity.colorId != null) {
            if (attrQuantity.colorId == state.color?.id) {
              isHas++;
            }
          }
          if (attrQuantity.sizeId != null) {
            if (attrQuantity.sizeId == state.size?.id) {
              isHas++;
            }
          }

          if (attrQuantity.quantity != null) {
            if (attrQuantity.quantity >= state.quantity) {
              isHas++;
            }
          }

          if (isHas == 3) break;
        }
        final response = await _cartRepository.cartAdd(
            productId: state.product.id,
            colorId: state.color?.id,
            sizeId: state.size?.id,
            quantity: state.quantity);
        if (response.status == Endpoint.SUCCESS) {
          yield BuyNowPanelState.success(state.copyWith(
              status: DioStatus(
                  message: response.message, code: DioStatus.API_SUCCESS)));
        } else {
          yield BuyNowPanelState.failure(state.copyWith(
              status: DioStatus(
                  message: response.message,
                  code: DioStatus.API_FAILURE_NOTIFY)));
        }
      } catch (e) {
        print('--------> Error: $e');
        yield BuyNowPanelState.failure(
            state.update(status: DioErrorUtil.handleError(e)));
      }
    }
  }
}
