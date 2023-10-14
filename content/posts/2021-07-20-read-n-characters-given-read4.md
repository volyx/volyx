---
author: "volyx"
title:  "157. Read N Characters Given Read4"
date: "2021-07-20"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

[157. Read N Characters Given Read4](https://leetcode.com/problems/read-n-characters-given-read4/)

Given a file and assume that you can only read the file using a given method read4, implement a method to read n characters.

Method read4:

The API read4 reads four consecutive characters from file, then writes those characters into the buffer array buf4.

The return value is the number of actual characters read.

Note that read4() has its own file pointer, much like FILE *fp in C.

Definition of read4:

- Parameter:  char[] buf4
- Returns:    int

buf4[] is a destination, not a source. The results from read4 will be copied to buf4[].

Below is a high-level example of how read4 works:

File file("abcde"); // File is "abcde", initially file pointer (fp) points to 'a'
char[] buf4 = new char[4]; // Create buffer with enough space to store characters
read4(buf4); // read4 returns 4. Now buf4 = "abcd", fp points to 'e'
read4(buf4); // read4 returns 1. Now buf4 = "e", fp points to end of file
read4(buf4); // read4 returns 0. Now buf4 = "", fp points to end of file


Method read:

By using the read4 method, implement the method read that reads n characters from file and store it in the buffer array buf. Consider that you cannot manipulate file directly.

The return value is the number of actual characters read.

Definition of read:

- Parameters: char[] buf, int n
- Returns: int

buf[] is a destination, not a source. You will need to write the results to buf[].

Note:

- Consider that you cannot manipulate the file directly. The file is only accessible for read4 but not for read.
- The read function will only be called once for each test case.
- You may assume the destination buffer array, buf, is guaranteed to have enough space for storing n characters.

```txt
Example 1:

Input: file = "abc", n = 4
Output: 3
Explanation: After calling your read method, buf should contain "abc". We read a total of 3 characters from the file, so return 3.
Note that "abc" is the file's content, not buf. buf is the destination buffer that you will have to write the results to.

Example 2:

Input: file = "abcde", n = 5
Output: 5
Explanation: After calling your read method, buf should contain "abcde". We read a total of 5 characters from the file, so return 5.

Example 3:

Input: file = "abcdABCD1234", n = 12
Output: 12
Explanation: After calling your read method, buf should contain "abcdABCD1234". We read a total of 12 characters from the file, so return 12.

Example 4:

Input: file = "leetcode", n = 5
Output: 5
Explanation: After calling your read method, buf should contain "leetc". We read a total of 5 characters from the file, so return 5.
```

![ex1](/images/2021-07-20-ex1.png)

Constraints:

- 1 <= file.length <= 500
- file consist of English letters and digits.
- 1 <= n <= 1000

## Solution

```java
/**
 * The read4 API is defined in the parent class Reader4.
 *     int read4(char[] buf4);
 */

public class Solution extends Reader4 {
    /**
     * @param buf Destination buffer
     * @param n   Number of characters to read
     * @return    The number of actual characters read
     */
    public int read(char[] buf, int n) {
        // buf = new char[n];
        
        int curr = 0;
        char[] buf4 = new char[4];
        int res = this.read4(buf4);
        while (res > 0) {
            for (int i = 0; i < res && curr < n; i++) {
                buf[curr++] = buf4[i];
            }
            res = this.read4(buf4);
        }
        
        return curr;
    }
}
```

## Solution 2021-08-22

```java
/**
 * The read4 API is defined in the parent class Reader4.
 *     int read4(char[] buf4);
 */

public class Solution extends Reader4 {
    /**
     * @param buf Destination buffer
     * @param n   Number of characters to read
     * @return    The number of actual characters read
     */
    public int read(char[] buf, int n) {
        char[] buf4 = new char[4];
        int copied = 0;
        int readed = 4;
        while (copied < n && readed == 4) {
            readed = read4(buf4);
            for (int i = 0; i < readed; i++) {
                if (copied == n) return copied;
                buf[copied] = buf4[i];
                copied++;
            }
        }
        return copied;
    }
}
```

## Solution 2021-11-21

```java
/**
 * The read4 API is defined in the parent class Reader4.
 *     int read4(char[] buf4);
 */

public class Solution extends Reader4 {
    /**
     * @param buf Destination buffer
     * @param n   Number of characters to read
     * @return    The number of actual characters read
     */
    public int read(char[] buf, int n) {
        int bufPtr = 0;
        int bufCount = 0;
        char[] buf4 = new char[4];
        
        int ptr = 0;
        while (ptr < n) {
            
            if (bufCount == 0) {
                bufCount = read4(buf4);
            }
            
            if (bufCount == 0) {
                break;
            }
            
            while (bufPtr < bufCount && ptr < n) { 
                buf[ptr++] = buf4[bufPtr++];
            }
            
            if (bufCount == bufPtr) {
                bufCount = 0;
                bufPtr = 0;
            }
        }
        
        return ptr;
    }
}
```
