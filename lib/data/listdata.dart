import 'package:finance_app/data/1.dart';

List<money> geter(){

    money upwork= money();
    upwork.name= 'upwork';
    upwork.fee='650';
    upwork.time= 'today';
    upwork.image= 'Transfer.png';
    upwork.buy = false ;

    money education = money();

    education.buy= false ;
    education.fee ='700';
    education.time='today';
    education.name= 'Education';
    education.image= ('Education.png');

    money starbacks = money();

    starbacks.buy= true ;
    starbacks.fee ='15';
    starbacks.time='today';
    starbacks.name= 'Starbacks';
    starbacks.image= ('food.png');


    money transportaion = money();

    transportaion.buy= false ;
    transportaion.fee ='555';
    transportaion.time='today';
    transportaion.name= 'Transportaion';
    transportaion.image= ('Transportation.png');
    transportaion.image= ('Transportation.png');


    return[upwork, starbacks, education,transportaion, starbacks, upwork, education];
}