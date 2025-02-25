---
author: "volyx"
title:  "Удаление символов из строки"
date: "2015-06-24"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["old-posts"]
categories: ["old-posts"]
summary: "Серия задачек на подумать, осознать. На этот раз будем разбираться с удалением смимволов из строки."
image: "../img/deletesimbol.png"
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

## Задача 
Написать функцию, которая удалит символы из строки.

<code>	
string removeChars( string str, string remove );
</code>
Символы, которые содержатся в //str//, удалить из //remove// .
Пример.
 Дана строка //Battle of the Vowels: Hawaii vs. Grozny//.  Удалить //aeiou//. Функция  //removeChars// вернёт такой результат - //Bttl f th Vwls: Hw vs. Grzny//. 

## Решение

Разделим задачу на две части. Для каждого символа определим - удалять ли его? Потом, само удаление соответствующего символа. Сначала мы обсудим удаление символа.
Удаление символа из строки алгоритмически эквивалентно удалению элемента из массива. В памяти массив хранится одним блоком, так что не получится удалить элемент из середины эффективно, как можно было бы сделать со связным списком.
Вместо этого в массиве мы переставим элементы таким образом, чтобы  вместо удаляемого элемента сразу шли следующие за ним. Если мы удалим символ //c// из строки //abcd//, то мы можем либо двинуть символы //ab// на одну позицию вперед, либо сдвинуть символ //d// на одну позицию назад. Оба подхода приводят к одному и тому же результату - //abd//. 
Кроме того, подвинув данные, также уменьшим размер строки на один символ. Получается, в первом случае мы уничтожим первый элемент, а во втором - последний. В большинстве языков программирования гораздо легче удалять элемент с конца массива(либо уменьшая длину строки на один, либо записывая последним элементом //null//, в зависимости от языка) чем с начала, поэтому сдвигать символы в начало это наилучший вариант.
Каково время работы алгоритма в наихудшем случае, если мы удалим все символы в строке //str//? Для каждого удаления потребуется сдвигать остальные символы назад на одну позицию. Если строка длинны //n//, то потребуется сдвинуть последний символ //n - 1// раз, предпоследний - //n - 2// раза. В итоге //O(n^2)// на удаление. 
Если мы удалим символы строки с конца, то получится немного эффективнее, но сложность останется такая же - //O(n^2)// в худшем случае. Сдвигать один и тот же символ несколько раз подряд не очень эффективно. Попробуем избежать этого. Что если создать строковый буфер и модифицировать его вместо исходной строки? Затем мы копируем символы из буфера, пропуская те символы, которые удалим. Когда закончится построение результирующей строки, то можно скопировать ее в исходную. Каждый символ передвигается как минимум 2 раза, что в итоге дает удаление за //O(n)//.
Однако мы приобретаем затраты на память этого буфера, который размером с исходную строка, и затраты на копирование обратно уже итоговой строки. 

Получается, что мы перемещаем каждый символ как минимум дважды, вместо O(n) удаления. Однако, мы несем затраты по памяти на вернменный буфер, который такого же размера как и исходная строка, и затраты на копирование модифицированной строки обратно в исходную. Попробуем избежать этих издержек, но оставить сложность алгоритма O(n).

Для релаизации O(n) алгоритма мы будем следить за позицеей символа в исходной строке и позицией символа в строке-буфере. Обе позиции изначально равны 0. 
Значение первой позиции мы увеличим на один, когда будем читать из строки, а значение второй позиции - когда будем записывать в буфер.

Другими словами, когда мы копируем символ, мы увеличваем значения обоих счетчиков на единицу, но когда мы удаляем символ, мы увеличиваем только исходный счетчик. Значит, исходный счетчик имеет либо такое же значение, либо больше чем значние счетчика буфера.

После того, как мы прочитали символ из исходной строки ( счетчик прошел этот символ), мы больше не нуждаемся в этом символе - потому что затем мы скопируем модифицированную строку поверх него. 
---------------------

To implement the O(n) algorithm just described, you need to track a source position for the read
location in the original string and a destination position for the write position in the temporary buffer.
These positions both start at zero. 

The source position is incremented every time you read, and
the destination position is incremented every time you write. 

In other words, when you copy a character,
you increment both positions, but when you delete a character, you increment only the source
position. This means the source position is always the same as or ahead of the destination position.

After you read a character from the original string (that is, the source position has advanced past it),
you no longer need that character — because you’re just going to copy the modified string over it.

Because the destination position in the original string is always a character you don’t need anymore,
you can write directly into the original string, eliminating the temporary buffer entirely. 

This is still an O(n) algorithm but without the memory and time overhead of the earlier version.
Now that you know how to delete characters, consider the task of deciding whether to delete a particular
character. 

The easiest way to do this is to compare the character to each character in remove
and delete it if it matches any of them. 

How efficient is this? If str is n characters long and remove is
m characters long, then in the worst case you make m comparisons for each of n characters, so the
algorithm is O(nm). You can’t avoid checking each of the n characters in str, but perhaps you can
make the lookup that determines whether a given character is in remove better than O(m).
If you’ve already read the solution to “Find the First Nonrepeated Character,” this should sound
familiar. Just as you did in that problem, you can use remove to build an array or hash table that
has constant time lookup, thus giving an O(n) solution. The trade-offs between hash tables and
arrays are the same as previously discussed. In this case, an array is most appropriate when str
and remove are long and characters have relatively few possible values (for example, ASCII strings).
A hash table may be a better choice when str and remove are short or characters have many possible
values (for example, Unicode strings). Either choice could be acceptable as long as you justify it
appropriately. This time, you’re told that the inputs are ASCII strings, so the array wouldn’t be too
big; because the previous implementation used a hash table, try using an array for this one.