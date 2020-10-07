int[] numbers = new int [31];  //Array som indeholder terningekastne.
int counter = 0;               //Tæller det kast vi er nået til.

int ones = 0;                  //Tæller ettere til seksere.
int twos = 0;                  //
int threes = 0;                //
int fours = 0;                 //
int fives = 0;                 //
int sixes = 0;                 //

void setup() {
  size(800, 800);
  clear();
  textSize(20);
  
  text("TRYK på 'k' FOR AT KASTE", 50, 50);          //Setup text.
  text("Fordeling af terningekast", 70, 750);
  for(int b=1; b<=6; b++)text(b, 20+50*b, 700);
  textSize(14);
  for(int b = 0; b<300; b+=50)text("0 stk",60+b,660);
  
}

void draw() {
}

void keyPressed() {
  clear();
  textSize(20);
  text("TRYK på 'k' FOR AT KASTE / OG 's' FOR AT SLETTE", 50, 50);

  if ((key=='k' || key == 'K') && counter < 30) {
    counter++;                               //Counter stiger hver gang du klikker på knappen K.
    int kast = lavTerningeKast(1, 7);        
    text("DIT KAST BLEV:" + kast, 50, 75);
  }

  if ((key == 's' || key == 'S') && counter>0) {
    fjernSidsteKast();                       //Funktion længere nede.
  }
  tegnFordeling();                           //Funktion længere nede.
  udskrivKast();                             //Funktion længere nede.
  if(counter==0)text("DIT KAST BLEV: ", 50, 75);
  if(counter==30)text("DIT KAST BLEV:"+numbers[counter], 50, 75);
}

int lavTerningeKast(int min, int max){        
  int nyKast = int(random(min,max));         //Laver tallet.
  numbers[counter] = nyKast;                 //dette indsætter "nyKast" ind i arrayet.
  
  if(nyKast==1)ones++;                       //Tjekker hvilket tal det nye tal er, og tilføjer det til 'forskellige tal tælleren'.
  if(nyKast==2)twos++;                       //
  if(nyKast==3)threes++;                     //
  if(nyKast==4)fours++;                      //
  if(nyKast==5)fives++;                      //
  if(nyKast==6)sixes++;                      //
  return nyKast;
}  

void udskrivKast(){
  for(int b=1;b<=counter;b++){                      //Laver talrækken på højre side. Laver så mange tekst felter som counter tallet er nået til.
  text("Kast "+b+": "+numbers[b],600,50+20*b);      //Viser terningekastet via arrayet med stigende b.
  }
}

void fjernSidsteKast(){
  if(numbers[counter]==1)ones--;                    //Dette fjerner sidste tal fra 'forskellige tal tælleren'
  if(numbers[counter]==2)twos--;                    //
  if(numbers[counter]==3)threes--;                  //
  if(numbers[counter]==4)fours--;                   //
  if(numbers[counter]==5)fives--;                   //
  if(numbers[counter]==6)sixes--;                   //
  
  counter--;                            
  text("DIT KAST BLEV:" + numbers[counter], 50, 75); 
}

void tegnFordeling(){   
  
  text("Fordeling af terningekast", 70, 750);       
  for(int b=1; b<=6; b++){                          //Laver en talrække fra 1-6
    text(b, 20+50*b, 700);                          //
  }
  
  textSize(14);
  rect(55,670,45,ones*-20);     text(ones+" stk",60,660-ones*20);            //Koden her laver diagrammet. Rektanglerne stiger i størrlse på negativ Y koordinatet
  rect(105,670,45,twos*-20);    text(twos+" stk",110,660-twos*20);           //i takt med at 'forskellige tal tælleren' stiger. Der er også en tekst som 
  rect(155,670,45,threes*-20);  text(threes+" stk",160,660-threes*20);       //stiger sammentidigt, så den altid er over diagrammet og tæller antal
  rect(205,670,45,fours*-20);   text(fours+" stk",210,660-fours*20);         //tal af de forskellige tal. if that makes sense
  rect(255,670,45,fives*-20);   text(fives+" stk",260,660-fives*20);         //
  rect(305,670,45,sixes*-20);   text(sixes+" stk",310,660-sixes*20);         //
  textSize(20);
}
