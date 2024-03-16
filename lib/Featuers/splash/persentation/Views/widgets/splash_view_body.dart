import 'package:bookly_app/Core/Utlis/assetsLinks.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SplashViewBody  extends StatefulWidget{
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    
    navigateToHome();

  }


  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsLinks.logo),
        const SizedBox(height: 4,),
        AnimatedBuilder(
          animation:slidingAnimation ,
          builder:(context, _ )
            {
              return SlideTransition(
                position: slidingAnimation,
                child: const Text('Read Free Books',
                  textAlign: TextAlign.center,),
              );
            }
          ),
      ],
    );
    
  }
  
  void initSlidingAnimation() {
    animationController=AnimationController(
      vsync: this,
      duration:const Duration(seconds:2),
    );
    slidingAnimation=
        Tween<Offset>(begin:const Offset(0,20),end:const Offset(0, 0)).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3),
            (){
         GoRouter.of(context).push('/HomeView');
        }
    );
  }
  
}

