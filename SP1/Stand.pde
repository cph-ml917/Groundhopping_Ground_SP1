
class Stand
{
  int x, y, w, h;
  color c;
  color hoverButton;
  String txt;
  int txtSize = 20;

  //The Constructor
  Stand (int _x, int _y, int _w, int _h, color _c, color _hoverButton, String _txt)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
    hoverButton = _hoverButton;
    txt = _txt;
  }

  //Display the button
  void displayButton()
  {

    pushStyle();
    if (mouseOverButton()) {
      cursor(HAND);
      fill(hoverButton);
    } else {
      cursor(ARROW);
      fill(c);
    }

    noStroke();
    strokeWeight(0);
    rect(x, y, w, h);
    fill(32, 35, 70);
    textSize(txtSize);
    textAlign(CENTER);
    text(txt, x+w/2, y+h/2+txtSize/2-txtSize/4);
    noStroke();

    popStyle();
  }

  void seatsOnTheStand() {
    textSize(20);

    textAlign(CENTER);
    // Rectangular grid.
    stroke(colorOne);
    strokeWeight(2.8);
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
    translate( 68, 130 );
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

          fill(hoverColor);
          //textSize(20);

          text( "" + c + (i+1), 20 + 40 * i, 30 + 40 * j );
        }
      }
    }
    popMatrix();

    // Labels on sides
    fill(colorOne);
    textSize(txtSize);
    for ( int i = 0; i < 14; i++ ) {
      char c = char(int('A') + i);
      // Letters.
      text( c, 25, 135 + 40 * i );
    }
    for ( int i = 0; i < 22; i++ ) {
      // Numbers.
      int t = i+1;
      text( "" + t, 68 + 40 * i, 695);
    }
  }

  void header2 (int x, int y) {
    fill(32, 35, 70);
    textSize(26);
    text("THE GROUNDHOPPING GROUND", x, y, 260, 400);
    textAlign(CENTER);
  }


  //Check if the mouse is on the button
  boolean mouseOverButton()
  {
    return (mouseX >= x && mouseX <= (x + w) && mouseY >= y && mouseY <= (y + h));
  }
}
