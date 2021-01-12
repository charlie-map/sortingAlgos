int[] quickSort(int[] array, int low, int high) {
  if (low < high) {
    int[][] pivot = partition(array, low, high);
    array = pivot[1];
    array = quickSort(array, low, pivot[0][0] - 1);
    array = quickSort(array, pivot[0][0] + 1, high);
  }
  return array;
}

int[][] partition(int[] array, int startLow, int startHigh) {
  //start in center of array
  int i = startLow - 1;
  for (int j = startLow; j < startHigh; j++) {
    if (array[j] < array[startHigh]) {
        i++;
        int buffer = array[j];
        array[j] = array[i];
        array[i] = buffer;
    }
  }
  if (i + 1 >= 0) {
    int buffer = array[i+1];
    array[i+1] = array[startHigh];
    array[startHigh] = buffer;
  }
  int[][] returner = new int[2][array.length];
  returner[0][0] = i + 1;
  for (int j = 0; j < array.length; j++) {
    returner[1][j] = array[j];
  }
  return returner;
}
