

int[] bogoSort(int[] array) {
  while (!isSorted(array)) {
    array = scramble(array);
  }
  return array;
}

int[] scramble(int[] array) {
  
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
