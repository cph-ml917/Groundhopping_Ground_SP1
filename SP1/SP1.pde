PFont font;

int buttonStatus = 1;
color colorOne = color(32, 35, 70);
color seatColor = color(196);
color hoverColor = color(77, 91, 255);
color whiteColor = color(253,253,253);

Overview northStand, eastStand, southStand, westStand, pitch;
Stand button1;

void setup () {
  size(1280, 720);
  background(211,211,211);

  // Get the font
  font = createFont("DMSans-Regular.ttf", 30);
  textFont(font);
  fill(colorOne);


  //The Stands
  northStand = new Overview(250, 50, 500, 160, color(whiteColor), color(hoverColor), "The North "+"Stand");
  eastStand = new Overview(750, 210, 200, 290, color(whiteColor), color(hoverColor), "The East\n"+"Stand");
  southStand = new Overview(250, 500, 500, 180, color(whiteColor), color(hoverColor), "The South "+"Stand");
  westStand = new Overview(50, 210, 200, 290, color(whiteColor), color(hoverColor), "The West\n"+"Stand");

  //The PitcH
  pitch = new Overview(260, 220, 480, 270, color(whiteColor), color(0), "");

  //The Back-Button
  button1 = new Stand(0, 0, 160, 60, color(0, 232, 147), color(hoverColor), "← Back");

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
  background(169,169,169);

  if (buttonStatus == 1) {
    pitch.displayThePitch();
    pitch.header1(1010, 50);
    northStand.displayStands();
    eastStand.displayStands();
    southStand.displayStands();
    westStand.displayStands();
  } else {
    button1.seatsOnTheStand();
    button1.header2(1010, 50);
    button1.displayButton();
  }

  //Info board
  noStroke();
  fill(0, 40);
  rect(1000, 0, 280, 720);
}



void mousePressed()
{
  if (buttonStatus == 1)
  {
    if (northStand.mouseOverStand() || eastStand.mouseOverStand() || southStand.mouseOverStand() || westStand.mouseOverStand())
    {
      println("You have selected a stand");
      buttonStatus = 2;
      cursor(ARROW);
      // cursor(ARROW);
      return;
    }
  }
  if (buttonStatus == 2) {
    if (button1.mouseOverButton())
    {

      println("You have clicked on the back button. Please select a new stand.");
      buttonStatus = 1;
      // cursor(HAND);
      cursor(ARROW);
      //cursor(ARROW);
      return;
    }
  }
}
