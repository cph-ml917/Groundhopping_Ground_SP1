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

  void displayStands()
  {
    pushStyle();
    if (mouseOverStand()) {
      //cursor(HAND);
      fill(hoverButton);
    } else {
      //cursor(ARROW);
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

  void displayThePitch() {
    //The Pitch
    fill(0, 232, 147);
    rect(260, 220, 480, 270);

    //The line markings on the pitch
    fill(whiteColor);
    rect(498, 220, 4, 270);
    noFill();
    stroke(whiteColor);
    strokeWeight(3);
    ellipse(500, 360, 60, 60);
  }

  void header1 (int x, int y) {
    fill(32, 35, 70);
    textSize(26);
    text("THE GROUNDHOPPING GROUND", x, y, 260, 400);

    textSize(14);
    text("Welcome to our new stadium The Groundhopping Ground. Tickets for next match is on sale now - select a stand and click on it.", x, 180, 260, 400);
    textAlign(CENTER);

    textSize(26);
    text("← Buy tickets", x, 360, 260, 400);
    fill(hoverColor);
  }




  //Check if the mouse is on the button
  boolean mouseOverStand()
  {
    return (mouseX >= x && mouseX <= (x + w) && mouseY >= y && mouseY <= (y + h));
  }
}
