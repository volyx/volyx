---
author: "volyx"
title: "AOC 2022. Day 3: Rucksack Reorganization "
date: "2022-12-04"
tags:  ["aof"]
categories: ["aof"]
# series: ["AOF"]
# aliases: ["migrate-from-jekyl"]
ShowToc: true
TocOpen: true
# weight: 2
---

[# Day 3: Rucksack Reorganization](https://adventofcode.com/2022/day/3)

--- Day 3: Rucksack Reorganization ---

One Elf has the important job of loading all of the rucksacks with supplies for the jungle journey. Unfortunately, that Elf didn't quite follow the packing instructions, and so a few items now need to be rearranged.

Each rucksack has two large compartments. All items of a given type are meant to go into exactly one of the two compartments. The Elf that did the packing failed to follow this rule for exactly one item type per rucksack.

The Elves have made a list of all of the items currently in each rucksack (your puzzle input), but they need your help finding the errors. Every item type is identified by a single lowercase or uppercase letter (that is, a and A refer to different types of items).

The list of items for each rucksack is given as characters all on a single line. A given rucksack always has the same number of items in each of its two compartments, so the first half of the characters represent items in the first compartment, while the second half of the characters represent items in the second compartment.

For example, suppose you have the following list of contents from six rucksacks:

````
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
```

- The first rucksack contains the items vJrwpWtwJgWrhcsFMMfFFhFp, which means its first compartment contains the items vJrwpWtwJgWr, while the second compartment contains the items hcsFMMfFFhFp. The only item type that appears in both compartments is lowercase p.
- The second rucksack's compartments contain jqHRNqRjqzjGDLGL and rsFMfFZSrLrFZsSL. The only item type that appears in both compartments is uppercase L.
- The third rucksack's compartments contain PmmdzqPrV and vPwwTWBwg; the only common item type is uppercase P.
- The fourth rucksack's compartments only share item type v.
- The fifth rucksack's compartments only share item type t.
- The sixth rucksack's compartments only share item type s.

To help prioritize item rearrangement, every item type can be converted to a priority:

- Lowercase item types a through z have priorities 1 through 26.
- Uppercase item types A through Z have priorities 27 through 52.

In the above example, the priority of the item type that appears in both compartments of each rucksack is 16 (p), 38 (L), 42 (P), 22 (v), 20 (t), and 19 (s); the sum of these is 157.

Find the item type that appears in both compartments of each rucksack. What is the sum of the priorities of those item types?

```go
package main

import (
	"bufio"
	"fmt"
	"os"
)

/*
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg

abcbde
3

wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw

16 (p), 38 (L), 42 (P), 22 (v), 20 (t), and 19 (s)
*/
func main() {
	readFile, err := os.Open("input.txt")

	if err != nil {
		fmt.Println(err)
	}
	defer readFile.Close()
	fileScanner := bufio.NewScanner(readFile)

	fileScanner.Split(bufio.ScanLines)
	var sum int64 = 0
	i := 0
	comp := [3][256]byte{}
	// 0 10
	// 1 10
	// 2 10

	for fileScanner.Scan() {
		rucksack := fileScanner.Text()
		index := i % 3
		for i := 0; i < len(rucksack); i++ {
			letter := rucksack[i]
			comp[index][letter]++
		}

		if index == 2 {
			for i := 0; i < 256; i++ {
				if comp[0][i] > 0 && comp[1][i] > 0 && comp[2][i] > 0 {
					letter := byte(i)
					priority := calcPriority(letter)
					// fmt.Println("priority", priority)
					sum = sum + priority
				}
				comp[0][i] = 0
				comp[1][i] = 0
				comp[2][i] = 0
			}
		}

		i++
	}

	fmt.Println("\n", sum)
}

func calcPriority(letter byte) int64 {

	priority := letter - byte('a') + 1
	if priority < 27 {
		// lowercase
	} else {
		// uppercase
		priority = letter - byte('A') + 27
	}

	return int64(priority)
}

// part 1
func calcCompartment(rucksack string) int64 {
	var sum int64 = 0
	comp := make(map[byte]int)
	visited := make(map[byte]int)
	fmt.Println()
	for i := 0; i < len(rucksack); i++ {
		letter := rucksack[i]

		if i < len(rucksack)/2 {
			fmt.Printf("%d - %c\n", i, letter)
			comp[letter] = 1
		} else {
			_, ok := comp[letter]

			// Lowercase item types a through z have priorities 1 through 26.
			// Uppercase item types A through Z have priorities 27 through 52.
			if !ok {
				// have in compartment, skip
				continue
			}
			_, ok = visited[letter]
			if ok {
				// already visited
				continue
			}
			visited[letter] = 1
			priority := calcPriority(letter)
			fmt.Println(priority)
			sum = sum + priority
		}
	}
	return sum
}
```
