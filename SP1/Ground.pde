class Stadium {
  String[][] seats;

  // Et reserveret sæde har værdien 0.
  // Sæder som ikke er reserveret, har værdien "O"

  public Stadium(int rows, int seats) {
    
    
    this.seats = new String[rows][seats];

    for (int i = 0; i < this.seats.length; i++) {
      for (int j = 0; j < this.seats[i].length; j++) {

        this.seats[i][j] = "O";
      }
    }
  }

  public int getRows() {
    return seats.length;
  }

  public int getSeats() {
    return seats[0].length;
  }

  public boolean reserve(int row, int seat) {
    row -= 1;
    seat -=1;
    if (seats[row][seat].equals("O")) {
      seats[row][seat] = "X";
      return true;
    }
    return false;
  }

  public boolean cancelReservation(int row, int seat) {
    if (seats[row][seat].equals("X")) {
      seats[row][seat] = "O";
      return true;
    }
    return false;
  }

  public String toString() {
    String result = "";
    for (String[] seat : seats) {
      result += "|";
      for (String s : seat) {
        result += s + "|";
      }
      result += "\n";
    }
    return result;
  }
}
