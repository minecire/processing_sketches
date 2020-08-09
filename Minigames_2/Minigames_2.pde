//MINIGAMES 2!!
String game = "Hub";        // make a string to keep track of which game you're in
                            // set it to "Hub" to tell the program to show a menu of games
int page = 1;               // in the hub there are multiple pages, kept track of here.
                            // start on page 1
void setup(){               // create a setup function- this will run once at the beginning
  size(800,800);            // create a square window with a width of 800 and a height of 800
}                           // end the setup function
void draw(){                // create a draw function- this will run every frame.
  if(game == "Hub"){hub();} // tell the hub function to run when game is equal to hub
}                           // end the draw function
void hub(){                 // create a function that will run when game is equal to Hub
  background(51);           // a dark gray background color
  noStroke();               // have no borders
  fill(255,0,0,130);        // set the fill color to a bright red with some opacity
  if(mouseY < 137 && mouseY > 62){
    if(mouseX < 750 && mouseX > 50){
      fill(255,0,0,220);    // make the box brighter when hovered over
    }
  }
  rect(50,62,700,75);      // put a rectangular box with a top-left corner at 50,62 and a width of 700 and a height of 75
  fill(255,128,0,130);      // set the fill color to a bright orange with some opacity
  if(mouseY < 237 && mouseY > 162){
    if(mouseX < 750 && mouseX > 50){
      fill(255,128,0,220);    // make the box brighter when hovered over
    }
  }
  rect(50,162,700,75);     // put a rectangular box with a top-left corner at 50,162 and a width of 700 and a height of 75
  fill(255,255,0,130);      // set the fill color to a bright yellow with some opacity
  if(mouseY < 337 && mouseY > 262){
    if(mouseX < 750 && mouseX > 50){
      fill(255,255,0,220);    // make the box brighter when hovered over
    }
  }
  rect(50,262,700,75);     // put a rectangular box with a top-left corner at 50,262 and a width of 700 and a height of 75
  fill(0,255,0,130);        // set the fill color to a bright green with some opacity
  if(mouseY < 437 && mouseY > 362){
    if(mouseX < 750 && mouseX > 50){
      fill(0,255,0,220);    // make the box brighter when hovered over
    }
  }
  rect(50,362,700,75);     // put a rectangular box with a top-left corner at 50,362 and a width of 700 and a height of 75
  fill(0,255,255,130);        // set the fill color to a bright cyan with some opacity
  if(mouseY < 537 && mouseY > 462){
    if(mouseX < 750 && mouseX > 50){
      fill(0,255,255,220);    // make the box brighter when hovered over
    }
  }
  rect(50,462,700,75);     // put a rectangular box with a top-left corner at 50,462 and a width of 700 and a height of 75
  fill(0,0,255,130);        // set the fill color to a bright blue with some opacity
  if(mouseY < 637 && mouseY > 562){
    if(mouseX < 750 && mouseX > 50){
      fill(0,0,255,220);    // make the box brighter when hovered over
    }
  }
  rect(50,562,700,75);     // put a rectangular box with a top-left corner at 50,562 and a width of 700 and a height of 75
  fill(128,0,255,130);        // set the fill color to a bright purple with some opacity
  if(mouseY < 737 && mouseY > 662){
    if(mouseX < 750 && mouseX > 50){
      fill(128,0,255,220);    // make the box brighter when hovered over
    }
  }
  rect(50,662,700,75);     // put a rectangular box with a top-left corner at 50,662 and a width of 700 and a height of 75
  fill(0,255,255,50);
  stroke(0,255,255,150);
  if(mouseX < 40 && mouseX > 10 && mouseY > 50 && mouseY < 750){
    fill(0,255,255,150);
    stroke(0,255,255,50);
  }
  if(page < 2){
    fill(0,255,255,15);
    stroke(0,255,255,50);
  }
  rect(10,50,30,700);
  line(35,100,15,400);
  line(15,400,35,700);
  fill(0,255,255,50);
  stroke(0,255,255,150);
  if(mouseX < 790 && mouseX > 760 && mouseY > 50 && mouseY < 750){
    fill(0,255,255,150);
    stroke(0,255,255,50);
  }
  if(page > 4){
    fill(0,255,255,15);
    stroke(0,255,255,50);
  }
  rect(760,50,30,700);
  line(765,100,785,400);
  line(785,400,765,700);
  if(page == 1){            // put the page 1 text if page is 1
    fill(0);
    textSize(50);
    text("Balloon Shooting Range",75,110); // the name of the first minigame
    text("Run and Jump",75,210);           // the name of the second minigame
    text("Eating Cheese",75,310);          // the name of the third minigame
    text("Saving Ducks",75,410);           // the name of the fourth minigame
    text("Falling",75,510);                // the name of the fifth minigame
    text("Collecting Coins",75,610);       // the name of the sixth minigame
    text("Bounce!",75,710);                // the name of the seventh minigame
  }
  if(page == 2){            // put the page 2 text if page is 2
    fill(0);
    textSize(50);
    text("Repair the wall",75,110); // the name of the eighth minigame
    text("Put Out the Fire",75,210);           // the name of the ninth minigame
    text("Stretch the string",75,310);          // the name of the tenth minigame
    text("Don't spill it",75,410);           // the name of the eleventh minigame
    text("Move your mouse",75,510);                // the name of the twelfth minigame
    text("Keyboard spam",75,610);       // the name of the thirteenth minigame
    text("Pong",75,710);                // the name of the fourteenth minigame
  }
  if(page == 3){            // put the page 3 text if page is 3
    fill(0);
    textSize(50);
    text("Gravity Flip",75,110); // the name of the fifteenth minigame
    text("Arrow Keys",75,210);           // the name of the sixteenth minigame
    text("'It's raining tacos!'",75,310);          // the name of the seventeenth minigame
    text("Minesweeper",75,410);           // the name of the eighteenth minigame
    text("Piano",75,510);                // the name of the nineteenth minigame
    text("Fly",75,610);       // the name of the twentyth minigame
    text("Swimming",75,710);                // the name of the twenty-first minigame
  }
  if(page == 4){            // put the page 4 text if page is 4
    fill(0);
    textSize(50);
    text("Black Jack",75,110); // the name of the twenty-second minigame
    text("Piano",75,210);           // the name of the twenty-third minigame
    text("Circle Hopper",75,310);          // the name of the twenty-fourth minigame
    text("Simon",75,410);           // the name of the twenty-fifth minigame
    text("Walls",75,510);                // the name of the twenty-sixth minigame
    text("Blob tag",75,610);       // the name of the twenty-seventh minigame
    text("Twenty-One",75,710);                // the name of the twenty-eighth minigame
  }
  if(page == 5){            // put the page 5 text if page is 5
    fill(0);
    textSize(50);
    text("29",75,110); // the name of the twenty-ninth minigame
    text("30",75,210);           // the name of the thirtyth minigame
    text("31",75,310);          // the name of the thirty-first minigame
    text("32",75,410);           // the name of the thirty-second minigame
    text("33",75,510);                // the name of the thirty-third minigame
    text("34",75,610);       // the name of the thirty-fourth minigame
    text("35",75,710);                // the name of the thirty-fifth minigame
  }
}
void mouseReleased(){            //the function for the release of the mouse
if(mouseY > 50 && mouseY < 750){
  if(mouseX > 760 && mouseX < 790){
    if(page < 5){
      page++;
    }
  }
  if(mouseX < 40 && mouseX > 10){
    if(page > 1){
      page--;
    }
  }
}
}