---
title: "Beginning C++ Through Game Programming"
date: 2018-01-16
tags: ["Reference","C++","Books"]
toc: false
---

## Introduction
![cover-image](https://i.imgur.com/FAkscUk.png)


<br>
#### About the Book
A really good book to learn basics of C++ in an interactive way. Covers some basic and important topics like pointers and references along with some use of the Standard Template Library. Moves to some OOPs topics like inheritance and hierarchy

It covers a bit of AI programming, nothing near to bot-building algorithms or combinatorial search, but rather an introduction to thinking like an AI programmer.

The game programs are pretty well written for a beginner and they also teach how a programmer should plan out his programs before jumping into programming. Quite decent though nowhere near Knuth.

Dawson captures interest by his writing style and is capable of maintaining it until the end of the book. If you are a novice programmer I would suggest you use this book.

<br>
#### About the Author
Michael Dawson has worked as both a programmer and a computer game designer and producer. In addition to real-world game industry experience, Dawson earned his bachelor's degree in Computer Science from the University of Southern California. He currently teaches game programming and design to students of all ages through UCLA Extension courses and private lessons. 

<br>
## Reference

```cpp
/* beginning c++ through game programing, reference
   https://frainfreeze.github.io/post/bcpptgp/
   Tomislav Kucar, 2018-01-03
   Released into public domain */

#include <iostream> // contains cout, endl
#include <cstdlib> // for random numbers
#include <ctime> // to seed rnd num generator
#include <string>
#include <vector>
#include <algorithm> // STL algorithms
/* libraries with c prefix are from c library
and can be also written as <name.h>, for e.g.
<ctime> is same as <time.h> */

using namespace std;


// global variables are defined outside functions
// const type - expression with fixed value
const double PI = 3.14; // global constant value


// function prototypes //
/* if no argument given b will be set to 5, once
argument is specified we have to specify others
after it as well */
int sumNums(int a, int b = 5);

inline void printX(); // inline function

void swapNums(int& a, int& b);


// function definitions //
void printZ(int a){
    cout << a+1 << endl;
}

void printZ(string a){
    cout << a+" bar" << endl;
}

string& ref2element(vector<string>& barVec, int i){
    return barVec[i]; // returns reference
}

void pointerExample(int* pointy){
    cout << *pointy << endl;
}

void pointerExample(const int* pointy){
    cout << *pointy << endl;
}

//returns a pointer to a string element
string* ptrToElement(vector<string>* const pVec, int i);

int main() {
    /*
    expressions
     ! | NOT
    && | AND
    || | OR

    precedence levels
    ! > && > ||

    * deference operator
    ++ increment operator
    [] subscripting operator
    */


    // declaring variables //
    char word[] = "word"; // cstyle string

    // unsigned type - has 2x value but no negatives
    // int -1 to -128, 0 to 127, unsigned int 0 to 255
    unsigned int unsignedintA = 1212121;


    // casting //
    // static_cast<type>(value) - converting (casting) value to type
    int intA = 10;
    static_cast<unsigned int>(intA); // converts intA into unsigned int


    // enumeration - set of unsigned int constants (enumerators) //
    // if you assign value to enumerator next one will have +1 value
    enum fields { WORD, HINT, NUM_FIELDS, example1 = 23, example2 };

    // currentField is of type field and has value 2
    fields currentField = HINT;

    // has value 24 (its 1+ of previous enumerator)
    fields example2a = example2;

    cout << currentField << " " << example2a << endl;


    // conditionals //
    /*
    ==  true if left operand is equal to right operand
    !=  true if left operand is not equal to right operand
    >   true if left operand is greater than right operand
    <   true if left operand is less than right operand
    >=  true if left operand is greater than or equal than right operand
    <=  true if left operand is less than or equal than right operand

    0 is false, 1 is true
    */
    cout << (0 == false) << endl; // true, outputs 1
    cout << (1 == true) << endl; // true, outputs 1


    //// Statements and flow control ////
    // Selection statements: if; else if; else, switch //
    if (true){
       cout << "True." << endl;
    } else if (true){
        // statement
    } else {
        // if everything else fails
    }

    //switch
    char choice = 'a';
    switch(choice){
        case 'a':
            cout << "Statement." << endl;
            break; // end switch, otherwise continues onto next case
        default:
            //gets executed if choice was not found
            break;
    }


    // Iteration statements: while, do while, for //
    //infinite loops
    for(;;){
        int i = 1; ++i;
        if (i >= 2){
            break; // exits loop
        }
        cout << "Infinite for loop." << endl;
        continue; // goes into next loop iteration...
        cout << "Bamboozled."; // ...hence this never gets executed
    }

    while (true){
        cout << "Infinite while loop." << endl;
        break;
    }

    do{
        cout << "Infinite while loop." << endl;
        break;
    }while(true);

    // for in for
    // inner for gets executed in full for every outer for iteration
    for(int i = 0; i<1; i++){
        for(int j = 0; j<2; j++){
            cout << "In" << endl;
        }
        cout << "Out" << endl;
    }


    // random numbers //
    // seeding random number generator
    srand(static_cast<unsigned int>(time(0)));

    int randNum = rand(); // random number between 0 and RAND_MAX
    int randNums = (randNum%6) + 1; // random number between 1 and 6


    // strings //
    string str1 = "!!!!";
    string str2 = ("!!!!");
    string str3 = (4, "!");
    string str4;
    string str5 = "Very long string.";
    string::npos; // element that is not in the string/container

    /*
    .length()/.size() return number of chars in string object (unsigned int)
    .find() - checks if literal is contained in string, returns 1st occurrence
    .erase() - removes substring from string object
    .empty() - returns bool value, predicate functions return bool values
    */

    // returns true
    cout << ((str1.size()==str1.length()) && (str1.size()==4)) << endl;

    // searches for "long", starting at 3rd position
    cout << str5.find("long", 3) << endl;

    // deletes everything from position 1 onwards
    str1.erase(1);

    // deletes 8 chars starting at 9th position
    str5.erase(9,8);

    cout << str5 + str1 << endl;

    // returns true
    cout << (str4.empty() == true) << endl;

    if(str5.find("long") != string::npos)
        cout << "Phrase is in string." << endl;


    // arrays //
    const int MAX_WORDS = 10;

    // spam1.size() == 10, [0] == foo, [1] == bar
    string spam1[MAX_WORDS] = {"foo", "bar"};

    // spam2.size() == 2, [0] == foo, [1] == bar
    string spam2[] = {"foo", "bar"};

    spam1[3] = "spaz";
    cout << spam1[3].size() << endl; // 4

    // multidimensional array
    const int ROWS = 3;
    const int COLUMNS = 3;
    char board[ROWS][COLUMNS] = { {'O', 'X', 'O'},
                                  {'O', 'Z', 'X'},
                                  {'X', 'O', 'O'} };

    cout << "In the center of board is " << board[1][1] << endl;

    // printing multidimensional array
    for (int x = 0; x<3; x++){
        for (int y = 0; y<3; y++){
            cout << board[x][y];
        }
        cout << endl;
    }


    // iterators, vectors and algorithms //
    /* containers - objects that let you store and access collection of
                    elements of same type
       iterators - objects that identify elements in containers and can
                   be manipulated to move among the elements
       vector - sequential container
       sequential container - retrieves values in sequence
    */

    // vector filled with 10 "spam" strings
    vector<string> vec(10,"spam");

    // copy of vector vec
    vector<string> vecCopy(vec);

    vec.push_back("BAR");

    // add new element to the end of the vector
    vec.push_back("element 12");

    // remove last element from vector
    vec.pop_back();

    // .size() - vector size
    cout << "vec size: " <<vec.size() << endl;

    /* iterators are like post it notes that
    we stick on elements in container. they
    are way to refer to element and we can
    change or access elements through them */

    // declares iterator for vector that contains string objects
    vector<string>::iterator myIterator;

    // constant iterators - read only access
    vector<string>::const_iterator iter;

    // .begin() - first vector element
    vector<string>::const_iterator vecFirst = vec.begin();

    // .end() - one empty element after last element
    vector<string>::const_iterator vecLast = vec.end();

    // make iterator element on position 0
    myIterator = vec.begin();

    // change vec[0] to "FOO" using that iterator
    *myIterator = "FOO";

    // myIterator->size() is syntax sugar for (*myIterator).size()
    cout << "Vec[0] size: " << myIterator->size() << endl;

    // .insert() - inserts element in front of element referenced by iterator
    // example inserts "spam" on position 0, moves all other elements once place up

    // returns iterator referencing newly inserted element(?)
    vec.insert(vec.begin(), "spam");

    // .erase() - removes element from container(vector)
    vec.erase(myIterator);

    // random_shuffle(range) - randomly shuffles containers elements
    random_shuffle(vec.begin(),vec.end());

    // sort(range) - sorts item in ascending order
    sort(vec.begin(),vec.end());

    // print whole vector using iterators
    for (iter = vecFirst; iter != vecLast; ++iter){
        cout << *iter << " ";
    } cout << endl;

    // remove all elements and sets vector size to 0
    vec.clear();

    // .empty() - returns bool whether vector is empty
    cout << vec.empty() << endl;

    // toupper(letter) - uppercase letter

    /* capacity() vector member function returns the
    capacity of a vector. in other words, the number
    of elements that a vector can hold before a program
    must reallocate more memory for it. */
    cout << "Vec size is: " << vec.size()
         << " Vec capacity is: " << vec.capacity() << endl;

    /* reserve() member function increases the capacity
    of a vector to the number supplied as an argument,
    that number has to be bigger than current vec size */
    vec.reserve(21);

    cout << "Vec capacity is: " << vec.capacity() << endl;


    // scopes //
    int intC = 10;
    {
        // scope nested inside main scope
        int intC = 30; // we hided original intC by defining
        intC = 25; // actually changing intC, still, only inside the scope
    }
    cout << intC << endl;


    // functions //
    cout << sumNums(4) << endl; // 9

    // (inline) function gets inserted inhere by compiler
    // faster execution time for smaller functions
    printX();

    //overloading functions
    printZ(3);
    printZ("foo");


    // references //
    // nicknames for variables

    int intD = 10;

    // if we want to prevent reference modifying we use const
    const int& rIntD = intD;

    cout << rIntD << endl;

    int intE = 2; int intF = 3;
    swapNums(intE, intF);
    cout << intE << " " << intF << endl; // 3 2

    // small example of reference to reference
    vector<string> barVec;
    barVec.push_back("foo");
    barVec.push_back("bar");

    // assignees returned reference to reference
    string& rStr = ref2element(barVec,1);
    cout << rStr << endl; // bar
    rStr = "spaz"; // rStr == barVec[1]
    cout << barVec[1] << endl; // spaz


    // pointers //
    // a pointer is a variable that can contain a memory address
    int zz = 1;
    int zz2 = 343;
    string szz;

    //declare a pointer
    int* pAPointer;

    //declare and initialize a pointer
    string * pTestpointer = nullptr;

    // assign address of variable/object to the pointer
    pAPointer = &zz;
    pTestpointer = &szz;

    // reassign pointer to new pointee
    pAPointer = &zz2;

    // modify object pointer points too (pointee) by deferencing
    *pTestpointer = "test string\n";

    // print pointer address then object it references
    cout << pAPointer << " | " << *pAPointer << endl;
    cout << pTestpointer << " | " << *pTestpointer;

    /* constant pointers can only point to objects
    they were initialized to point to. like all constants
    they have to be initialized on declaration */
    int* const pConstatnPointer = &zz;

    // pointers to a constant cant be used to change
    // value they point to.
    const int* pZz;

    /* constant pointer to a constant combines the
    restrictions of a constant pointer and a pointer
    to a constant. This means that a constant pointer
    to a constant can only point to the object that it
    was initialized to point to. In addition, it can’t
    be used to change the value of the object to which
    it points*/
    const int* const pCPC = &zz2;

    // when passing pointers to function
    // we have to use address of object
    pointerExample(&zz);

    // ...which is same as using pointer
    pointerExample(pCPC);

    // returning pointers
    vector<string> tempVec(10,"spam");
    cout << *( ptrToElement(&tempVec, 3) ) << endl;

    // Assigning a Returned Pointer to a Pointer
    string* pMagic = ptrToElement(&tempVec, 3);
    *pMagic = "magic";
    cout << tempVec[3] << endl;

    // an array name is a constant pointer to
    // the first element of the array
    string tempArray[3] = {"foo", "bar", "spam"};
    *tempArray="hehexd";
    cout << tempArray[0] << endl;


    // classes and dynamic memory //


    // inheritance and polymorphism //


    return 0;
}


// function definitions //
int sumNums(int a, int b ){
    /* we don't respecify arguments in function
       definition if we did it in prototype */
    return a + b;
}

inline void printX(){
    cout << "Inline function." << endl;
}

void swapNums(int& a, int& b){
    int temp = a;
    a = b;
    b = temp;
}

string* ptrToElement(vector<string>* const pVec, int i){
    //returns address of the string in position
    // i of vector that pVec points to
    return &((*pVec)[i]);
}
```


[Code repo for this book](https://github.com/frainfreeze/studying/tree/master/home/C%2B%2B/beginnigC%2B%2BTGP)

<br>
If you want more detailed notes covering wider range of C++ refer to my notes [here](/other/notes). 