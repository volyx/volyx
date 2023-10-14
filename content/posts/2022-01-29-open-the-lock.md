---
author: "volyx"
title: "752. Open the Lock"
date: "2022-01-29"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "bfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![752. Open the Lock](https://leetcode.com/problems/open-the-lock/)

You have a lock in front of you with 4 circular wheels. Each wheel has 10 slots: '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'. The wheels can rotate freely and wrap around: for example we can turn '9' to be '0', or '0' to be '9'. Each move consists of turning one wheel one slot.

The lock initially starts at '0000', a string representing the state of the 4 wheels.

You are given a list of deadends dead ends, meaning if the lock displays any of these codes, the wheels of the lock will stop turning and you will be unable to open it.

Given a target representing the value of the wheels that will unlock the lock, return the minimum total number of turns required to open the lock, or -1 if it is impossible.

```txt
Example 1:

Input: deadends = ["0201","0101","0102","1212","2002"], target = "0202"
Output: 6
Explanation: 
A sequence of valid moves would be "0000" -> "1000" -> "1100" -> "1200" -> "1201" -> "1202" -> "0202".
Note that a sequence like "0000" -> "0001" -> "0002" -> "0102" -> "0202" would be invalid,
because the wheels of the lock become stuck after the display becomes the dead end "0102".
```

```txt
Example 2:

Input: deadends = ["8888"], target = "0009"
Output: 1
Explanation: We can turn the last wheel in reverse to move from "0000" -> "0009".
```

```txt
Example 3:

Input: deadends = ["8887","8889","8878","8898","8788","8988","7888","9888"], target = "8888"
Output: -1
Explanation: We cannot reach the target without getting stuck.
```

Constraints:

- 1 <= deadends.length <= 500
- deadends[i].length == 4
- target.length == 4
- target will not be in the list deadends.
- target and deadends[i] consist of digits only.

## Solution BFS

```java
class Solution {

    public int openLock(String[] deadends, String target) {
        Set<String> deadSet = new HashSet<>(Arrays.asList(deadends));
        
        Queue<String> q = new ArrayDeque<>();
        q.add("0000");
        int level = 0;
        while (q.size() > 0) {
            
            int qSize = q.size();
            
            for (int i = 0; i < qSize; i++) {
                String code = q.poll();
                if (code.equals(target)) {
                    return level;
                }
                if (deadSet.contains(code)) {
                    continue;
                }
                deadSet.add(code);
                List<String> nextCodes = generateNextCodes(code);
                q.addAll(nextCodes);
            }
            level++;
        }
        return -1;
    }
    
    List<String> generateNextCodes(String code) {
        List<String> res = new ArrayList<>();
        for (int i = 0; i < code.length(); i++) {
            int digit = (int) (code.charAt(i) - '0');
            res.add(code.substring(0, i) + ((digit + 1) % 10) + code.substring(i + 1));
            res.add(code.substring(0, i) + ((digit + 10 - 1) % 10) + code.substring(i + 1));
        }
        return res;
    }
}
```
