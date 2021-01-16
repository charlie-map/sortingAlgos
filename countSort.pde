int[] countSort(int[] array) {
  int[] counts = new int[array.length];
  for (int i = 0; i < array.length; i++) {
    counts[array[i]] += 1;
  }
  int arrPos = 0;
  for (int i = 0; i < counts.length; i++) {
    if (counts[i] != 0) {
      for (int j = 0; j < counts[i]; j++) {
        array[arrPos] = i;
        arrPos++;
      }
    }
  }
  return array;
}
