//The number of reported child abuse in Japan from 2008 to 2017
void settings() {
  size(1400, 800);
}



void setup() {
  background(0);
  //Legends. My original code
 
  fill(255);
 
 
 
 
 
  textSize(15);
  fill(245,7,7); //red
  text("Ex: Hitting, Kicking, Punching, etc...", 200, 750);
  circle(20, 15, 10);
  fill(255);
  text("Physical Abuse (Press P or p to show its data only)", 40, 20);
 
 
  textSize(15);
  fill(8, 170, 190); //blue
  text("Ex: Not giving food, medicine, education, etc...", 200, 780);
  circle(20, 45, 10);
  fill(255);
  text("Neglect (Press N or n to show its data only)", 40, 50);
 
  //x+430
 
  textSize(15);  
  fill(7,245,25); //green
  text("Ex: Incest, Exposure to AVs, Excessive Body Touch, etc...", 600, 750);
  circle(450, 15, 10);
  fill(255);
  text("Sexual Abuse (Press S or s to show its data only)", 470, 20);
 
 
 
 textSize(15);  
  fill(245,237,7); //yellow
  text("Ex: Verbal Harassment, Denouncement, Rejection, etc...", 600, 780);
  circle(450, 45, 10);
  fill(255);
 text("Emotional Abuse (Press E or e to show its data only)", 470, 50);
 
  textSize(15);
  fill(255);
 text("Press anywhere else to show all of the data", 900, 20);
 
  textSize(20);
  fill(255);
 text("() = Total", 870, 110);
 
 

 
  //What the graph is about. My original code
  pushMatrix();
  textSize(20);
  fill(255);
  translate(50,770);
  rotate(-HALF_PI);
  text("The number of reported child abuse cases in Japan from 2008 to 2017", 0,0);
   //translate(50,770);
   //text("() = total", 0,0);
  popMatrix();
 
 
 
 
   
 
     
}


   
void draw() {
/*
Data obtained from p. 4 of

https://www.mhlw.go.jp/content/11901000/000348313.pdf

Note that
Heisei 20 is 2008 AD
...
Heisei 29 is 2017 AD
*/  
  Table table = loadTable("Abuse.csv", "header");
  int rc = table.getRowCount();
   
 
     
  //dummy rectangles to "fix" the aliasing issue
  //my idea
  //otherwise, it will ruin the anti-aliasing
  fill(0);
  rect(90, 150, 100, 800);
  fill(0);
  rect(860, 140, 1000, 580);
 

    //using 3 for-statements
   //othewise, some of the bar charts will not be drawn
   //my idea
   
   
   //before 2012
   for (int i = 0; i < rc - 6; i++) {
 //how to make instances: https://www.geeksforgeeks.org/array-getfloat-method-in-java/ and
 //how to use table data: https://processing.org/reference/Table_getFloat_.html
 //how to make bar graphs: http://r-dimension.xsrv.jp/classes_j/bar_chart/
 //However, the idea itself is mine and mine alone
      textSize(20);
          
      float y = 150 + i * 60;
      float y2 = 170 + i * 60;
      float scale = 0.004;

      int[] TL = new int[rc]; //basic array initialisation in Java
      TL[i] = table.getInt(i, "Total"); //get a number from row i and column Total
      fill(255);
      text("(" + TL[i] + ")", 870, y2);

      int[] SA = new int[rc]; //basic array initialisation in Java
      SA[i] = table.getInt(i, "Sexual Abuse"); //get a number from row i and column Sexual Abuse
      fill(7,245,25); //green
      rect(200, y, SA[i] * scale, 30);
      text(SA[i], 1000, y2);

      int[] EA= new int[rc]; //basic array initialisation in Java
      EA[i] = table.getInt(i, "Emotional Abuse"); //get a number from row i and column Emotional Abuse
      fill(245,237,7); //yellow
      rect(200 + SA[i] * scale, y, EA[i] * scale, 30);  
      text(EA[i], 1100, y2);    
    
      int[] NG = new int[rc]; //basic array initialisation in Java
      NG[i] = table.getInt(i, "Neglect"); //get a number from row i and column Neglect
      fill(8, 170, 190); //blue
      rect(200 + (SA[i] + EA[i]) * scale, y, NG[i] * scale, 30);
      text(NG[i], 1200, y2);

      int[] PA = new int[rc];//basic array initialisation in Java
      PA[i] = table.getInt(i, "Physical Abuse"); //get a number from row i and column Physical Abuse
      //int y = 5 + i * 22;
      fill(245,7,7); //red
      rect(200 + (SA[i] + EA[i] + NG[i]) * scale, y, PA[i] * scale, 30);
      text(PA[i], 1300, y2);
 
      int[] YR = new int[rc];
      YR[i] = table.getInt(i, "Year");
      //rect(110, 100, 90, 550);
      fill(255);
      text(YR[i], 120, y2);
     
      //without using the for-statement, those texts will become faint but still visible
      //my idea
      for (int j = 0; j < 10 ; j++) {
      if ((key == 'S') || (key == 's')) {
       
         fill(0);
         //text(SA[i], 1000, y2);

         text(EA[i], 1100, y2);
           
         text(NG[i], 1200, y2);
               
         text(PA[i], 1300, y2);
         
        // text(TL[i], 890, y2);
       
      }
     
       if ((key == 'E') || (key == 'e')) {
         fill(0);
         
         text(SA[i], 1000, y2);
         
         //text(EA[i], 1100, y2);
           
         text(NG[i], 1200, y2);
               
         text(PA[i], 1300, y2);
         
        // text(TL[i], 890, y2);    
      }
     
       if ((key == 'N') || (key == 'n')) {
         fill(0);
         
         text(SA[i], 1000, y2);
       
         text(EA[i], 1100, y2);
         
 // text(NG[i], 1200, y2);
               
         text(PA[i], 1300, y2);
         
       //  text(TL[i], 890, y2);
       
      }
     
       if ((key == 'P') || (key == 'p')) {
         fill(0);  
         
         text(SA[i], 1000, y2);
         
         text(EA[i], 1100, y2);
         
         text(NG[i], 1200, y2);
           
        // text(PA[i], 1300, y2);
 
        // text(TL[i], 890, y2);
       
      }
     
       
      }
     
     
     
     
     
     
     
     
    }
   
    //2012
  for (int i = 4; i < rc - 5 ; i++) {
      textSize(20);
     
      float y = 150 + i * 60;
      float y2 = 170 + i * 60;
      float scale = 0.004;

      int[] SA = new int[rc];
      SA[i] = table.getInt(i, "Sexual Abuse");
      fill(7,245,25); //green
      rect(200, y, SA[i] * scale, 30);
      text(SA[i], 1000, y2);

      int[] NG = new int[rc];
      NG[i] = table.getInt(i, "Neglect");
      fill(8, 170, 190); //blue
      rect(200 + SA[i] * scale, y, NG[i] * scale, 30);
      text(NG[i], 1100, y2);

      int[] EA= new int[rc];
      EA[i] = table.getInt(i, "Emotional Abuse");
      fill(245,237,7); //yellow
      rect(200 + (SA[i] + NG[i]) * scale, y, EA[i] * scale, 30);
      text(EA[i], 1200, y2);

      int[] PA = new int[rc];
      PA[i] = table.getInt(i, "Physical Abuse");
      //int y = 5 + i * 22;
      fill(245,7,7); //red
      rect(200 + (SA[i] + NG[i] + EA[i]) * scale, y, PA[i] * scale, 30);
      text(PA[i], 1300, y2);
   
     
      int[] TL = new int[rc]; //basic array initialisation in Java
      TL[i] = table.getInt(i, "Total"); //get a number from row i and column Total
      fill(255);  
      text("(" + TL[i] + ")", 870, y2);
     
     
   
      int[] YR = new int[rc];
      YR[i] = table.getInt(i, "Year");
      //rect(110, 100, 90, 550);
      fill(255);
      text(YR[i], 120, y2);    
     
     
       for (int j = 0; j < 10 ; j++) {
      if ((key == 'S') || (key == 's')) {
         fill(0);
         //text(SA[i], 1000, y2);
         text(NG[i], 1100, y2);
         text(EA[i], 1200, y2);
         text(PA[i], 1300, y2);
       //  text(TL[i], 890, y2);
       
      }
     
       if ((key == 'E') || (key == 'e')) {
         fill(0);
         text(SA[i], 1000, y2);
         text(NG[i], 1100, y2);
        // text(EA[i], 1200, y2);
         text(PA[i], 1300, y2);
         //text(TL[i], 890, y2);
       
      }
     
       if ((key == 'N') || (key == 'n')) {
         fill(0);
         text(SA[i], 1000, y2);
         //text(NG[i], 1100, y2);
         text(EA[i], 1200, y2);
         text(PA[i], 1300, y2);
      //   text(TL[i], 890, y2);
       
      }
     
       if ((key == 'P') || (key == 'p')) {
         fill(0);
         text(SA[i], 1000, y2);
         text(NG[i], 1100, y2);
         text(EA[i], 1200, y2);
         //text(PA[i], 1300, y2);
       //  text(TL[i], 890, y2);
       
      }
     
     
       }
     
     
     
     
     
     
    }
   
   //after 2012
   for (int i = 5; i < rc; i++) {
      textSize(20);
     
      float y = 150 + i * 60;
      float y2 = 170 + i * 60;
      float scale = 0.004;
       
      int[] SA = new int[rc];
      SA[i] = table.getInt(i, "Sexual Abuse");
      fill(7,245,25); //green
      rect(200, y, SA[i] * scale, 30);
      text(SA[i], 1000, y2);

      int[] NG = new int[rc];
      NG[i] = table.getInt(i, "Neglect");
      fill(8, 170, 190); //blue
      rect(200 + SA[i] * scale, y, NG[i] * scale, 30);
      text(NG[i], 1100, y2);

      int[] PA = new int[rc];
      PA[i] = table.getInt(i, "Physical Abuse");
      //int y = 5 + i * 22;
      fill(245,7,7); //red
      rect(200 + (SA[i] + NG[i]) * scale, y, PA[i] * scale, 30);
      text(PA[i], 1200, y2);

      int[] EA= new int[rc];
      EA[i] = table.getInt(i, "Emotional Abuse");
      fill(245,237,7); //yellow
      rect(200 + (SA[i] + NG[i] + PA[i] ) * scale, y, EA[i] * scale, 30);
      text(EA[i], 1300, y2);
        
     
      int[] TL = new int[rc]; //basic array initialisation in Java
      TL[i] = table.getInt(i, "Total"); //get a number from row i and column Total
    fill(255);
      text("(" + TL[i] + ")", 870, y2);
     
     
      int[] YR = new int[rc];
      YR[i] = table.getInt(i, "Year");
      //rect(110, 100, 90, 550);
      fill(255);
      text(YR[i], 120, y2);    
     
     
      for (int j = 0; j < 10 ; j++) {
      if ((key == 'S') || (key == 's')) {
         fill(0);
         //text(SA[i], 1000, y2);
         text(NG[i], 1100, y2);
         text(PA[i], 1200, y2);
         text(EA[i], 1300, y2);
     //   text(TL[i], 890, y2);
       
      }
     
       if ((key == 'E') || (key == 'e')) {
        fill(0);
         text(SA[i], 1000, y2);
         text(NG[i], 1100, y2);
         text(PA[i], 1200, y2);
        // text(EA[i], 1300, y2);
        // text(TL[i], 890, y2);
       
      }
     
       if ((key == 'N') || (key == 'n')) {
         fill(0);
         text(SA[i], 1000, y2);
         //text(NG[i], 1100, y2);
         text(PA[i], 1200, y2);
         text(EA[i], 1300, y2);
        // text(TL[i], 890, y2);
       
      }
     
       if ((key == 'P') || (key == 'p')) {
        fill(0);
         text(SA[i], 1000, y2);
        text(NG[i], 1100, y2);
        // text(PA[i], 1200, y2);
         text(EA[i], 1300, y2);
       //  text(TL[i], 890, y2);
       
      }
     
       
        }
     
     
     
   }
   
}
