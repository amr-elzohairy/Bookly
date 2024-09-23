import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplachViewBody extends StatefulWidget {
  const SplachViewBody({super.key});

  @override
  State<SplachViewBody> createState() => _SplachViewBodyState();
}

class _SplachViewBodyState extends State<SplachViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<Offset> booklyAnimation;

  @override
  void initState() {
    super.initState();
    initSplashAnimations();
    navigateToHomeView();
  }

  void navigateToHomeView() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // ignore: use_build_context_synchronously
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }

  void initSplashAnimations() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: Offset.zero)
            .animate(animationController);
    booklyAnimation =
        Tween<Offset>(begin: const Offset(0, -5), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedBuilder(
          animation: booklyAnimation,
          builder: (context, _) => SlideTransition(
            position: booklyAnimation,
            child: Image.asset(
              AssetsData.booklyLogo,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 150,
        ),
        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context, _) => SlideTransition(
            position: slidingAnimation,
            child: const Text(
              'Read Free Books',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
