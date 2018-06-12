# heapsort -- heapsort uses a data structure called a heap to maintain the priority queue
#  a heap can be thinked of a binary tree with two properties
#  properties 1: the tree is balanced ; properties 
# 2: the tree is partilly ordered. the partilly ordered property  of the elements in a heap means that A[i] is greater
# than or equal to its children at A[2i] and A[2i+1], or its child at A[2i] if there is only one child.
# If the element of an array satisfy this condition, we say that  the  array has the "heap property"



# heap sort
    {  A[NR]= $0}
END { 
       hsort(A,NR)
       for(i=1;i<=NR;i++)
            { print A[i] }
}



# two phases to implement heapsort, building a heap and extracting the elements in ordered

function hsort(A,n,    i){
    for (i = int(n/2); i>=1; i--)
        { heapify(A,i,n)}  # phase1 buiding a heap 
    for (i = n; i>1; i--){
        {swap(A,1,i)}
        {heapify(A,1,i-1)}
    }
}


#heapify function is to give subarray A[i]..A[j] the heap property, assuming A[i+1]..A[j]already has the property.
function heapify(A,left,right,        p,c){
    for (p = left;(c= 2*p)<= right; p=c){
        if (c<right && A[c+1]>A[c])
            {c++}
        if (A[p] <A[c])
            {swap(A, c,p)}
    }
} 
function swap(A,i,j,    t){
    t=A[i]; A[i] = A[j]; A[j] =t
}