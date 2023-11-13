import 'package:flutter/material.dart';
import 'package:support/presentation/bottomSheet/secondScreen.dart';

import '../../Cubit/HomeCubit.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/values_manager.dart';
import '../widgets/custom_Container.dart';
import '../widgets/custom_text.dart';

class RoomsList extends StatelessWidget {
  const RoomsList({Key? key, required this.cubit})
      : super(key: key);
  final HomeCubit cubit;


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder:(context,index){
          return  CustomContainer(
            radius: AppSize.s10,
            padding: 8.0,
            widget: Column(
              children: [
                CustomText(text: "${TextApp.room1}${index + 1}",),
                const SizedBox(height: AppSize.s20,),
                //adults
                Row(
                  children: [
                    const CustomText(text: TextApp.adults),
                    const Spacer(),
                    AddOrSubtractButton(onTap: () {
                      cubit.subtractAdultsIndex();
                    },
                        icons: Icons.remove,
                        color: cubit.adultsIndex <= 1
                            ? AppColors.lightBlue
                            : AppColors.deepBlue),
                    const SizedBox(width: AppSize.s4,),
                    CustomText(text: "${cubit.adultsIndex}",),
                    const SizedBox(width: AppSize.s4,),
                    AddOrSubtractButton(onTap: () {
                      cubit.addAdultsIndex();
                    },
                        icons: Icons.add,
                        color: cubit.adultsIndex >= 4
                            ? AppColors.lightBlue
                            : AppColors.deepBlue),
                  ],
                ),
                const SizedBox(height: AppSize.s10,),
                //children
                Row(
                  children: [
                    const CustomText(text: TextApp.children),
                    const Spacer(),
                    AddOrSubtractButton(onTap: () {
                      cubit.subtractChildrenIndex();
                    },
                        icons: Icons.remove,
                        color: cubit.childrenIndex <= 0
                            ? AppColors.lightBlue
                            : AppColors.deepBlue),
                    const SizedBox(width: AppSize.s4,),
                    CustomText(text: "${cubit.childrenIndex}",),
                    const SizedBox(width: AppSize.s4,),
                    AddOrSubtractButton(onTap: () {
                      cubit.addChildrenIndex();
                    },
                        icons: Icons.add,
                        color: cubit.childrenIndex >= 4
                            ? AppColors.lightBlue
                            : AppColors.deepBlue),

                  ],
                ),
                const SizedBox(height: 20.0,),
                ChildList(cubit: cubit),

              ],
            ),
          );
        }, separatorBuilder: (context,index){
      return const SizedBox(height:AppSize.s20,);
    }, itemCount:cubit.roomsIndex);

  }
}
class ChildList extends StatelessWidget {
  const ChildList({Key? key, required this.cubit}) : super(key: key);
  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder:(context,index){
          return Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(text: "${TextApp.ageOfChild} ${index+1}",),
                const Spacer(),
                CustomText(text: TextApp.years,color: AppColors.lightBlue,)
              ],
            ),
          );
        }, separatorBuilder: (context,index){
      return const SizedBox(height:AppSize.s20,);
    }, itemCount:cubit.childrenIndex );
  }
}