---
author: "volyx"
title:  "244. Shortest Word Distance II"
date: "2021-06-08"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "array","string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[244. Shortest Word Distance II](https://leetcode.com/problems/shortest-word-distance-ii/)

Design a data structure that will be initialized with a string array, and then it should answer queries of the shortest distance between two different strings from the array.

Implement the WordDistance class:

- WordDistance(String[] wordsDict) initializes the object with the strings array wordsDict.
- int shortest(String word1, String word2) returns the shortest distance between word1 and word2 in the array wordsDict.

```txt
Example 1:

Input
["WordDistance", "shortest", "shortest"]
[[["practice", "makes", "perfect", "coding", "makes"]], ["coding", "practice"], ["makes", "coding"]]
Output
[null, 3, 1]

Explanation
WordDistance wordDistance = new WordDistance(["practice", "makes", "perfect", "coding", "makes"]);
wordDistance.shortest("coding", "practice"); // return 3
wordDistance.shortest("makes", "coding");    // return 1
```

Constraints:

- 1 <= wordsDict.length <= 3 * 104
- 1 <= wordsDict[i].length <= 10
- wordsDict[i] consists of lowercase English letters.
- word1 and word2 are in wordsDict.
- word1 != word2
- At most 5000 calls will be made to shortest.

## Solution

```java
class WordDistance {
    
    Map<String, List<Integer>> map = new HashMap<>();

    public WordDistance(String[] wordsDict) {
        for (int i = 0; i < wordsDict.length; i++) {
            String word = wordsDict[i];
            List<Integer> indexes = map.getOrDefault(word, new ArrayList<>());
            indexes.add(i);
            map.put(word, indexes);
        }
    }
    
    public int shortest(String word1, String word2) {
        int min = Integer.MAX_VALUE;
        for (Integer i: map.get(word1)) {
            for (Integer j: map.get(word2)) {
                min = Math.min(min, Math.abs(i - j));
            }
        }
        return min;
     }
}

/**
 * Your WordDistance object will be instantiated and called as such:
 * WordDistance obj = new WordDistance(wordsDict);
 * int param_1 = obj.shortest(word1,word2);
 */
```
