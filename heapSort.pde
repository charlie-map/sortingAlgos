float[] heapSorter(float[] array) {
  int heapSize;
  heapSize = array.length;
  array = buildMaxHeap(array);
  for (int i = array.length - 1; i > 0; i--) {
    float buffer = array[0];
    array[0] = array[i];
    array[i] = buffer;
    heapSize--;
    array = maxHeapify(array, 0, heapSize);
  }
  return array;
}

float[] buildMaxHeap(float[] array) {
  for (int i = array.length; i > -1; i--) {
    array = maxHeapify(array, i, array.length);
  }
  return array;
}

float[] maxHeapify(float[] array, int positionChanger, int heapSize) {
  int largest = positionChanger;
  int left = 2 * positionChanger + 1;
  int right = 2 * positionChanger + 2;
  if (left < heapSize && array[left] > array[largest]) {
    largest = left;
  }
  if (right < heapSize && array[right] > array[largest]) {
    largest = right;
  }
  if (largest != positionChanger) {
     float buffer = array[positionChanger];
     array[positionChanger] = array[largest];
     array[largest] = buffer;
     array = maxHeapify(array, largest, heapSize);
  }
  return array;
}
