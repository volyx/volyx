---
author: "volyx"
title:  "249. Group Shifted Strings"
date: "2021-11-23"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "string"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![249. Group Shifted Strings](hhttps://leetcode.com/problems/group-shifted-strings/)

We can shift a string by shifting each of its letters to its successive letter.

- For example, "abc" can be shifted to be "bcd".

We can keep shifting the string to form a sequence.

- For example, we can keep shifting "abc" to form the sequence: "abc" -> "bcd" -> ... -> "xyz".

Given an array of strings strings, group all strings[i] that belong to the same shifting sequence. You may return the answer in any order.

```txt
Example 1:

Input: strings = ["abc","bcd","acef","xyz","az","ba","a","z"]
Output: [["acef"],["a","z"],["abc","bcd","xyz"],["az","ba"]]

Example 2:

Input: strings = ["a"]
Output: [["a"]]
```

Constraints:

- 1 <= strings.length <= 200
- 1 <= strings[i].length <= 50
- strings[i] consists of lowercase English letters.

## Solution

```java
class Solution {
    public List<List<String>> groupStrings(String[] strings) {
        Map<String, List<String>> map = new HashMap<>();
        
        for (String str: strings) {
            String offsets = buildOffset(str); // 012
            List<String> words = map.getOrDefault(offsets, new ArrayList<>());
            words.add(str);
            map.put(offsets, words);
        }
        
        return new ArrayList<>(map.values());
    }
    
    String buildOffset(String str) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < str.length(); i++) {
            int val = str.charAt(i) - str.charAt(0);
            sb.append((val + 26) % 26);
            sb.append('#');
        }
        return sb.toString();
    } 
}
```

## Solution 2022-01-28

```java
class Solution {
    public List<List<String>> groupStrings(String[] strings) {
        if (strings.length == 0) {
                return Collections.emptyList();
        }

        Map<String, List<String>> encodingMap = new HashMap<>();

        for (String str: strings) {

            String encodingKey = encode(str);
            List<String> encodingValues = 
        encodingMap.getOrDefault(encodingKey, new ArrayList<>());
            encodingValues.add(str);
            encodingMap.put(encodingKey, encodingValues);
        }

        List<List<String>> res = new ArrayList<>();

        for (List<String> encodingValues: encodingMap.values()) {
            res.add(encodingValues);
        }
        return res;

    }
    
    
    String encode(String input) {
        List<String> numbers = new ArrayList();
        for (int i = 0; i < input.length(); i++) {
            char c = input.charAt(i);
            if (i == 0) {
                numbers.add("0");    
            } else {
                int shiftedIndex = (int) (c - input.charAt(0));
                if (shiftedIndex < 0) {
                    shiftedIndex += 26; // -26 - 0
                }
                numbers.add(shiftedIndex + "");
            }
        }
        return String.join("-", numbers);
    }

}
```
