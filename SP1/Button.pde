
class Button
{
  int x, y, w, h;
  color c;
  color hoverButton;
  String txt;
  int txtSize = 18;

  //The Constructor
  Button (int _x, int _y, int _w, int _h, color _c, color _hoverButton, String _txt)
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
    if (mouseOver()) {
      cursor(HAND);
      fill(hoverButton);
    } else {
      cursor(ARROW);
      fill(c);
    }
    stroke(100);
    strokeWeight(0);
    rect(x, y, w, h);
    fill(32, 35, 70);
    textSize(txtSize);
    textAlign(CENTER);
    text(txt, x+w/2, y+h/2+txtSize/2-txtSize/4);
    popStyle();
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

  /*
  void displayStands()
   {
   pushStyle();
   if (mouseOver()) {
   cursor(HAND);
   fill(hoverButton);
   
   } else {
   cursor(ARROW);
   fill(c);
   
   }
   stroke(100);
   strokeWeight(0);
   rect(x, y, w, h);
   fill(32, 35, 70);
   textSize(txtSize);
   textAlign(CENTER);
   text(txt, x+w/2, y+h/2+txtSize/2-txtSize/4);
   popStyle();
   }*/

  void header2 (int x, int y) {
    fill(32, 35, 70);
    textSize(26);
    text("THE GROUNDHOPPING GROUND", x, y, 260, 400);
    textAlign(CENTER);
  }


  //Check if the mouse is on the button
  boolean mouseOver()
  {
    return (mouseX >= x && mouseX <= (x + w) && mouseY >= y && mouseY <= (y + h));
  }
}
