---
author: "volyx"
title: "AOC 2022. Day 8: Treetop Tree House"
date: "2022-12-10"
tags:  ["aof"]
categories: ["aof"]
# series: ["AOF"]
# aliases: ["migrate-from-jekyl"]
ShowToc: true
TocOpen: true
# weight: 2
---

--- Day 8: Treetop Tree House ---
The expedition comes across a peculiar patch of tall trees all planted carefully in a grid. The Elves explain that a previous expedition planted these trees as a reforestation effort. Now, they're curious if this would be a good location for a tree house.

First, determine whether there is enough tree cover here to keep a tree house hidden. To do this, you need to count the number of trees that are visible from outside the grid when looking directly along a row or column.

The Elves have already launched a quadcopter to generate a map with the height of each tree (your puzzle input). For example:
```
30373
25512
65332
33549
35390
Each tree is represented as a single digit whose value is its height, where 0 is the shortest and 9 is the tallest.
```
A tree is visible if all of the other trees between it and an edge of the grid are shorter than it. Only consider trees in the same row or column; that is, only look up, down, left, or right from any given tree.

All of the trees around the edge of the grid are visible - since they are already on the edge, there are no trees to block the view. In this example, that only leaves the interior nine trees to consider:

The top-left 5 is visible from the left and top. (It isn't visible from the right or bottom since other trees of height 5 are in the way.)
The top-middle 5 is visible from the top and right.
The top-right 1 is not visible from any direction; for it to be visible, there would need to only be trees of height 0 between it and an edge.
The left-middle 5 is visible, but only from the right.
The center 3 is not visible from any direction; for it to be visible, there would need to be only trees of at most height 2 between it and an edge.
The right-middle 3 is visible from the right.
In the bottom row, the middle 5 is visible, but the 3 and 4 are not.
With 16 trees visible on the edge and another 5 visible in the interior, a total of 21 trees are visible in this arrangement.

Consider your map; how many trees are visible from outside the grid?


--- Part Two ---
Content with the amount of tree cover available, the Elves just need to know the best spot to build their tree house: they would like to be able to see a lot of trees.

To measure the viewing distance from a given tree, look up, down, left, and right from that tree; stop if you reach an edge or at the first tree that is the same height or taller than the tree under consideration. (If a tree is right on the edge, at least one of its viewing distances will be zero.)

The Elves don't care about distant trees taller than those found by the rules above; the proposed tree house has large eaves to keep it dry, so they wouldn't be able to see higher than the tree house anyway.

In the example above, consider the middle 5 in the second row:
```
30373
25512
65332
33549
35390
Looking up, its view is not blocked; it can see 1 tree (of height 3).
Looking left, its view is blocked immediately; it can see only 1 tree (of height 5, right next to it).
Looking right, its view is not blocked; it can see 2 trees.
Looking down, its view is blocked eventually; it can see 2 trees (one of height 3, then the tree of height 5 that blocks its view).
A tree's scenic score is found by multiplying together its viewing distance in each of the four directions. For this tree, this is 4 (found by multiplying 1 * 1 * 2 * 2).
```
However, you can do even better: consider the tree of height 5 in the middle of the fourth row:
```
30373
25512
65332
33549
35390
Looking up, its view is blocked at 2 trees (by another tree with a height of 5).
Looking left, its view is not blocked; it can see 2 trees.
Looking down, its view is also not blocked; it can see 1 tree.
Looking right, its view is blocked at 2 trees (by a massive tree of height 9).
This tree's scenic score is 8 (2 * 2 * 1 * 2); this is the ideal spot for the tree house.
```
Consider each tree on your map. What is the highest scenic score possible for any tree?

```go
package main

import (
	"bufio"
	"fmt"
	"os"
)

type Node struct {
	name   string
	parent *Node
	child  []*Node
	size   int
	isDir  bool
}

func main() {
	readFile, err := os.Open("input.txt")

	if err != nil {
		fmt.Println(err)
	}
	defer readFile.Close()
	fileScanner := bufio.NewScanner(readFile)

	fileScanner.Split(bufio.ScanLines)
	line := ""
	var rows int = 0
	var cols int = 0
	forest := [][]int{}
	var bottomUp, topDown, left, right, score [][]int
	for fileScanner.Scan() {
		line = fileScanner.Text()
		rows++
		if cols == 0 {
			cols = len(line)

		}
		println(line)
		forest = append(forest, bytesToInts(line))
		bottomUp = append(bottomUp, bytesToInts(line))
		topDown = append(topDown, bytesToInts(line))
		left = append(left, bytesToInts(line))
		right = append(right, bytesToInts(line))
		score = append(score, bytesToInts(line))

	}
	total := 0
	initUp(&bottomUp)
	initDown(&topDown)
	initLeft(&left)
	initRight(&right)

	println("down")
	// printForest(&down)

	println("left")
	// printForest(&left)

	println("right")
	// printForest(&right)

	println("forest")
	// printForest(&forest)

	for i := 0; i < rows; i++ {
		for j := 0; j < cols; j++ {

			if i == 0 || j == 0 || i == rows-1 || j == cols-1 {
				total++
				continue
			}

			if forest[i][j] > bottomUp[i+1][j] ||
				forest[i][j] > right[i][j-1] ||
				forest[i][j] > topDown[i-1][j] ||
				forest[i][j] > left[i][j+1] {
				println("i=", i, "j=", j, "val=", forest[i][j])
				total++
			}
		}
	}

	println("total", total)
	maxScore := 0
	for i := 0; i < rows; i++ {
		for j := 0; j < cols; j++ {

			// up
			upScore := 0
			for k := i - 1; k >= 0; k-- {
				if forest[k][j] < forest[i][j] {
					upScore++
				} else {
					upScore++
					break
				}
			}

			// right
			rightScore := 0
			for k := j + 1; k < cols; k++ {
				if forest[i][k] < forest[i][j] {
					rightScore++
				} else {
					rightScore++
					break
				}
			}

			// down
			downScore := 0
			for k := i + 1; k < rows; k++ {
				if forest[k][j] < forest[i][j] {
					downScore++
				} else {
					downScore++
					break
				}
			}

			// left
			leftScore := 0
			for k := j - 1; k >= 0; k-- {
				if forest[i][k] < forest[i][j] {
					leftScore++
				} else {
					leftScore++
					break
				}
			}
			// println("i=", i, "j=", j)
			// println("upScore", upScore, "downScore", downScore, "leftScore", leftScore, "rightScore", rightScore)
			score[i][j] = upScore * downScore * leftScore * rightScore
			maxScore = max(maxScore, score[i][j])
		}
	}
	println("score")
	printForest(&score)
	println("maxScore", maxScore)
}

func printForest(f *[][]int) {
	for i := 0; i < len(*f); i++ {
		fmt.Printf("%v\n", (*f)[i])
	}
}

func bytesToInts(line string) []int {
	res := []int{}

	for i := 0; i < len(line); i++ {
		res = append(res, int(line[i]-48))
	}
	return res
}

func initUp(up *[][]int) {
	// 2
	// 1
	// 0
	rows := len(*up)
	cols := len((*up)[0])
	for j := 0; j < cols; j++ {
		for i := rows - 2; i >= 0; i-- {
			(*up)[i][j] = max((*up)[i][j], (*up)[i+1][j])
		}
	}
}

func initDown(down *[][]int) {
	rows := len(*down)
	cols := len((*down)[0])
	for j := 0; j < cols; j++ {
		for i := 1; i < rows; i++ {
			(*down)[i][j] = max((*down)[i][j], (*down)[i-1][j])
		}
	}
}

func initLeft(left *[][]int) {
	rows := len(*left)
	cols := len((*left)[0])
	for i := 0; i < rows; i++ {
		for j := cols - 2; j >= 0; j-- {
			(*left)[i][j] = max((*left)[i][j], (*left)[i][j+1])
		}
	}
}

func initRight(right *[][]int) {
	rows := len(*right)
	cols := len((*right)[0])
	for i := 0; i < rows; i++ {
		for j := 1; j < cols; j++ {
			(*right)[i][j] = max((*right)[i][j], (*right)[i][j-1])
		}
	}
}

func max(a, b int) int {
	if a > b {
		return a
	} else {
		return b
	}
}

```