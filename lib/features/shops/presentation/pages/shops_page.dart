
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/widgets/custom_loading_widget.dart';
import 'package:icecreamshop/core/widgets/custom_message_widget.dart';
import 'package:icecreamshop/features/shops/presentation/bloc/shops/shops_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icecreamshop/features/shops/presentation/widgets/shop/shops_list_widget.dart';


class ShopsPage extends StatelessWidget {
  const ShopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  _buildBody();
    
  }



  Widget _buildBody() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:10.w),
      child: BlocBuilder<ShopsBloc, ShopsState>(
        builder: (context, state) {
          if (state is LoadingShopsState) {
            return LoadingWidget();
          } else if (state is     LoadedShopsState) {
            return IceCreamShopListView(shops: state.shops);
          } else if (state is ErrorShopsState) {
            return CustomMessageWidget(message: state.message);
          }
          return LoadingWidget();
        },
      ),
    );
  }

 
 
}