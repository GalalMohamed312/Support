import 'package:flutter/material.dart';
import 'package:support/presentation/home/FormContainer.dart';
import 'package:support/presentation/home/rectangle%20shape.dart';
import 'package:support/presentation/utils/assets.dart';
import 'package:support/presentation/utils/values_manager.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.background,), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:MediaQuery.of(context).size.height * 0.3,),
                  const CombinedShape(),
                  const SizedBox(height: AppSize.s4,),
                  const FormContainer(),
                  const SizedBox(height: AppSize.s40,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

