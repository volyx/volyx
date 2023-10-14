---
author: "volyx"
title:  "190. Reverse Bits"
date: "2021-06-11"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "bit-manipulation"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[190. Reverse Bits](https://leetcode.com/problems/reverse-bits/)

Reverse bits of a given 32 bits unsigned integer.

Note:

- Note that in some languages such as Java, there is no unsigned integer type. In this case, both input and output will be given as a signed integer type. They should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
- In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 2 above, the input represents the signed integer -3 and the output represents the signed integer -1073741825.

Follow up:

If this function is called many times, how would you optimize it?

```txt
Example 1:

Input: n = 00000010100101000001111010011100
Output:    964176192 (00111001011110000010100101000000)
Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.

Example 2:

Input: n = 11111111111111111111111111111101
Output:   3221225471 (10111111111111111111111111111111)
Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is 10111111111111111111111111111111.
```

Constraints:

- The input must be a binary string of length 32

## Solution

```java
public class Solution {
    /*
    0101 = 5
    digit = 1
    res = 2^32 + 2^(32-2)
    i = 0;
    
    0010 = 2
    digit = 0;
    i = 1
    
    0001 = 1
    res = 2^32 + 2^(32 - 2)
    digit = 1
    i = 2
    
    
    0000
    res = 2^32 + 2^(32 - 2) + 2^(32-3)
    digit = 0
    i = 3
    
    */
    public int reverseBits(int n) {
        long res = 0;
        int i = 0;
        while (i < 32) {
            if ((n & 1) > 0) {
                 res += 1 << (31 - i);
            }
            n = n >> 1;
            i++;
        }
        return (int) res;
    }
}
```
