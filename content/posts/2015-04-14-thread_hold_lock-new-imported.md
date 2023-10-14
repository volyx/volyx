---
author: "volyx"
title:  "Захвачен ли монитор потоком на данный объект"
date: "2015-04-14"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["old-posts"]
categories: ["old-posts"]
summary: "Выполняется код под каким-то монитором или нет?"
image: "../img/holdLock.png"
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

:icons: font

:sectanchors:

Я знаю 2 способа проверить держит ли поток монитор на объект.

1) Можно вызвать у объекта методы `wait()` или `notify()`, которые выбросят исключение если вызваны не из синхронизированного блока. И собственно алгоритм такой - вызываем `newspaper.wait()` и если этот метод бросает исключние, значит лока нет!

2) Можно вызвать статический метод `holdsLock(Object obj)`  класса Thread, который и вернет `true` если поток владеет монитором этого объекта.