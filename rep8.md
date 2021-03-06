---
# Front matter
lang: ru-RU
title: "Отчёт по лабораторной работе №8"
subtitle: "дисциплина: Математическое моделирование"
author: "Унтевская Валерия Вадимовна"

# Formatting
toc-title: "Содержание"
toc: true # Table of contents
toc_depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4paper
documentclass: scrreprt
polyglossia-lang: russian
polyglossia-otherlangs: english
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase
indent: true
pdf-engine: lualatex
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Ознакомление с моделью конкуренции двух фирм для двух случаев (без учета и с учетом социально-психологического фактора) и их построение с помощью языка программирования Modelica.

# Задание

**Вариант 22**  
  Рассмотрим две фирмы, производящие взаимозаменяемые товары одинакового качества и находящиеся в одной рыночной нише. Считаем, что в рамках нашей модели конкурентная борьба ведётся только рыночными методами. То есть, конкуренты могут влиять на противника путем изменения параметров своего производства: себестоимость, время цикла, но не могут прямо вмешиваться в ситуацию на рынке («назначать» цену или влиять на потребителей каким-либо иным способом.) Будем считать, что постоянные издержки пренебрежимо малы, и в модели учитывать не будем. В этом случае динамика изменения объемов продаж фирмы 1 и фирмы 2 описывается следующей системой уравнений  
![Рис. 1. Уравнения](img/1.png){ #fig:001 width=70% }
  
Рассмотрим модель, когда, помимо экономического фактора влияния (изменение себестоимости, производственного цикла, использование кредита и т.п.), используются еще и социально-психологические факторы – формирование общественного предпочтения одного товара другому, не зависимо от их качества и цены. В этом случае взаимодействие двух фирм будет зависеть друг от друга, соответственно коэффициент перед M M1 2 будет отличаться. Пусть в рамках рассматриваемой модели динамика изменения объемов продаж фирмы 1 и фирмы 2 описывается следующей системой уравнений.
![Рис. 2. Уравнения](img/2.png){ #fig:002 width=70% }
Для обоих случаев рассмотрим задачу со следующими начальными условиями и параметрами
![Рис. 3. Уравнения](img/3.png){ #fig:003 width=70% }
# Выполнение лабораторной работы

**1. Теоритические сведения**

Для построения модели конкуренции хотя бы двух фирм необходимо рассмотреть модель одной фирмы. Вначале рассмотрим модель фирмы, производящей продукт долговременного пользования, когда цена его определяется балансом спроса и предложения. Примем, что этот продукт занимает определенную нишу рынка и конкуренты в ней отсутствуют. Обозначим: N – число потребителей производимого продукта. S – доходы потребителей данного продукта. Считаем, что доходы всех потребителей одинаковы. Это предположение справедливо, если речь идет об одной рыночной нише, т.е. производимый продукт ориентирован на определенный слой населения. M – оборотные средства предприятия τ – длительность производственного цикла p – рыночная цена товара p̃ – себестоимость продукта, то есть переменные издержки на производство единицы продукции. δ – доля оборотных средств, идущая на
покрытие переменных издержек. κ – постоянные издержки, которые не зависят от количества выпускаемой продукции. Q(S/p) – функция спроса, зависящая от отношения дохода S к цене p. Она равна количеству продукта, потребляемого одним потребителем в единицу времени. Функцию спроса товаров долговременного использования часто представляют в простейшей форме  

![Рис. 4. Уравнения](img/4.png){ #fig:004 width=70% }

где q – максимальная потребность одного человека в продукте в единицу времени. Эта функция падает с ростом цены и при p = pcr (критическая стоимость продукта) потребители отказываются от приобретения товара. Величина pcr = Sq/k. Параметр k – мера эластичности функции спроса по цене. Таким образом, функция спроса в форме (1) является пороговой (то есть, Q(S/p) = 0 при p ≥ pcr) и обладает свойствами насыщения. Уравнения динамики оборотных средств можно записать в виде
![Рис. 5. Уравнения](img/5.png){ #fig:005 width=70% }
Уравнение для рыночной цены p представим в виде
![Рис. 6. Уравнения](img/6.png){ #fig:006 width=70% }
Первый член соответствует количеству поставляемого на рынок товара (то есть, предложению), а второй член – спросу. Параметр γ зависит от скорости оборота товаров на рынке. Как правило, время торгового оборота существенно меньше времени производственного цикла τ. При заданном M уравнение (3) описывает быстрое стремление цены к равновесному значению цены, которое устойчиво. В этом случае уравнение (3) можно заменить алгебраическим соотношением
![Рис. 7. Уравнения](img/7.png){ #fig:007 width=70% }
Из этого следует, что равновесное значение цены p равно
![Рис. 8. Уравнения](img/8.png){ #fig:008 width=70% }
Уравнение с учетом приобретает вид
![Рис. 9. Уравнения](img/9.png){ #fig:009 width=70% }
Уравнение имеет два стационарных решения, соответствующих условию dM/dt = 0:
![Рис. 10. Уравнения](img/10.png){ #fig:0010 width=70% }
где
![Рис. 11. Уравнения](img/11.png){ #fig:0011 width=70% }
Из (7) следует, что при больших постоянных издержках (в случае a 2 < 4b) стационарных состояний нет. Это означает, что в этих условиях фирма не может функционировать стабильно, то есть, терпит банкротство. Однако, как правило, постоянные затраты малы по сравнению с переменными (то есть, b << a 2 ) и играют роль, только в случае, когда оборотные средства малы. При b << a стационарные 
![Рис. 12. Уравнения](img/12.png){ #fig:0012 width=70% }
Первое состояние M устойчиво и соответствует стабильному функционированию предприятия. Второе состояние M неустойчиво, так, что при M M  оборотные средства падают (dM/dt < 0), то есть, фирма идет к банкротству. По смыслу M соответствует начальному капиталу, необходимому для входа в рынок. В обсуждаемой модели параметр δ всюду входит в сочетании с τ. Это значит, что уменьшение доли оборотных средств, вкладываемых в производство, эквивалентно удлинению производственного цикла. Поэтому мы в дальнейшем положим: δ = 1, а параметр τ будем считать временем цикла, с учётом сказанного.
**2. Построение графиков**

2.1 Написала программу на OpenModelica:
```
model Lab8
  parameter Real p_cr = 44;
  parameter Real tau1 = 26;
  parameter Real p1 = 11;
  parameter Real tau2 = 21;
  parameter Real p2 = 8.7;
  parameter Real N = 77;
  parameter Real q = 1;
  
  parameter Real a1 = p_cr/(tau1*tau1*p1*p1*N*q);
  parameter Real a2 = p_cr/(tau2*tau2*p2*p2*N*q);
  parameter Real b = p_cr/(tau1*tau1* tau2*tau2*p1*p1*p2*p2*N*q);
  parameter Real c1 = (p_cr-p1)/(tau1*p1);
  parameter Real c2 = (p_cr-p2)/(tau2*p2); 
  
  Real M1 (start=7.1);
  Real M2 (start=8.1);
equation
  der(M1)=M1-(b/c1)*M1*M2-(a1/c1)*M1*M1;
  der (M2) = (c2/c1)*M2 - (b/c1)*M1*M2 - (a2/c1)*M2*M2;
end Lab8;

```
Получил следующий график (см. рис. -@fig:001).

![Рис. 13. График для 1 слусая](img/13.png){ #fig:0013 width=70% }  

2.2 Написал программу на Modelica:
```
model Lab8_2
  parameter Real p_cr = 44;
  parameter Real tau1 = 26;
  parameter Real p1 = 11;
  parameter Real tau2 = 21;
  parameter Real p2 = 8.7;
  parameter Real N = 77;
  parameter Real q = 1;
  
  parameter Real a1 = p_cr/(tau1*tau1*p1*p1*N*q);
  parameter Real a2 = p_cr/(tau2*tau2*p2*p2*N*q);
  parameter Real b = p_cr/(tau1*tau1* tau2*tau2*p1*p1*p2*p2*N*q);
  parameter Real c1 = (p_cr-p1)/(tau1*p1);
  parameter Real c2 = (p_cr-p2)/(tau2*p2); 
  
  Real M1 (start=7.1);
  Real M2 (start=8.1);
equation
  der(M1)=M1-(b/(c1+0.0013))*M1*M2-a1/c1*M1*M1;
  der(M2)=c2/c1*M2-b/c1*M1*M2-a2/c1*M2*M2;
end Lab8_2;
```
Получил следующий график (см. рис. -@fig:002).

![Рис. 14. График для 2 случая](img/14.png){ #fig:0014 width=70% }

# Выводы

Ознакомилась с моделью конкуренции двух фирм для двух случаев. Построила график распространения рекламы.
