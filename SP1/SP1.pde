PFont font;

Button button1, northStand, eastStand, southStand, westStand;

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
  northStand = new Button(250, 50, 500, 160, color(255), color(hoverColor), "The North "+"Stand");
  eastStand = new Button(750, 210, 200, 290, color(255), color(hoverColor), "The East\n"+"Stand");
  southStand = new Button(250, 500, 500, 180, color(255), color(hoverColor), "The South "+"Stand");
  westStand = new Button(50, 210, 200, 290, color(255), color(hoverColor), "The West\n"+"Stand");

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
  fill(0, 40);
  rect(1000, 0, 280, 720);

  if (buttonStatus == 1) {
    northStand.displayButton();
    eastStand.displayButton();
    southStand.displayButton();
    westStand.displayButton();

    //The Pitch
    fill(0, 232, 147);
    rect(260, 220, 480, 270);

    //The line markings on the pitch
    fill(255);
    rect(498, 220, 4, 270);
    noFill();
    stroke(255);
    strokeWeight(3);
    ellipse(500, 360, 60, 60);
    header1(1010, 50);
  } else {
    button1.displayButton();
    seatsOnTheStand();
    header2(1010, 50);
  }

  noStroke();
  //header1(1010, 50);
}

void seatsOnTheStand() {
  textSize(18);

  textAlign(CENTER);
  // Rectangular grid.
  stroke(colorOne);
  int mX = -1;
  int mY = -1;
  // Determine mouse on grid.
  if ( mouseX >= 45 && mouseX < 1000 ) {
    if ( mouseY >= 105 && mouseY < 665 ) {
      mX=(mouseX - 45)/40;
      mY=(mouseY - 105)/40;
      /*cursor(HAND);
       }else {
       cursor(ARROW);*/
    }
  }
  // Draw the seats
  pushMatrix();
  translate( 65, 130 );
  for ( int i = 0; i < 22; i++ ) {
    for ( int j = 0; j < 14; j++ ) {
      // grid cell color. Depending on the position of the mouse.
      fill((mX==i&&mY==j)?hoverColor:seatColor);
      //rect( i*40, j*40, 40, 40);
      ellipse(i*40, j*40, 25, 25);
      ellipseMode(CENTER);
      // label on grid cell
      if ( mX==i && mY==j ) {
        fill(colorOne);
        char c = char( int('A') + j );
        text( "" + c + (i+1), 20 + 40 * i, 30 + 40 * j );
      }
    }
  }
  popMatrix();

  // Labels on sides
  fill(colorOne);
  for ( int i = 0; i < 14; i++ ) {
    char c = char(int('A') + i);
    // Letters.
    text( c, 25, 135 + 40 * i );
  }
  for ( int i = 0; i < 22; i++ ) {
    // Numbers.
    int t = i+1;
    text( "" + t, 65 + 40 * i, 695);
  }
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

void header2 (int x, int y) {
  fill(32, 35, 70);
  textSize(26);
  text("THE GROUNDHOPPING GROUND", x, y, 260, 400);
   textAlign(CENTER);

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
  } else {
    if (button1.mouseOver())
    {
      println("You have clicked on the back button. Please select a new stand.");
      buttonStatus = 1;
      return;
    }
  }
}
