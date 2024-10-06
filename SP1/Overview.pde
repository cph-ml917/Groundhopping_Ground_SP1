class Overview {

  int x, y, w, h;
  color c;
  color hoverButton;
  String txt;
  int txtSize = 18;

  //The Constructor
  Overview (int _x, int _y, int _w, int _h, color _c, color _hoverButton, String _txt)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
    hoverButton = _hoverButton;
    txt = _txt;
  }

  /*
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
   */

  Overview () {
  }

  void displayThePitch() {
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
  }

  void displayStands()
  {
   





    ///////////
    pushStyle();
     if (mouseOver()) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
    if (mouseOver()) {

      fill(hoverButton);
    } else {

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

  //Check if the mouse is on the button
  boolean mouseOver()
  {
    return (mouseX >= x && mouseX <= (x + w) && mouseY >= y && mouseY <= (y + h));
  }
}
