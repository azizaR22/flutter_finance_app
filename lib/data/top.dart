import 'package:finance_app/data/1.dart';

List<money> geter_top(){

  money snap_food= money();
  snap_food.name= 'Mc Donalds';
  snap_food.fee='250';
  snap_food.time= 'today';
  snap_food.image= 'snap222.jpeg';
  snap_food.buy = false ;

  money snapfood2 = money();

  snapfood2.buy= false ;
  snapfood2.fee =' - \$ 100';
  snapfood2.time='jan 30,2023';
  snapfood2.name= 'Snap Food';
  snapfood2.image= ('snap.jpeg');




  return[snap_food,snapfood2];
}