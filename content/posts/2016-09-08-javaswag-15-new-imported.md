---
author: "volyx"
title:  "Javaswag выпуск 15"
date: "2016-09-08"
# description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags:  ["old-posts"]
categories: ["old-posts"]
summary: "Привет! В выпуске - новый @Depracted в Java 9, быстрый старт с Grails и микросервисная архитектура."
image: ""
# series: ["Themes Guide"]
# aliases: ["migrate-from-jekyl"]
# ShowToc: true
# TocOpen: true
# weight: 2
---

Привет! В выпуске - новый @Depracted в Java 9, быстрый старт с Grails и микросервисная архитектура.

[Why Should Java Developers Give Grails a Chance](https://www.toptal.com/grails/should-java-developers-give-grails-chance)

Автор рассказывает как он переписывал Спринг МВЦ приложение на Грэйлс и с какими проблемами столкнулся.

[Create a Secured Restful API App with Grails 3, PostgreSQL and JMS](http://giri-tech.blogspot.ru/2016/08/create-secured-restful-api-app-with.html)

Серия статей по созданию Рест Апи используя Грэйлз. 

[Why I introduced scala in our project](http://techblog.bozho.net/why-i-introduced-scala-in-our-project/)

Автор решил использовать Скалу для написания тестов для Джава приложения. В статье  - как он пришел к этому решению.

[Custom test slice with Spring Boot 1.4](https://spring.io/blog/2016/08/30/custom-test-slice-with-spring-boot-1-4)

Спринг выпустил новую фичу - тестовые слайсы. Они позволяют тестировать приложение на каком-то срезе Спрингового контекста. Теперь не нужно запускать все приложение, чтобы выполнить интеграционный тест. Ставите аннотацию `@WebMvcTest` и Спринг магически настроит все за Вас. 


[How to use CyclicBarrier in Java - Concurrency Tutorail](http://www.java67.com/2015/06/how-to-use-cyclicbarrier-in-java.html)

Циклический Барьер не так часто используется в повседневной жизни программиста, но знать что это такое обязательно нужно, чтобы понимать все способы синхронизации потоков. 

В статье разобран циклический барьер, и показаны примеры его использования. 

[Java 8 WatchService API Tutorial](http://howtodoinjava.com/java-8/java-8-watchservice-api-tutorial/)

В Джава 8 появился новый АПИ для слежения за обновлениями в папке документов. Вешаете слушателя и ловите все изменения с помощью событий. 

Полезно для всех, кто работает в своем приложении с содержимым папки в реальном времени.

[A Proposed Recipe for Designing, Building and Testing Microservices](https://specto.io/blog/recipe-for-designing-building-testing-microservices.html)

Компания SpectoLabs описывают свой подход разработки и тестирования микросервисов. О том как писать их “с нуля” и о переходе с монолитного приложения.

[Intro to Stream Processing with Spring Cloud Data Flow](http://www.baeldung.com/spring-cloud-data-flow-stream-processing)

Вводная статья по Spring Cloud Data Flow. Это один из молодых проектов Спринга, который упрощает потоковую обработку данных.

В статье — как это работает, как настроить сервер стриминга и клиента.

[Tutorial: Correct SLF4J logging usage and how to check it](https://gualtierotesta.wordpress.com/2016/02/27/tutorial-correct-slf4j-logging-usage-and-how-to-check-it/)

О том как должно выглядеть логирование ошибок с точки зрения анализатора кода FindBugs. 

[Manage and reload spring application properties on the fly](http://jeroenbellen.ghost.io/manage-and-reload-spring-application-properties-on-the-fly/)

Сделать обновление настроек Спринг приложения “на лету”, без перезагрузки сервера не просто.В статье туториал как это сделать.

[Instrumenting Hibernate Connection Providers](https://eng.fitbit.com/instrumenting-hibernate-connection-providers/)

Разработчик Fitbit(это те, с умным браслетом) рассказывает о том как мониторить хибернейт приложение. В статье автор дорабатывает хибернейотвский пул коннектов, чтобы он отдавал еще всякую полезную статистику о себе.

[Plugging Leaky Abstractions](https://blog.ndepend.com/plugging-leaky-abstractions/)

Почему абстракции в вашем приложении текут и как с этим бороться.

[JDK 9 @Deprecated Annotation Enhancements](http://marxsoftware.blogspot.ru/2016/08/jdk-9-deprecated-annotation-enhancements.html)

В статье рассматриваются два новых атрибута - ‘forRemoval’ и ‘since’, которые появятся у аннотации ‘@Deprecated’ в Джава 9. Для чего они нужны - об этом в статье.
 
[Spring Boot: Sessions actuator endpoint](https://moelholm.com/2016/08/22/spring-boot-sessions-actuator-endpoint/)

Автор статьи рассказывает как написать эндпойнт для отображения активных ХТТП сессий пользователей.

Еженедельные выпуски Джавасвэга на почту — [http://javaswag.curated.co](http://javaswag.curated.co).

Еженедельные выпуски Джавасвэга в Телеграме — [http://telegram.me/javaswag](http://telegram.me/javaswag).

![des](/images/real_programmers.jpeg)

Удачи!