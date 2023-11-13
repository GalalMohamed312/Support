import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support/Cubit/home_states.dart';
import 'package:support/presentation/bottomSheet/roomsList.dart';
import 'package:support/presentation/utils/app_colors.dart';
import 'package:support/presentation/utils/app_strings.dart';
import 'package:support/presentation/utils/navigator.dart';
import 'package:support/presentation/utils/values_manager.dart';
import 'package:support/presentation/widgets/custom_Container.dart';
import 'package:support/presentation/widgets/custom_text.dart';

import '../../Cubit/HomeCubit.dart';

class BottomSheetScreen extends StatelessWidget {
  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, HomeStates state) {},
        builder: (BuildContext context, HomeStates state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: const CustomText(
                text: TextApp.appBarTitle,
              ),
              leading: const CustomText(text: ""),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      AppNavigator.pop(context: context);
                    },
                    icon: const Icon(Icons.close_outlined))
              ],
            ),
            backgroundColor: AppColors.background,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: Column(
                  children: [
                    //rooms
                    CustomContainer(
                      radius: AppSize.s10,
                      padding: 8.0,
                      widget: Row(
                        children: [
                          const CustomText(text: TextApp.rooms),
                          const Spacer(),
                          AddOrSubtractButton(
                              onTap: () {
                                cubit.subtractRoomsIndex();
                              },
                              icons: Icons.remove,
                              color: cubit.roomsIndex <= 1
                                  ? AppColors.lightBlue
                                  : AppColors.deepBlue),
                          const SizedBox(
                            width: AppSize.s4,
                          ),
                          CustomText(
                            text: "${cubit.roomsIndex}",
                          ),
                          const SizedBox(
                            width: AppSize.s4,
                          ),
                          AddOrSubtractButton(
                              onTap: () {
                                cubit.addRoomsIndex();
                              },
                              icons: Icons.add,
                              color: cubit.roomsIndex >= 5
                                  ? AppColors.lightBlue
                                  : AppColors.deepBlue),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    RoomsList(cubit: cubit),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    CustomContainer(
                        radius: AppSize.s10,
                        padding: AppPadding.p8,
                        widget: Row(
                          children: [
                            const CustomText(
                              text: TextApp.petFriendly,
                            ),
                            const Icon(Icons.info_outline),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  cubit.serviceEnabledOrNot();
                                },
                                child: Icon(
                                  cubit.serviceEnabled
                                      ? Icons.toggle_on
                                      : Icons.toggle_off,
                                  color: cubit.serviceEnabled
                                      ? AppColors.deepBlue
                                      : AppColors.lightBlue,
                                  size: AppSize.s40,
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddOrSubtractButton extends StatelessWidget {
  final IconData icons;
  final Color color;
  final Function()? onTap;

  const AddOrSubtractButton(
      {Key? key, required this.icons, required this.color, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: CustomContainer(
          borderColor: color,
          radius: 13.0,
          padding: AppPadding.p2,
          widget: Icon(
            icons,
            color: color,
          ),
        ));
  }
}
