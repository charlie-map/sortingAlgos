int[] insertSort(int[] array) {
  for (int i = 1; i < array.length; i++) {
    boolean notRun = true;
    for (int j = 0; j < i; j++) {
      if (array[i] < array[j] && notRun) {
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
