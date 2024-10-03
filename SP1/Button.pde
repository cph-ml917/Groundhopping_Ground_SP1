
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
      fill(hoverButton);
      cursor(HAND);
    } else {
      fill(c);
      cursor(ARROW);
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
