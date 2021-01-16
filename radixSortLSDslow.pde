int[] radixLSDsortSlow(int[] array) {
  String[] sortSec = new String[array.length];
  int largest = 0;
  for (int i = 0; i < array.length; i++) {
    largest = largest < array[i] ? array[i] : largest;
  }
  largest = str(largest).length();
  for (int arrP = 0; arrP < array.length; arrP++) {
    String newVal = "";
    int zeros = largest - str(array[arrP]).length();
    for (int j = 0; j < zeros; j++) {
      newVal += "0";
    }
    sortSec[arrP] = newVal + str(array[arrP]);
  }
  int[][] newArr = new int[sortSec.length][2];
  for (int i = largest - 1; i > -1; i--) {
    for (int j = 0; j < sortSec.length; j++) {
      newArr[j][0] = j;
      newArr[j][1] = int(sortSec[j].substring(i, i+1));
    }
    newArr = countSort(newArr);
    //working here now to see what's being returned:
    String[] newSort = new String[array.length];
    for (int j = 0; j < newArr.length; j++) {
      newSort[j] = sortSec[newArr[j][0]];
    }
    for (int j = 0; j < newArr.length; j++) {
      sortSec[j] = newSort[j];
    }
  }
  for (int i = 0; i < array.length; i++) {
    array[i] = int(sortSec[i]);
  }
  return array;
}

int[][] countSort(int[][] array) {
  String[] oPos = new String[10];
  for (int i = 0; i < 10; i++) {
    oPos[i] = "";
  }
  int[] counts = new int[10];
  for (int i = 0; i < array.length; i++) {
    counts[array[i][1]] += 1;
    oPos[array[i][1]] += str(i).length() + str(i);
  }
  int arrPos = 0;
  for (int i = 0; i < counts.length; i++) {
    if (counts[i] != 0) {
      for (int j = 0; j < counts[i]; j++) {
        int len = int(oPos[i].substring(0, 1));
        array[arrPos][0] = int(oPos[i].substring(1, len + 1));
        array[arrPos][1] = i;
        arrPos++;
        oPos[i] = oPos[i].substring(len + 1);
      }
    }
  }
  return array;
}
