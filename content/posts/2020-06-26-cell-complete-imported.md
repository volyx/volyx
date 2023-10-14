---
author: "volyx"
title:  "Cell Complete"
date: "2020-06-26"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Cell compete:

Eight houses, represented as a cells, are arranged as a straight line.
Each days every cells competes with adjacent cells. An integer value 1
represents an active cell and a value of 0 represent an inactive cell.
if the neigbour on both the sides of the cell are both active or inactive,
the cell become inactive in the next day, otherwise the become active.
The two cells on each or have a single adjacent cell, so asume that
the onoccupied space in the opposite side is an inactive cell. even after
updating the cell state, consider its previus state when updating the state
of ohters cells. The state information of the cells should be updated simultaneosly.

Write an algorithm to output the state of the cell after the given number of the cell
input: the input to the function consist on two arguments:
states, a list of integer representing the current state of cells;
dasy, an integer representing the number of days
output

Return a list of integers representing the state of the cells after the given number of days.

Note: the elements of the list states contains 0s or 1s only
```

Solution:

```java

public class Colony {

    public static int[] cellCompete(int[] cells, int days) {

        int len = cells.length;
        int[] newCells = new int[cells.length];
        for (int k = 0; k < days; k++) {
            for (int i = 0; i < cells.length; i++) {
                int cell = cells[i];
                int nextCell;
                int prevCell;
                int activenumber;
                if (i == 0) {
                    // edge cases
                    nextCell = cells[1];
                    prevCell = 0;
                } else if (i == cells.length - 1) {
                    // edge case
                    prevCell = cells[cells.length - 2];
                    nextCell = 0;
                } else {
                    nextCell = cells[i + 1];
                    prevCell = cells[i - 1];
                }
                if (nextCell == prevCell) {
                    // set it to inactive
                    activenumber = 0;
                } else {
                    //set it to active
                    activenumber = 1;
                }
                newCells[i] = activenumber;
            }
            for (int i = 0; i < 8; i++) {
                cells[i] = newCells[i];
            }
        }
        return newCells;
    }
    public static void main(String[] args) {
        int[] array = {1,0,0,0,0,1,0,0};
        int days = 1;
        array = cellCompete(array, days);
        for (int i = 0; i < array.length; i++) {
            System.out.print(array[i]);
        }
    }
}

