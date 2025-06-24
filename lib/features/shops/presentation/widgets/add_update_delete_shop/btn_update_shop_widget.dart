import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icecreamshop/core/utils/color.dart';
import 'package:icecreamshop/core/utils/snackbar_messgae.dart';
import 'package:icecreamshop/core/widgets/custom_button_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/features/shops/presentation/bloc/add_update_delete_shop/add_update_delete_shop_bloc.dart';
import 'package:icecreamshop/features/shops/presentation/bloc/shops/shops_bloc.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddUpdateDeleteShopBloc, AddUpdateDeleteShopState>(
      listener: (context, state) {
         if(state is MessageAddUpdateDeleteShopState){
          //  Navigator.of(context).pop();
           SnackBarMessage().showSuccessSnackBar(
                    message: state.message, context: context);
                     BlocProvider.of<ShopsBloc>(context).add(RefreshShopsEvent());
                     

        }else if(state is ErrorAddUpdateDeleteShopState){
          //  Navigator.of(context).pop();
                SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);

        }
        
      },
      builder: (context, state) {
        return Opacity(
            opacity: state is LoadingAddUpdateDeleteShopState?0.5:1,
          child: CustomButton(
            text: 'Update',
            onTap:state is LoadingAddUpdateDeleteShopState?(){}: onPressed,
            backgroundColor: AppColors.strawberryPink,
            borderRadius: 18.sp,
            height: 55.h,
            width: 140.w,
            fontSize: 18.sp,
            textColor: AppColors.pureWhite,
          ),
        );
      },
    );
  }
}
