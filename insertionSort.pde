int[] insertSort(int[] array) {
  for (int i = 1; i < array.length; i++) {
    //check against each position before it to see its position
    boolean notRun = true;
    for (int j = 0; j < i; j++) {
      //if i is greater than j value, then swap one position higher
      if (array[i] < array[j] && notRun) {
        //move values around
        int buffer = array[j];
        array[j] = array[i];
        for (int l = j + 1; l < i + 1; l++) {
          int otherBuff = array[l];
          array[l] = buffer;
          buffer = otherBuff;
        }
        notRun = false;
      }
    }
  }
  return array;
}
