PFont font;

Button button1;
Overview northStand, eastStand, southStand, westStand, pitch;

int buttonStatus = 1;
color colorOne = color(32, 35, 70);
color seatColor = color(196);
color hoverColor = color(77, 91, 255);


void setup () {
  size(1280, 720);
  background(180);

  // Get the font
  font = createFont("DMSans-Regular.ttf", 30);
  textFont(font);
  fill(32, 35, 70);

  //The Stand & the Back-Button
  button1 = new Button(0, 0, 160, 60, color(0, 232, 147), color(hoverColor), "← Back");

  /*northStand = new Button(250, 50, 500, 160, color(255), color(hoverColor), "The North "+"Stand");
   eastStand = new Button(750, 210, 200, 290, color(255), color(hoverColor), "The East\n"+"Stand");
   southStand = new Button(250, 500, 500, 180, color(255), color(hoverColor), "The South "+"Stand");
   westStand = new Button(50, 210, 200, 290, color(255), color(hoverColor), "The West\n"+"Stand");*/

  northStand = new Overview(250, 50, 500, 160, color(255), color(hoverColor), "The North "+"Stand");
  eastStand = new Overview(750, 210, 200, 290, color(255), color(hoverColor), "The East\n"+"Stand");
  southStand = new Overview(250, 500, 500, 180, color(255), color(hoverColor), "The South "+"Stand");
  westStand = new Overview(50, 210, 200, 290, color(255), color(hoverColor), "The West\n"+"Stand");
  pitch = new Overview();


  Stadium bestGround = new Stadium(14, 20);

  // Reserver række 1, sæde 3
  System.out.println("Række 1, sæde 3 er reserveret: " + bestGround.reserve(1, 3));

  // Print hele salen
  System.out.println(bestGround);

  // Afbestil reservation på række 1, sæde 3
  System.out.println("Række 1, sæde 3 er afbestilt: " + bestGround.cancelReservation(1, 3));

  // Print hele salen pænt
  System.out.println(bestGround);
}

void draw() {
  background(140);



  if (buttonStatus == 1) {
    pitch.displayThePitch();
    northStand.displayStands();
    eastStand.displayStands();
    southStand.displayStands();
    westStand.displayStands();
  } else {
    button1.seatsOnTheStand();
    button1.displayButton();
    button1.header2(1010, 50);
    //header2(1010, 50);
  }

  //Info board
  noStroke();
  fill(0, 40);
  rect(1000, 0, 280, 720);
  //header1(1010, 50);
}


void header1 (int x, int y) {
  fill(32, 35, 70);
  textSize(26);
  text("THE GROUNDHOPPING GROUND", x, y, 260, 400);

  textSize(14);
  text("Welcome to our new stadium The Groundhopping Ground. Tickets for next match is on sale now - select a stand and click on it.", x, 160, 260, 400);
  textAlign(CENTER);

  textSize(26);
  text("← Buy tickets", x, 360, 260, 400);
  fill(hoverColor);
}




void mousePressed()
{
  if (buttonStatus == 1)
  {
    if (northStand.mouseOver() || eastStand.mouseOver() || southStand.mouseOver() || westStand.mouseOver())
    {
      println("You have selected a stand");
      buttonStatus = 2;
      return;
    }
  }
  if (buttonStatus == 2) {
    if (button1.mouseOver())
    {
      println("You have clicked on the back button. Please select a new stand.");
      buttonStatus = 1;
      return;
    }
  }
}
