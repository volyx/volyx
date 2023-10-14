---
author: "volyx"
title:  "Команда nohup"
date: "2015-04-14"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["old-posts"]
categories: ["old-posts"]
summary: "Все процессы, за исключением at и batch, завершаются, когда вы выходите из системы. Если вы хотите, чтобы после вашего выхода из системы процесс в фоновом режиме продолжал выполняться, то вам необходимо использовать команду nohup"
image: "../img/nohup.png"
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

:icons: font

:sectanchors:

== Использование команды nohup

Команда nohup имеет следующий формат:

[source, bash]
----
    nohup command &
----

Предположим, вы хотите, чтобы команда grep осуществила поиск во всех файлах в вашем текущем каталоге строки "word" и перенаправила вывод в файл word.list, и затем, не ожидая завершения, вы хотите выйти из системы, то введите следующую строку:

[source, bash]
----
    nohup grep word * > word.list &
----

Вы можете завершить команду nohup с помощью команды kill.