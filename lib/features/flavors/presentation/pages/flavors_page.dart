import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecreamshop/core/widgets/custom_loading_widget.dart';
import 'package:icecreamshop/core/widgets/custom_message_widget.dart';
import 'package:icecreamshop/features/flavors/presentation/bloc/flavors/flavors_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icecreamshop/features/flavors/presentation/widgets/flavors/flavors_list_widget.dart';

class FlavorsPage extends StatelessWidget {
  const FlavorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: BlocBuilder<FlavorsBloc, FlavorsState>(
        builder: (context, state) {
          if (state is LoadingFlavorsState) {
            return LoadingWidget();
          } else if (state is LoadedFlavorsState) {
            return IceCreamFlavorListView(flavors: state.flavors);
          } else if (state is ErrorFlavorsState) {
            return CustomMessageWidget(message: state.message);
          }
          return LoadingWidget();
        },
      ),
    );
  }
}