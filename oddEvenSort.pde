int[] oddEvenSorts(int[] array) {
  while (isSorted(array) != true) {
    //even phase
    for (int even = 0; even < array.length - 1; even += 2) {
      if (array[even] > array[even + 1]) {
        //swap the values
        int buffer = array[even];
        array[even] = array[even + 1];
        array[even + 1] = buffer;
      }
    }
    //odd phase
    for (int odd = 1; odd < array.length - 1; odd += 2) {
      if (array[odd] > array[odd + 1]) {
        //swap the values
        int buffer = array[odd];
        array[odd] = array[odd + 1];
        array[odd + 1] = buffer;
      }
    }
  }
  return array;
}

boolean isSorted(int[] array) {
  for (int run = 0; run < array.length - 1; run++) {
    if (array[run] > array[run + 1]) {
      return false;
    }
  }
  return true;
}
