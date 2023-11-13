import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:support/presentation/utils/app_colors.dart';
import 'package:support/presentation/utils/app_strings.dart';
import 'package:support/presentation/utils/values_manager.dart';
import 'package:support/presentation/widgets/customTextFormField.dart';
import 'package:support/presentation/widgets/custom_Container.dart';
import 'package:support/presentation/widgets/custom_text.dart';

import '../../Cubit/HomeCubit.dart';
import '../../Cubit/home_states.dart';
import '../bottomSheet/secondScreen.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, HomeStates state) {},
        builder: (BuildContext context, HomeStates state) {
          var cubit = HomeCubit.get(context);
          return CustomContainer(
            color: AppColors.deepOrange,
            radius: AppSize.s12,
            // borderColor:AppColors.deepOrange ,
            widget: Expanded(
              child: Column(
                children: [
                  CustomContainer(
                    color: AppColors.deepBlue,
                    borderColor:AppColors.deepBlue ,
                    radius: AppSize.s12,
                    padding: AppPadding.p20,
                    widget: Column(
                      children: [
                        //select city
                        CustomContainer(
                            color: AppColors.white,
                            radius: AppSize.s12,
                            padding: AppPadding.p4,
                            widget: CustomTextFormField(hint: TextApp.selectCity,validator: (value){
                              return null;
                            },)),
                        const SizedBox(height: AppSize.s10,),
                        //date range
                        CustomContainer(
                          color: AppColors.white,
                          radius: AppSize.s12,
                          padding: AppPadding.p4,
                          widget: CustomContainer(
                            color: AppColors.white,
                            radius: AppSize.s12,
                            borderColor: AppColors.blue,
                            padding: AppPadding.p8,
                            widget: InkWell(
                              onTap: (){
                                cubit.selectDateTime(context);
                              },
                              child: Row(
                                children: [
                                   CustomText(text:cubit.pickedDate,color: AppColors.deepBlue,),
                                  const Spacer(),
                                  Icon(Icons.close,color: AppColors.lightBlue,),
                                ],
                              ),
                            ),
                          ),),
                        const SizedBox(height: AppSize.s10,),
                        //select nationality
                        CustomContainer(
                          color: AppColors.white,
                          radius: AppSize.s12,
                          padding: AppPadding.p12,
                          widget: InkWell(
                            onTap: (){
                              // cubit.dropDownList();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: cubit.dropDownList(),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                CustomText(text:cubit.selectNationality,color: AppColors.deepBlue,),
                                const Spacer(),
                                Icon(Icons.arrow_downward,color: AppColors.lightBlue,),
                              ],
                            ),
                          )),
                        const SizedBox(height: AppSize.s10,),
                        //rooms
                        CustomContainer(
                            color: AppColors.white,
                            radius: AppSize.s12,
                            padding: AppPadding.p12,
                            widget: InkWell(
                              onTap: (){
                                // cubit.dropDownList();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: cubit.dropDownList(),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  const CustomText(text:TextApp.listOfChoice,color: AppColors.deepBlue,),
                                  const Spacer(),
                                  Icon(Icons.arrow_downward,color: AppColors.lightBlue,),
                                ],
                              ),
                            )),
                      ],
                    ),),
                  GestureDetector(
                    onTap: (){
                      // Open the bottom sheet on button press
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => const BottomSheetScreen(),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: TextApp.findHotels,color: AppColors.white,),
                        SizedBox(width: AppSize.s20,),
                        Icon(Icons.search_outlined,color: AppColors.white,size: AppSize.s40,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

  }
}