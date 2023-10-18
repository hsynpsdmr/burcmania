import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/json/json_constants.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) => Scaffold(
        body: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(JsonConstants.instance.splash),
              DefaultTextStyle(
                style: GoogleFonts.bungeeOutline(fontSize: 50),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('BURCMANIA'),
                  ],
                  isRepeatingAnimation: true,
                  totalRepeatCount: 1,
                  pause: const Duration(seconds: 2),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
