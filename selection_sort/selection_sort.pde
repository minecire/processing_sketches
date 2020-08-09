void setup(){
  for(int i = 0; i<=10; i++){
    println(i);
  }
  int[] array = {7, 2, 3, 9, 6, 4};
  println(array);
  selectionsort(array);
  println(array);
}
void swap(int[] array,int loc1,int loc2){
  int a = array[loc1];
  int b = array[loc2];
  array[loc1] = b;
  array[loc2] = a;
}
// return index to smallest number in array[index]..array[length-1]
int findMinIndex(int[] array, int index){
  int minIndex = index;
  for(int i = index; i<array.length; i++){
    if(array[minIndex] > array[i]){
      minIndex = i;
    }
  }
  return minIndex;
}
void selectionsort(int[] array){
  for(int i = 0; i<array.length; i++){
    swap(array, i, findMinIndex(array, i));
  }
}