---
author: "volyx"
title:  "Перестановочки"
date: "2015-08-28"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["old-posts"]
categories: ["old-posts"]
summary: ""
image: ""
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

![](/images/permutation.png)


{% highlight java %}
def permutation(String input){
          permutation("", input);
}

def permutation(String perm, String word) {
        if (word.isEmpty()) {
            println(perm + word);

        } else {
            for (int i = 0; i < word.length(); i++) {
                permutation(perm + word.charAt(i), word.substring(0, i) 
                                        + word.substring(i + 1, word.length()));
            }
        }
}

permutation("123")
{% endhighlight%}