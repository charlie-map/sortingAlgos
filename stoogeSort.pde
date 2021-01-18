int[] stoogeSorts(int[] array, int start, int end) {
  if (array[start] > array[end]) {
    int buffer = array[start];
    array[start] = array[end];
    array[end] = buffer;
  }
  if (start + 1 >= end) {
    return array;
  }
  int third = round((end-start+1) / 3);
  // first third
  array = stoogeSorts(array, start, end - third);
  //second third
  array = stoogeSorts(array, start + third, end);
  //third third ;)
  array = stoogeSorts(array, start, end - third);
  return array;
}
