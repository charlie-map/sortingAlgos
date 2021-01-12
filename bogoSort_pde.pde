int[] bogoSort(int[] array) {
  while (!isSorted(array)) {
    array = scramble(array);
  }
  return array;
}

int[] scramble(int[] array) {
  for (int i = array.length - 1; i > 1; i--) {
    int j = floor(random(i - 1));
    int buffer = array[j];
    array[j] = array[i];
    array[i] = buffer;
  }
  return array;
}

boolean isSorted(int[] array) {
  for (int i = 0; i < array.length - 1; i++) {
    if (array[i] > array[i + 1]) {
      return false;
    }
  }
  return true;
}
