---
author: "volyx"
title:  "126. Word Ladder II"
date: "2021-11-25"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "hard", "bfs"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![126. Word Ladder II](https://leetcode.com/problems/https://leetcode.com/problems/bus-routes/)

A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:

- Every adjacent pair of words differs by a single letter.
- Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
- sk == endWord

Given two words, beginWord and endWord, and a dictionary wordList, return all the shortest transformation sequences from beginWord to endWord, or an empty list if no such sequence exists. Each sequence should be returned as a list of the words [beginWord, s1, s2, ..., sk].

```txt
Example 1:

Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
Output: [["hit","hot","dot","dog","cog"],["hit","hot","lot","log","cog"]]
Explanation: There are 2 shortest transformation sequences:
"hit" -> "hot" -> "dot" -> "dog" -> "cog"
"hit" -> "hot" -> "lot" -> "log" -> "cog"

Example 2:

Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
Output: []
Explanation: The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.
```

Constraints:

- 1 <= beginWord.length <= 5
- endWord.length == beginWord.length
- 1 <= wordList.length <= 1000
- wordList[i].length == beginWord.length
- beginWord, endWord, and wordList[i] consist of lowercase English letters.
- beginWord != endWord
- All the words in wordList are unique.

## Solution

```java
class Solution {
    public List<List<String>> findLadders(String beginWord, String endWord, List<String> wordList) {
        wordList.add(0, beginWord);
        
        List<List<Integer>> g = buildGraph(wordList);
        
        List<List<String>> res = new ArrayList<>();
        int min = Integer.MAX_VALUE;
        int target = wordList.indexOf(endWord);
        int source = wordList.indexOf(beginWord);
        Queue<Pair> q = new ArrayDeque<>();
        q.add(new Pair<Integer, List<String>>(source, new ArrayList<>()));
        int[] visited = new int[wordList.size()];
        
        while (q.size() > 0) {
            int size = q.size();
            for (int i = 0; i < size; i++) {
                Pair<Integer, List<String>> node = q.poll();
                Integer index = node.getKey();
                visited[index] = 1;
                String word = wordList.get(index);
                List<String> path = node.getValue();
                path.add(word);
                if (path.size() > min) continue;
                if (index == target) {
                    if (path.size() < min) {
                        min = path.size();
                        res.clear();
                        res.add(path);
                    } else if (path.size() == min) {
                        res.add(path);
                    }
                } else {
                    for (Integer nei: g.get(index)) {
                        String neiWord = wordList.get(nei);
                        if (visited[nei] == 0) {
                            q.add(new Pair<>(nei, new ArrayList<>(path)));
                        }
                    }
                }
            }
        }
        
        return res;
    }
    
    boolean intersects(String a, String b) {
        int i = 0;
        int count = 0;
        while (i < a.length()) {
            if (a.charAt(i) != b.charAt(i)) {
                count++;
            }
            if (count > 1) {
                return false;
            }
            i++;
        }
        return count == 1;
     }
    
     List<List<Integer>> buildGraph(List<String> wordList) {
        int n = wordList.size();
        List<List<Integer>> g = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            g.add(new ArrayList<>());
        }
        
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                if (intersects(wordList.get(i), wordList.get(j))) {
                    g.get(i).add(j);
                    g.get(j).add(i);
                }
            }
        }
        return g;
     }
}
```
