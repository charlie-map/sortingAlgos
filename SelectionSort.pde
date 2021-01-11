float[] selectSort(float[] anyList) {
  int highestVal;
  for (int i = 0; i < anyList.length; i++) {
    highestVal = i;
    for (int j = i; j < anyList.length; j++) {
      if (anyList[j] > anyList[highestVal]) {
        highestVal = j;
      }
    }
    if (anyList[i] < anyList[highestVal]) {
      float buffer = anyList[i];
      anyList[i] = anyList[highestVal];
      anyList[highestVal] = buffer;
    }
  }
  return anyList;
}
