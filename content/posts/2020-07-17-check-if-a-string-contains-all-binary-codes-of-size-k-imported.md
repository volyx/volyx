---
author: "volyx"
title:  "Check If a String Contains All Binary Codes of Size K"
date: "2020-07-17"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "mock"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given a binary string s and an integer k.

Return True if every binary code of length k is a substring of s. Otherwise, return False.

Example 1:

```txt
Input: s = "00110110", k = 2
Output: true
Explanation: The binary codes of length 2 are "00", "01", "10" and "11". They can be all found as substrings at indicies 0, 1, 3 and 2 respectively.
```

Example 2:

```txt
Input: s = "00110", k = 2
Output: true
```

Example 3:

```txt
Input: s = "0110", k = 1
Output: true
Explanation: The binary codes of length 1 are "0" and "1", it is clear that both exist as a substring. 
```

Example 4:
```
Input: s = "0110", k = 2
Output: false
Explanation: The binary code "00" is of length 2 and doesn't exist in the array.
```

Example 5:
```
Input: s = "0000000001011100", k = 4
Output: false
```

Constraints:
- 1 <= s.length <= 5 * 10^5
- s consists of 0's and 1's only.
- 1 <= k <= 20

Solution:

```java
class Solution {

    public boolean hasAllCodes(String s, int k) {
        int len = (int) Math.pow(2, k);
        boolean[] bitSet = new boolean[len];
        if (s.length() <= k) {
            return false;
        }
        int counter = 0;
        for (int i = 0; i < s.length(); i++) {
            if (i + k <= s.length()) {
                String val = s.substring(i, i + k);
                int bit = Integer.valueOf(val, 2);  
                if (bitSet[bit] == false) {
                    bitSet[bit] = true;
                    counter++;
                    if (len == counter) {
                        return true;
                    }
                }

            }
        }
        return false;
    }

    public boolean hasAllCodes2(String s, int k) {
        Set<Integer> set = new HashSet<>();
        if (s.length() <= k) {
            return false;
        }
        for (int i = 0; i < s.length(); i++) {
            if (i + k <= s.length()) {
                String val = s.substring(i, i + k);
                Integer b = Integer.valueOf(val, 2);
                set.add(b);
            }
        }
        return set.size() == (int) Math.pow(2, k);
    }
}
