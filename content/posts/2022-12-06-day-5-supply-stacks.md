---
author: "volyx"
title: "AOC 2022. Day 5: Supply Stacks  "
date: "2022-12-06"
tags:  ["aof"]
categories: ["aof"]
# series: ["AOF"]
# aliases: ["migrate-from-jekyl"]
ShowToc: true
TocOpen: true
# weight: 2
---

https://adventofcode.com/2022/day/5

--- Day 5: Supply Stacks ---
The expedition can depart as soon as the final supplies have been unloaded from the ships. Supplies are stored in stacks of marked crates, but because the needed supplies are buried under many other crates, the crates need to be rearranged.

The ship has a giant cargo crane capable of moving crates between stacks. To ensure none of the crates get crushed or fall over, the crane operator will rearrange them in a series of carefully-planned steps. After the crates are rearranged, the desired crates will be at the top of each stack.

The Elves don't want to interrupt the crane operator during this delicate procedure, but they forgot to ask her which crate will end up where, and they want to be ready to unload them as soon as possible so they can embark.

They do, however, have a drawing of the starting stacks of crates and the rearrangement procedure (your puzzle input). For example:

```
    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
```

In this example, there are three stacks of crates. Stack 1 contains two crates: crate Z is on the bottom, and crate N is on top. Stack 2 contains three crates; from bottom to top, they are crates M, C, and D. Finally, stack 3 contains a single crate, P.

Then, the rearrangement procedure is given. In each step of the procedure, a quantity of crates is moved from one stack to a different stack. In the first step of the above rearrangement procedure, one crate is moved from stack 2 to stack 1, resulting in this configuration:

```
[D]        
[N] [C]    
[Z] [M] [P]
 1   2   3 

In the second step, three crates are moved from stack 1 to stack 3. Crates are moved one at a time, so the first crate to be moved (D) ends up below the second and third crates:

        [Z]
        [N]
    [C] [D]
    [M] [P]
 1   2   3
Then, both crates are moved from stack 2 to stack 1. Again, because crates are moved one at a time, crate C ends up below crate M:

        [Z]
        [N]
[M]     [D]
[C]     [P]
 1   2   3
Finally, one crate is moved from stack 1 to stack 2:

        [Z]
        [N]
        [D]
[C] [M] [P]
 1   2   3
The Elves just need to know which crate will end up on top of each stack; in this example, the top crates are C in stack 1, M in stack 2, and Z in stack 3, so you should combine these together and give the Elves the message CMZ.
```

After the rearrangement procedure completes, what crate ends up on top of each stack?

--- Part Two ---
As you watch the crane operator expertly rearrange the crates, you notice the process isn't following your prediction.

Some mud was covering the writing on the side of the crane, and you quickly wipe it away. The crane isn't a CrateMover 9000 - it's a CrateMover 9001.

The CrateMover 9001 is notable for many new and exciting features: air conditioning, leather seats, an extra cup holder, and the ability to pick up and move multiple crates at once.

Again considering the example above, the crates begin in the same configuration:


```
    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 
Moving a single crate from stack 2 to stack 1 behaves the same as before:

[D]        
[N] [C]    
[Z] [M] [P]
 1   2   3 
However, the action of moving three crates from stack 1 to stack 3 means that those three moved crates stay in the same order, resulting in this new configuration:

        [D]
        [N]
    [C] [Z]
    [M] [P]
 1   2   3
Next, as both crates are moved from stack 2 to stack 1, they retain their order as well:

        [D]
        [N]
[C]     [Z]
[M]     [P]
 1   2   3
Finally, a single crate is still moved from stack 1 to stack 2, but now it's crate C that gets moved:

        [D]
        [N]
        [Z]
[M] [C] [P]
 1   2   3
In this example, the CrateMover 9001 has put the crates in a totally different order: MCD.
```

Before the rearrangement process finishes, update your simulation so that the Elves know where they should stand to be ready to unload the final supplies. After the rearrangement procedure completes, what crate ends up on top of each stack?

```go
package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

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
	var n int = 0

	line := ""
	isMove := false
	var arr [][]byte
	for fileScanner.Scan() {
		line = fileScanner.Text()
		if i == 0 {
			n = len(line) / 3
			fmt.Println("n=", n)
			for k := 0; k < n; k++ {
				arr = append(arr, []byte{})
			}
		}
		if !isMove {
			for j := 0; j < len(line); j++ {
				c := line[j]
				if c == '[' {
					index := j / 4
					fmt.Printf("c=%c byte=%d j=%d, index=%d\n", c, line[j+1], j, index)
					// prepend
					arr[index] = append([]byte{line[j+1]}, arr[index]...)
				}
			}
		} else {
			// move lines
			// move 1 from 2 to 1
			parts := strings.Split(line, " ")
			var moveIdx, fromIdx, toIdx int
			j := 0
			for _, part := range parts {
				val, err := strconv.Atoi(part)
				if err == nil {
					if j == 0 {
						moveIdx = val
					}
					if j == 1 {
						fromIdx = val
					}
					if j == 2 {
						toIdx = val
					}
					j++
				}
			}
			// fmt.Println(line, moveIdx, fromIdx, toIdx)

			move(moveIdx, fromIdx, toIdx, &arr)
		}

		if len(line) == 0 {
			// print
			for x := 0; x < len(arr); x++ {
				fmt.Println(arr[x])
			}
			isMove = true
		}

		/*
			[78 90]
			[68 67 77]
			[80]
		*/

		fmt.Println()
		// fmt.Println(line, len(line))
		i++
	}

	/*
		    [D]
		[N] [C]
		[Z] [M] [P]
		1   2   3

		1 ZN
		2 MCD
		3 P

		1
		2
		3

	*/

	fmt.Println("\n", sum)

	for x := 0; x < len(arr); x++ {
		if len(arr[x]) > 0 {
			fmt.Printf("%c", arr[x][len(arr[x])-1])
		}

	}
}

func move(count int, from int, to int, arr *[][]byte) {
	if count == 1 {
		moveOne(from-1, to-1, arr)
	} else {
		var temp []byte
		fromStack := (*arr)[from-1]
		for i := 0; i < count; i++ {
			fromLen := len(fromStack)
			el := fromStack[fromLen-1]
			fromStack = fromStack[:fromLen-1]
			// moveOne(from-1, to-1, arr)
			temp = append(temp, el)
		}
		(*arr)[from-1] = fromStack
		toStack := (*arr)[to-1]
		for i := 0; i < count; i++ {
			toStack = append(toStack, temp[count-i-1])
		}
		(*arr)[to-1] = toStack
	}
}

func moveOne(from int, to int, arr *[][]byte) {

	fromStack := (*arr)[from]
	fromLen := len(fromStack)
	el := fromStack[fromLen-1]

	fromStack = fromStack[:fromLen-1] // reslice it

	toStack := (*arr)[to]

	toStack = append(toStack, el)

	(*arr)[from] = fromStack
	(*arr)[to] = toStack
}

/*
if len(slice) > 0 {
    slice = slice[:len(slice)-1]
}
*/

```
