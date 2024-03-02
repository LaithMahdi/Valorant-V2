import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/app-color.dart';
import '../../../controller/weapon/detail/weapon-detail-controller.dart';

class WeaponTableDamage extends GetView<WeaponDetailController> {
  const WeaponTableDamage({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      children: [
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColor.grey8, width: 1),
                  ),
                ),
                child: Text(
                  "Range",
                  style: Get.textTheme.bodyLarge!.copyWith(
                    fontSize: 13,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColor.grey8, width: 1),
                  ),
                ),
                child: Text(
                  "Damage",
                  style: Get.textTheme.bodyLarge!.copyWith(
                    fontSize: 13,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColor.grey8, width: 1),
                  ),
                ),
                child: Text(
                  "Body",
                  style: Get.textTheme.bodyLarge!.copyWith(
                    fontSize: 13,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColor.grey8, width: 1),
                  ),
                ),
                child: Text(
                  "Leg",
                  style: Get.textTheme.bodyLarge!.copyWith(
                    fontSize: 13,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        ...controller.weapon.weaponStats!.damageRanges!.map((damage) {
          return TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: AppColor.grey8, width: 1),
                    ),
                  ),
                  child: Text(
                    "${damage.rangeStartMeters!} - ${damage.rangeEndMeters!}",
                    style: Get.textTheme.bodyMedium!
                        .copyWith(fontFamily: "Roboto"),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: AppColor.grey8, width: 1),
                    ),
                  ),
                  child: Text(
                    "${damage.headDamage!}",
                    style: Get.textTheme.bodyMedium!
                        .copyWith(fontFamily: "Roboto"),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: AppColor.grey8, width: 1),
                    ),
                  ),
                  child: Text(
                    "${damage.bodyDamage!}",
                    style: Get.textTheme.bodyMedium!
                        .copyWith(fontFamily: "Roboto"),
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: AppColor.grey8, width: 1),
                    ),
                  ),
                  child: Text(
                    "${damage.legDamage!}",
                    style: Get.textTheme.bodyMedium!
                        .copyWith(fontFamily: "Roboto"),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}
