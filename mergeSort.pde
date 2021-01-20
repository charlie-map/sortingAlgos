float[] mergeSorts(float[] array, int l, int r) {
  int middle = round((l + r) / 2);
  if (l >= r) {
    return array;
  }
  //get left side
  array = mergeSorts(array, l, middle);
  //get right side
  array = mergeSorts(array, middle + 1, r);
  return merge(array, l, middle, r);
}

float[] merge(float[] array, int l, int m, int r) {
  float[] left = new float[m - l + 1], right = new float[r - m];
  for (int leftFill = 0; leftFill < left.length; leftFill++) {
    left[leftFill] = array[l + leftFill];
  }
  for (int rightFill = 0; rightFill < right.length; rightFill++) {
    right[rightFill] = array[m + 1 + rightFill];
  }
  int currMergedPos = l, currLeftPos = 0, currRightPos = 0;
  while (currLeftPos < left.length && currRightPos < right.length) {
    if (left[currLeftPos] < right[currRightPos]) {
      //add left to merged first
      array[currMergedPos] = left[currLeftPos];
      currLeftPos++;
    } else {
      //add right to merged first
      array[currMergedPos] = right[currRightPos];
      currRightPos++;
    }
    currMergedPos++;
  }
  //add whatever remains in the other side (if there is any);
  while (currLeftPos < left.length) {
    array[currMergedPos] = left[currLeftPos];
    currMergedPos++;
    currLeftPos++;
  }
  while (currRightPos < right.length) {
    array[currMergedPos] = right[currRightPos];
    currMergedPos++;
    currRightPos++;
  }
  return array;
}
