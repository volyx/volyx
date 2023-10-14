---
author: "volyx"
title:  "Длина строки"
date: "2016-05-19"
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

Задание 

[https://stepic.org/lesson/Использование-указателей-540/step/6](https://stepic.org/lesson/Использование-указателей-540/step/6)

Очень часто для работы со строками нам нужно сначала вычислить длину строки. Для C-style строк длина нигде явно не хранится, но её можно вычислить. Напишите функцию, которая вычисляет длину C-style строки. Учтите, что завершающий нулевой символ считать не нужно. 

Требования к реализации: при выполнении этого задания вы можете создавать любые вспомогательные функции. Вводить или выводить что-либо не нужно. Реализовывать функцию main не нужно.

Решение

{% highlight cpp %}
#include <iostream>
using namespace std;

unsigned strlen(const char *str)
{   
	unsigned i = 0;
	for (; *str != '\0'; str++) 
	{	
		i++;
		
	}
	return  i;
}

int main() {
	char s[] = "Hello World!\n"; 
    cout << strlen(s);
} 
{% endhighlight %}

Сам курс [https://stepic.org/course/7](https://stepic.org/course/7)