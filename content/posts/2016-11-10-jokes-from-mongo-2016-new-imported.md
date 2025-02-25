---
author: "volyx"
title:  "Шутки от spring-mongo-data"
date: "2016-11-10"
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

Когда заходишь на страницу со всеми историями на [wndlust.ru](http://wndlust.ru), страница очень долго загружается. Происходит это только когда база данных находится на удаленном сервере, ну например на сервере в Ирландии.(а именно там датацентр и находится)

<img src="/images/wanderlust-stories.png" width="400px" style="float: right;" />

Так выглядит страница со всеми историями. Это список всех опубликованных историй на сайте.

При запуске проекта с локальной базой, а на проекте мы используем монгу, то все нормально. Когда я пробовал профилировать приложение с удаленной базой, то нашел кучу каких-то лишних запросов. Почему спринг генерировал их было не понятно.

Модель в монге выглядела примерно, вот так:

```javascript

Story {
	id: "",
	records: [],
	...
	// какие-то еще поля
}

Record {
	id: "",
	images: [],
	...
	// какие-то еще поля
}

Image {
	id, "",
	...
	// какие-то еще поля
}
```

Каждый объект хранился в своей отдельной коллекции, и склеивался при получении из базы.
У спринга есть аннотация `@DbRef`, которая и делают всю магию - склеивает объекты в один.

В итоге когда при загрузке страницы со всеми историям сначала загружась все истории, затем все записи в истории, затем все картинки из записи. Вместо одного запроса происходило `n*m*k` запросов! 

Смотрите в логе - сначала загружается `BsonString(value='story')`, а затем `BsonString(value='record')`, затем `BsonString(value='image')`.

![mongo-data](/images/mongo-data.png)

Так дело не пойдет, время рефакторинга! Ссылка на гитхаб [https://github.com/volyx/spring-data-mongo-dbref](https://github.com/volyx/spring-data-mongo-dbref)
