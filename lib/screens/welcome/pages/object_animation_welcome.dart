// screens/welcome/pages/object_animation_welcome.dart
import 'package:flutter/material.dart';
import 'package:ibe_assistance/constant/color_constant.dart';
import 'package:ibe_assistance/constant/text_constant.dart';
import 'dart:math';
import 'package:ibe_assistance/screens/admin/admin_screen.dart';
import 'package:ibe_assistance/screens/student/student_screen.dart';


class ObectAnimationWelcome extends StatefulWidget { 
  final String role;
  const ObectAnimationWelcome({super.key, required this.role}); 
  @override
  State<ObectAnimationWelcome> createState() => _ObectAnimationWelcomeState(role);
}

class _ObectAnimationWelcomeState extends State<ObectAnimationWelcome> with SingleTickerProviderStateMixin {
  final String role;
  _ObectAnimationWelcomeState(this.role,);  
  
  late AnimationController controller;
  // animaciones      
  late Animation<double> enlargeAnimation;
  late Animation<double> shrinkAnimation;
  late Animation<double> rotateAnimation;
  
  late Animation<double> inAnimation;
  late Animation<double> outAnimation;  

  @override
  void initState() { 
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration( milliseconds: 5000 ));

    // Definimos animación de entrada desde fuera de la pantalla hasta su posición original
    inAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: controller,
      // Se ejecuta la entrada en el primer 25% de la animación
      // Utilizamos el Curves.bounceOut para el ejecto de rebote al final
      curve: const Interval(0.00, 0.25, curve: Curves.bounceOut),
    ));    
     // Definimos la animación de salida ejecutarse desde su posición inicial hasta fuera de la pantalla
    outAnimation = Tween(begin: 0.0, end: -1.0).animate(CurvedAnimation(
      parent: controller,
      // Se ejecuta en el ultimo 10% de la animación
      curve: const Interval(0.90, 1.0, curve: Curves.easeInOutCirc),
    ));

    // Definimos animación de agrandado hasta 5 veces
    enlargeAnimation = Tween(begin: 1.0, end: 5.0).animate(CurvedAnimation(
      parent: controller,
      // Se ejecuta la agrandado entre el 30% y 60% de la animación
      // Utilizamos el Curves.easeOutCubic para un efecto de agranddado acelerado al inicio y lento al final
      curve: const Interval(0.30, 0.60, curve: Curves.easeOutCubic),
    ));

    // Definimos animación de encojer con los valores a sustraer del agrandado para volver la escala original
    shrinkAnimation = Tween(begin: 0.0, end: 4.0).animate(CurvedAnimation(
      parent: controller,
      // Se ejecuta el encondido entre el 65% y 90% de la animación
      // Utilizamos el Curves.easeOutCubic para un efecto de encogido acelerado al inicio y lento al final
      curve: const Interval(0.65, 0.90, curve: Curves.easeOutCubic),
    ));

    // Definimo una rotación de 1 vuelta completa
    rotateAnimation = Tween(begin: 0.0, end: 2 * pi).animate(CurvedAnimation(
      parent: controller,
      // Se ejecuta el encondido entre el 65% y 90% de la animación, mismo intervalo que encojer
      // Utilizamos el Curves.easeInBack para el efecto de tomar impulso
      curve: const Interval(0.65, 0.90, curve: Curves.easeInBack),
    ));

    outAnimation.addListener(() {
        setState(() {});
         if(controller.status == AnimationStatus.completed){
                role == 'STUDENT' ?
                Navigator.push(context, MaterialPageRoute(builder: ((context) => const StudentScreen())))
                : Navigator.push(context, MaterialPageRoute(builder: ((context) => const AdminScreen())));
         }            
    });

    controller.addListener((){
      if ( controller.status == AnimationStatus.completed ) {
        controller.reverse();        
      }else if(controller.status == AnimationStatus.dismissed)
        controller.forward();        
    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();    
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.5;
    final width = (MediaQuery.of(context).size.width * 0.5);
    controller.forward();
    return Stack(
      children: <Widget>[    
        Center(
          child: Opacity(
            // Aprovechamos el valor de outAnimation para definir la opacidad y desaparecer al final
            opacity: 1 + outAnimation.value,
    
            child: Transform.rotate(
              // Se define la rotación
              angle: rotateAnimation.value,
    
              child: Transform.scale(
                // El escalado es la diferencia a los valores de enlargeAnimation y shrinkAnimation
                scale: enlargeAnimation.value - shrinkAnimation.value,
    
                child: Transform.translate(
                  // La traslación dx utiliza el outAnimation para la salida mienstra dy utiliza inAnimation para la entrada
                  offset: Offset(outAnimation.value * width, inAnimation.value * height),
                  child: Container(width: 320.0, height: 50.0, color: themeWelcomeTextBackground, 
                    child: RichText(
                        text: TextSpan(
                          children: [                              
                            TextSpan(
                              text: textWelcomeTitleAnimation,
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: themeWelcomeText, fontWeight: FontWeight.bold), 
                            ),
                          ],
                        ),
                      ),    
                  ),
                ),
              ),
            ),
          ),
        ),                
      ],    
    );    
  }    
}
