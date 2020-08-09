//Input
//Input in Earth Time
float Earth_Seconds = 0;
float Earth_Minutes = 0;
float Earth_Hours = 0;
float Earth_Days = 0;
float Earth_Weeks = 0;
float Earth_Months = 1000000000;
float Earth_Years = 0;
float Earth_Decades = 0;
float Earth_Centuries = 0;
float Earth_Millenia = 0;
//Planet
String ConvertTo1 = "Sun";
//Days or Years
String ConvertTo2 = "Years";

//If changed to Sun Days, Specify Poles or Equator
String ConvertTo3 = "Equator";
//Input the number of decimal points. This is not completely exact, so rounding will happen.
int dp = 50;

//For further calculations (Do not Change)
long Total_Days_int = floor(Earth_Seconds/(3600*23.9344)+Earth_Minutes/(60*23.9344)+Earth_Hours/23.9344+Earth_Days+7*Earth_Weeks+31*Earth_Months+365.2422*Earth_Years+365.2422*10*Earth_Decades+365.2422*100*Earth_Centuries+365.2422*100*Earth_Millenia);
float Total_Days_float = (Earth_Seconds/(3600*23.9344)+Earth_Minutes/(60*23.9344)+Earth_Hours/23.9344+Earth_Days+7*Earth_Weeks+31*Earth_Months+365.2422*Earth_Years+365.2422*10*Earth_Decades+365.2422*100*Earth_Centuries+365.2422*100*Earth_Millenia)-Total_Days_int;
double Final;


int lg(double x){
  int y = 0;
  int q = 0;
  while(y < x){
    y*= 10;
    q += 1;
  }
  return(q-1);
}
void setup(){
  size(500,500);
  if(ConvertTo1 == "Earth"){
    if(ConvertTo2 == "Days"){
      Final = (((Total_Days_int + Total_Days_float)));
    }
    else if(ConvertTo2 == "Years"){
      Final = ((Total_Days_int + Total_Days_float))/365.2422;
    }
  }
  if(ConvertTo1 == "Mars"){
    if(ConvertTo2 == "Days"){
      Final = ((Total_Days_int + Total_Days_float))/1.02876102924347;
    }
    else{
      Final = ((Total_Days_int + Total_Days_float))/(1.02876102924347*668.5921);
    }
  }
  if(ConvertTo1 == "Venus"){
    if(ConvertTo2 == "Days"){
      Final = ((Total_Days_int + Total_Days_float))/243;
    }
    else{
      Final = ((Total_Days_int + Total_Days_float))/224.65;
    }
  }
  if(ConvertTo1 == "Mercury"){
    if(ConvertTo2 == "Days"){
      Final = 53.646*((Total_Days_int + Total_Days_float));
    }
    else{
      Final = ((Total_Days_int + Total_Days_float))/87.97;
    }
  }
  if(ConvertTo1 == "Jupiter"){
    if(ConvertTo2 == "Days"){
      Final = 0.4146750867366791*((Total_Days_int + Total_Days_float));
    }
    else{
      Final = ((Total_Days_int + Total_Days_float))/4332.82;
    }
  }
  if(ConvertTo1 == "Saturn"){
    if(ConvertTo2 == "Days"){
      Final = ((Total_Days_int + Total_Days_float));
    }
    else{
      Final = ((Total_Days_int + Total_Days_float))/10755.7;
    }
  }
  if(ConvertTo1 == "Uranus"){
    if(ConvertTo2 == "Days"){
      Final = ((Total_Days_int + Total_Days_float));
    }
    else{
      Final = ((Total_Days_int + Total_Days_float))/30687.15;
    }
  }
  if(ConvertTo1 == "Neptune"){
    if(ConvertTo2 == "Days"){
      Final = ((Total_Days_int + Total_Days_float));
    }
    else{
      Final = ((Total_Days_int + Total_Days_float))/60190.03;
    }
  }
  if(ConvertTo1 == "Pluto"){
    if(ConvertTo2 == "Days"){
      Final = ((Total_Days_int + Total_Days_float));
    }
    else{
      Final = ((Total_Days_int + Total_Days_float))/90553;
    }
  }
  if(ConvertTo1 == "Sun"){
    if(ConvertTo2 == "Days"){
      if(ConvertTo3 == "Poles"){
        Final = ((Total_Days_int + Total_Days_float))/35;
      }
      if(ConvertTo3 == "Equator"){
        Final = ((Total_Days_int + Total_Days_float))/27;
      }
    }
    else{
      Final = (((Total_Days_int + Total_Days_float)))/(365.2422*250000000);
    }
  }
  print(String.format("%."+dp+"f", Final));
}
void draw(){
  background(0);
  fill(255);
  Double x = Final;
  int y = lg(x)+dp;
  textSize(50);
  text(y,200,200);
  textSize(400/y);
  text(String.format("%."+dp+"f", Final),30,400);
}