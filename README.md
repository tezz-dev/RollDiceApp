# RollDiceApp

It has the bug in which whenever we hange the axis of rotation, there is no animation for the first time. The transition does not exist.

Look at only BoxView.swift

Some hints to fix this bugs:
1. look at currentXAxis, currentYAxis, horizontalTranslation
2. try adding your own transition
3. try the
```c
withAnimation {
  //code
}
```

If you get the solution, either email it to me at 1ms18is117@gmail.com
or send it through whatsapp no. +91 861 89 83 585

To do : 
1. Fix the bug
2. Add inner stroke to each side of the die
3. Roll button to arbitrarily roll the die and get a result
4. Improve the roll animation
5? Multiple dice?
6? Dealer v/s user : If the user wins +1, if the dealer wins -1
