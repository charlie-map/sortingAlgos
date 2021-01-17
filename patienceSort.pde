int[] patienceSorts(int[] unsortArray) {
  int[] childFinder = new int[unsortArray.length];
  int[] sortArray = new int[unsortArray.length];
  int largest = 0;
  for (int curritem = 0; curritem < unsortArray.length; curritem++) {
    //check all the other current parents that are available
    largest = unsortArray[curritem] > largest ? unsortArray[curritem] : largest;
    for (int childFinding = 0; childFinding < curritem; childFinding++) {
      //run through and check different pairings
      if (unsortArray[curritem] < unsortArray[childFinding] && childFinder[childFinding] == 0) {
        //now we know that our new position can connect to the end of this <- set this position as the arrays parent
        childFinder[childFinding] = curritem;
        childFinding = curritem;
      }
    }
    //we want this new position to be available as a root, so we leave it = 0;
  }
  int[] smallest = new int[2];
  int childsPos = 0;
  for (int checkAllVals = 0; checkAllVals < unsortArray.length; checkAllVals++) {
    smallest[0] = largest + 1;
    for (int sortVals = 0; sortVals < unsortArray.length; sortVals++) {
      //look for the places that have a value of 0
      if (childFinder[sortVals] == 0 && unsortArray[sortVals] < smallest[0]) {
        smallest[0] = unsortArray[sortVals];
        smallest[1] = sortVals;
        childsPos = sortVals;
      }
    }
    //then take whatever that value we got is and place it into the
    sortArray[checkAllVals] = unsortArray[smallest[1]];
    //need to make the parent have a now zero value
    for (int findParent = 0; findParent < unsortArray.length; findParent++) {
      if (childFinder[findParent] == childsPos) {
        childFinder[findParent] = 0;
      }
    }
    unsortArray[smallest[1]] = largest + 3;
  }
  return sortArray;
}
