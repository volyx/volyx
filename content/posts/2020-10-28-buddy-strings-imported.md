---
author: "volyx"
title:  "Buddy Strings"
date: "2020-10-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Given two strings A and B of lowercase letters, return true if you can swap two letters in A so the result is equal to B, otherwise, return false.

Swapping letters is defined as taking two indices i and j (0-indexed) such that i != j and swapping the characters at A[i] and A[j]. For example, swapping at indices 0 and 2 in "abcd" results in "cbad".

Example 1:

Input: A = "ab", B = "ba"
Output: true
Explanation: You can swap A[0] = 'a' and A[1] = 'b' to get "ba", which is equal to B.

Example 2:

Input: A = "ab", B = "ab"
Output: false
Explanation: The only letters you can swap are A[0] = 'a' and A[1] = 'b', which results in "ba" != B.

Example 3:

Input: A = "aa", B = "aa"
Output: true
Explanation: You can swap A[0] = 'a' and A[1] = 'a' to get "aa", which is equal to B.

Example 4:

Input: A = "aaaaaaabc", B = "aaaaaaacb"
Output: true

Example 5:

Input: A = "", B = "aa"
Output: false

Solution:

```java
class Solution {
    public boolean buddyStrings(String A, String B) {
        int n = A.length();
        if (A.length() != B.length()) {
            return false;
        }

        if (n == 0 || n == 1) return false;

        int i = 0;
        int[] uniq = new int[26];

        List<Integer> indexes = new ArrayList<>();

        while (i < n) {
            uniq[A.charAt(i) - 'a']++;
            if (A.charAt(i) != B.charAt(i)) {
                indexes.add(i);
            }

            if (indexes.size() > 2) {
                return false;
            }

            i++;
        }
        if (indexes.size() == 1) {
            return false;
        }

        if (indexes.isEmpty()) {
            for (int c : uniq) {
                if (c > 1) {
                    return true;
                }
            }
            return false;
        }

        int x = indexes.get(0);
        int y = indexes.get(1);

        return A.charAt(x) == B.charAt(y) &&
                B.charAt(x) == A.charAt(y);
    }
}
