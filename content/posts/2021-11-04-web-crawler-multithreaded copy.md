---
author: "volyx"
title:  "1242. Web Crawler Multithreaded"
date: "2021-11-04"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["leetcode", "easy", "math", "array"]
categories: ["leetcode"]
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![1287. Element Appearing More Than 25% In Sorted Array](https://leetcode.com/problems/web-crawler-multithreaded/)

Given a URL startUrl and an interface HtmlParser, implement a Multi-threaded web crawler to crawl all links that are under the same hostname as startUrl.

Return all URLs obtained by your web crawler in any order.

Your crawler should:

- Start from the page: startUrl
- Call HtmlParser.getUrls(url) to get all URLs from a webpage of a given URL.
- Do not crawl the same link twice.
- Explore only the links that are under the same hostname as startUrl.

As shown in the example URL above, the hostname is example.org. For simplicity's sake, you may assume all URLs use HTTP protocol without any port specified. For example, the URLs http://leetcode.com/problems and http://leetcode.com/contest are under the same hostname, while URLs http://example.org/test and http://example.com/abc are not under the same hostname.

The HtmlParser interface is defined as such:

```java
interface HtmlParser {
  // Return a list of all urls from a webpage of given url.
  // This is a blocking call, that means it will do HTTP request and return when this request is finished.
  public List<String> getUrls(String url);
}
```

Note that getUrls(String url) simulates performing an HTTP request. You can treat it as a blocking function call that waits for an HTTP request to finish. It is guaranteed that getUrls(String url) will return the URLs within 15ms. Single-threaded solutions will exceed the time limit so, can your multi-threaded web crawler do better?

Below are two examples explaining the functionality of the problem. For custom testing purposes, you'll have three variables urls, edges and startUrl. Notice that you will only have access to startUrl in your code, while urls and edges are not directly accessible to you in code.

![ex1](/images/2021-11-04-web-crawler-ex1.png)

```txt
Example 1:

Input:
urls = [
  "http://news.yahoo.com",
  "http://news.yahoo.com/news",
  "http://news.yahoo.com/news/topics/",
  "http://news.google.com",
  "http://news.yahoo.com/us"
]
edges = [[2,0],[2,1],[3,2],[3,1],[0,4]]
startUrl = "http://news.yahoo.com/news/topics/"
Output: [
  "http://news.yahoo.com",
  "http://news.yahoo.com/news",
  "http://news.yahoo.com/news/topics/",
  "http://news.yahoo.com/us"
]
```

![ex2](/images/2021-11-04-web-crawler-ex2.png)

```txt
Example 2:

Input: 
urls = [
  "http://news.yahoo.com",
  "http://news.yahoo.com/news",
  "http://news.yahoo.com/news/topics/",
  "http://news.google.com"
]
edges = [[0,2],[2,1],[3,2],[3,1],[3,0]]
startUrl = "http://news.google.com"
Output: ["http://news.google.com"]
Explanation: The startUrl links to all other pages that do not share the same hostname.
```

Constraints:

- 1 <= urls.length <= 1000
- 1 <= urls[i].length <= 300
- startUrl is one of the urls.
- Hostname label must be from 1 to 63 characters long, including the dots, may contain only the ASCII letters from 'a' to 'z', digits from '0' to '9' and the hyphen-minus character ('-').
- The hostname may not start or end with the hyphen-minus character ('-'). 
- See:  https://en.wikipedia.org/wiki/Hostname#Restrictions_on_valid_hostnames
- You may assume there're no duplicates in the URL library.

Follow up:

- Assume we have 10,000 nodes and 1 billion URLs to crawl. We will deploy the same software onto each node. The software can know about all the nodes. We have to minimize communication between machines and make sure each node does equal amount of work. How would your web crawler design change?
- What if one node fails or does not work?
- How do you know when the crawler is done?

## Solution

```java
/**
 * // This is the HtmlParser's API interface.
 * // You should not implement it, or speculate about its implementation
 * interface HtmlParser {
 *     public List<String> getUrls(String url) {}
 * }
 */
class Solution {
    public List<String> crawl(String startUrl, HtmlParser htmlParser) {
        ExecutorService ex = Executors.newFixedThreadPool(4, r -> {
            Thread t = new Thread(r);
            t.setDaemon(true);
            return t;
        });
        ConcurrentMap<String, Boolean> visited = new ConcurrentHashMap<>();
        BlockingQueue<String> q = new ArrayBlockingQueue<String>(100_000);
        
        String[] parts = startUrl.split("/");
        String domain = parts[0] + "//" + parts[2];
        q.add(startUrl);

        Deque<Future> tasks = new ArrayDeque<>(); 
        while (true) {
            final String url = q.poll();
            if (url != null) {
                visited.put(startUrl, true);
                tasks.add(ex.submit(() -> {
                    for (String otherUrl: htmlParser.getUrls(url)) {
                        if (otherUrl.startsWith(domain) && !visited.containsKey(otherUrl)) {
                            q.add(otherUrl);
                            visited.put(otherUrl, true);
                        }
                    }
                }));
            } else {
                if (tasks.size() > 0) {
                    try {
                        tasks.pollFirst().get();
                    } catch (Exception e) {}
                } else {
                    break;
                }
            }
             
        }
        
        return new ArrayList<>(visited.keySet());
    }
}
 ```
