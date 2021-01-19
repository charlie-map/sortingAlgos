int[] gravitySorts(int[] array) {
  //find the longest value
  int largest = 0;
  for (int longVal = 0; longVal < array.length; longVal++) {
    largest = largest < array[longVal] ? array[longVal] : largest;
  }
  int[][] gravArray = new int[largest][array.length];
  //run through the columns and rows of the 2D array
  //set values to true or valse base on the number length
  for (int cols = 0; cols < gravArray[0].length; cols++) {
    //cols lines up with array - decides how many true values we add
    int newVal = array[cols];
    while (newVal > 0) {
      gravArray[newVal - 1][cols] = 1;
      newVal--;
    }
    array[cols] = 0;
  }
  //ones in place for rows - now push them all the way down (gravity)
  for (int cols = 0; cols < gravArray.length; cols++) {
    gravArray[cols] = gravitate(gravArray[cols], gravArray[cols].length);
  }
  //now that they're ordered, grab each row value for the array
  for (int cols = 0; cols < gravArray.length; cols++) { //this relates to the array (not gravArray
    for (int sepRows = 0; sepRows < gravArray[0].length; sepRows++) {
      array[sepRows] += gravArray[cols][sepRows] == 1 ? 1 : 0;
    }
  }
  return array;
}

int[] gravitate(int[] array, int beginState) {
  int zeroPos = beginState - 1;
  for (int row = beginState - 1; row >= 0; row--) {
    //find ones and swap them with further up 0's
    if (array[row] == 0 && array[zeroPos] != 0) { 
      zeroPos = row;
    } else if (array[row] == 1) {
      int buffer = array[zeroPos];
      array[zeroPos] = array[row];
      array[row] = buffer;
      zeroPos--;
    }
  }
  return array;
}
