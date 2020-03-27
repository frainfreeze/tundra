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
 
    ...
```