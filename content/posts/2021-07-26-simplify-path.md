---
author: "volyx"
title:  "71. Simplify Path"
date: "2021-07-26"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "medium", "stack"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[71. Simplify Path](https://leetcode.com/problems/simplify-path/)

Given a string path, which is an absolute path (starting with a slash '/') to a file or directory in a Unix-style file system, convert it to the simplified canonical path.

In a Unix-style file system, a period '.' refers to the current directory, a double period '..' refers to the directory up a level, and any multiple consecutive slashes (i.e. '//') are treated as a single slash '/'. For this problem, any other format of periods such as '...' are treated as file/directory names.

The canonical path should have the following format:

- The path starts with a single slash '/'.
- Any two directories are separated by a single slash '/'.
- The path does not end with a trailing '/'.
- The path only contains the directories on the path from the root directory to the target file or directory (i.e., no period '.' or double period '..')

Return the simplified canonical path.

```txt
Example 1:

Input: path = "/home/"
Output: "/home"
Explanation: Note that there is no trailing slash after the last directory name.

Example 2:

Input: path = "/../"
Output: "/"
Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.

Example 3:

Input: path = "/home//foo/"
Output: "/home/foo"
Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.

Example 4:

Input: path = "/a/./b/../../c/"
Output: "/c"
```

Constraints:

- 1 <= path.length <= 3000
- path consists of English letters, digits, period '.', slash '/' or '_'.
- path is a valid absolute Unix path.

## Solution

```java
class Solution {
    public String simplifyPath(String path) {
        List<String> stack = new ArrayList<>();
        String[] parts = path.split("/");
        for (int i = 0; i < parts.length; i++) {
            String part = parts[i];
            
            if (part.length() == 0) {
                continue;
            }
            if (part.equals(".")) {
                continue;
            }
            
            if (part.equals("..")) {
                if (stack.size() > 0) {
                    stack.remove(stack.size() - 1);
                }
                continue;
            }
            
            stack.add(part);
        }
        
        StringBuilder sb = new StringBuilder();
        
        for (String val: stack) {
            sb.append("/").append(val);
        }
        if (sb.length() == 0) {
            return "/";
        }
        return sb.toString();
        
    }
}
```

## Solution 2022-01-30

```java
class Solution {
    public String simplifyPath(String path) {
        Deque<String> stack = new ArrayDeque<>();
        
        for (String pathPart: path.split("/")) {
            if (pathPart.length() == 0 || pathPart.equals(".")) {
                continue;
            }
            if (pathPart.equals("..")) {
                if (stack.size() > 0) {
                    stack.pop();
                }
            } else {
                stack.push(pathPart);
            }
        }
        
        StringBuilder sb = new StringBuilder();
        
        while (stack.size() > 0) {
            sb.append("/");
            sb.append(stack.pollLast());
        }
        if (sb.length() == 0) return "/";
        return sb.toString();
    }
}
```
