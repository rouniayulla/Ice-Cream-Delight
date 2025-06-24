import 'package:flutter/material.dart';
import 'package:icecreamshop/core/widgets/custom_text_filed.dart';
import 'package:icecreamshop/features/shops/domain/entities/shop.dart';
import 'package:icecreamshop/features/shops/presentation/widgets/add_update_delete_shop/btn_delete_shop_widget.dart';
import 'package:icecreamshop/features/shops/presentation/widgets/add_update_delete_shop/btn_update_shop_widget.dart';


Future<void> showIceCreamShopDialog({
  required BuildContext context,
  required IceCreamShopEntity entity,
  required void Function(IceCreamShopEntity) onUpdate,
  required VoidCallback onDelete,
}) {
  final formKey = GlobalKey<FormState>();

  // controllers pre‑filled with entity data
  final nameCtrl       = TextEditingController(text: entity.name);
  final locationCtrl   = TextEditingController(text: entity.location);
  final phoneCtrl      = TextEditingController(text: entity.phone);
  final descCtrl       = TextEditingController(text: entity.description);
  final daysCtrl       = TextEditingController(text: entity.daysOpen);
  final openCtrl       = TextEditingController(text: entity.openTime);
  final closeCtrl      = TextEditingController(text: entity.closeTime);

  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: const Text('Ice‑Cream Shop'),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(label: 'Name', controller: nameCtrl, icon: Icons.store),
              const SizedBox(height: 10),
              CustomTextFormField(label: 'Location', controller: locationCtrl, icon: Icons.location_on),
              const SizedBox(height: 10),
              CustomTextFormField(label: 'Phone', controller: phoneCtrl, icon: Icons.phone, keyboardType: TextInputType.phone),
              const SizedBox(height: 10),
              CustomTextFormField(label: 'Description', controller: descCtrl, icon: Icons.description),
              const SizedBox(height: 10),
              CustomTextFormField(label: 'Days Open', controller: daysCtrl, icon: Icons.calendar_today),
              const SizedBox(height: 10),
              CustomTextFormField(label: 'Open Time', controller: openCtrl, icon: Icons.schedule),
              const SizedBox(height: 10),
              CustomTextFormField(label: 'Close Time', controller: closeCtrl, icon: Icons.schedule),
            ],
          ),
        ),
      ),
      actions: [
        DeleteButton(onPressed: () {
          onDelete();
        }),
        UpdateButton(onPressed: () {
          if (formKey.currentState!.validate()) {
           
            final updated = IceCreamShopEntity(
              id:entity.id,
              name: nameCtrl.text,
              location: locationCtrl.text,
              phone: phoneCtrl.text,
              description: descCtrl.text,
              isOpen: entity.isOpen, // could add switch if needed
              daysOpen: daysCtrl.text,
              openTime: openCtrl.text,
              closeTime: closeCtrl.text,
            );
           
            onUpdate(updated);
          }
        }),
      ],
    ),
  );
}
