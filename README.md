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
