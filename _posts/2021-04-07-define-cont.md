---
layout: article
title: "連続写像の定義"
author: zab
permalink: /posts/define-cont
date: 2021-04-07 14:00:00 +0900
modify_date: 2021-04-23 00:00:00 +0900
tags: 位相空間論 解析学
mathjax_autoNumber: false
---

## 要約

$(X_1,\mathcal{O}_1),(X_2,\mathcal{O}_2)$を位相空間とする．写像$f:X_1\to X_2$が連続であるとは，任意の$Q\in \mathcal{O}_2$に対して，$f^{-1}(Q)\in \mathcal{O}_1$となることである．

## はじめに

今回の主題は，連続写像の定義から**距離**や**極限**といった概念を取り払い，位相空間の間の連続写像を定義することです．

まず，高校数学までの素朴な定義を確認し，距離空間における連続写像を取り扱います．

次に，距離空間における開集合系の性質を述べ，慣例に則って，位相を開集合系によって定義します．

最後に，位相を用いた連続写像の表現を定義します．

本編では，語尾はである調で統一しています．

## $\varepsilon-\delta$論法による連続性の定義

ここでは，距離空間の連続写像を考えるために，高校での連続の定義の問題点を挙げ，$\varepsilon - \delta$論法による連続の定義を行う．

高校までで学んだ連続の定義は，次のようであった．[^oshima]

{% include definition.html content="
$a$を$f(x)$の定義域に属する値とするとき，関数$f(x)$が$x=a$で<b>連続</b>であるとは，次の2つのことが満たされていることである．
<br> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. 極限値$\displaystyle \lim_{x\to a}f(x)$が存在する．
<br> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2. $\displaystyle \lim_{x\to a}f(x)=f(a)$が成立する．
" %}

[^oshima]: 大島利雄ほか13名著 (2018).極限,『改訂版　数学III』,数研出版,pp.141-142.より引用．


高校までの数学では「極限値$\displaystyle \lim_{x\to a}f(x)$が存在する」ということが，はっきりとは定義されていない．そのため，1つ目の条件について議論することができない．

コーシー以後，現代数学では**極限**と**連続**を次のように定義する．

<a name="def:lim"></a>
{% include definition.html content="
<b>極限が存在すること</b>
<p>$I\subset \mathbb{R}$を区間とする．$f:I\to \mathbb{R}$に対して$\displaystyle \lim_{x\to a}f(x)=\alpha$とは次のことである．
ある実数$\alpha$が存在し，任意の$\varepsilon>0$に対して，ある$\delta$が存在して，$0<|x-a|<\delta$ならば$|f(x)-\alpha|<\varepsilon$が成立する．
</p>
<b>連続であること</b>
<p>$I\subset \mathbb{R}$を区間として，$a\in I$を固定する．関数$f:I\to \mathbb{R}$が点$a$で連続であるとは次のことである．
任意の正の数$\varepsilon$に対して，正の数$\delta_{\varepsilon,a}$が存在し，$|x-a|<\delta_{\varepsilon,a}$ならば$|f(x)-f(a)|<\varepsilon$が成立する．
</p>
" %}

[定義2](#def:lim)によると，$f(a)$が定義されていなくても，点$a$における$f$の極限が定義できる．一方で，$f(a)$が定義されていなければ，点$a$において$f$は自動的に連続でないとわかる．

$f(a)$が定義されており，かつ点$a$における$f(x)$の極限が$f(a)$と一致して初めて「$f$は点$a$において**連続**である」といえる．

[定義2](#def:lim)は一見すると，どのように利用するのかがわかりにくい．論理式を直訳したような形をとっているからである．そこで具体例を考えよう．

{% include example.html content="
$f$を$\mathbb{R}$から$\mathbb{R}$への写像として
$
    f(x)=\begin{cases}\dfrac{\sin x}{x}&(x\neq 0)\\
    1&(x=0)\end{cases}
$
とする．
$f$が$x=0$で連続であることを示せ．
"%}
{% include proof.html content="
$\varepsilon>0$を任意にとる．
任意の$x\in \mathbb{R}$で
\(
    \left| \sin x-x \right|\le |x^2|=|x|^2
\)
が成立することに注意する．
$\delta=\varepsilon>0$とすれば，$0<|x|<\delta$ならば
\[
    |f(x)-f(0)|=\left|\dfrac{\sin x}{x}-1\right|=\dfrac{|\sin x-x|}{|x|}<|x|<\delta=\varepsilon
\]
が成立し，確かに$f$は$x=0$で連続である．
" %}

[定義2](#def:lim)は関数$f$が点$a$で連続であるとは，「$f(x)$と$f(a)$の距離を限りなく$0$に近づけたとき，それに対応して$x$と$a$の距離も限りなく小さくできる」ということを意味している．ここでいう**距離**とは何であろうか．（端的に言えば関数である．では，どのような関数なのか？この問いの答えは[定義7](#def:dist)で与えられる．）

さらに[定義2](#def:lim)を見ると，極限という概念において**距離**は重要な役割を果たしている．つまり，2点間の**距離**が定義できれば極限および連続性が定義できるのである．

実数を定義域としないような関数の例として，ベクトル空間を定義域に持つ関数がある．ベクトル空間を定義域に持つ関数でも，連続であることは定義できる．

ベクトル空間の例として一般の区間を考えよう．一般の区間とは$I\subset \mathbb{R}^n$であって，$I=I_1\times I_2\times \dots \times I_n(I_i\subset \mathbb{R}$は区間)となるものである．

$\boldsymbol{x}=(x_1,\dots,x_n)\in \mathbb{R}^n$に対して，写像$||\cdot ||_2:\mathbb{R}^n\to \mathbb{R}$を
$$
    ||\boldsymbol{x}||_2=\sqrt{\sum_{i=1}^n(x_i)^2}
$$
で定める．この写像を用いると写像$f:I\to \mathbb{R}$の連続性は次のように定義される．

{% include example.html content="
<p>$I\subset \mathbb{R}^n$を区間とする．関数$f:I\to \mathbb{R}$が点$\boldsymbol{a}\in I$で連続であるとは次のことである．
任意の正の数$\varepsilon$に対して，
正の数$\delta_{\varepsilon,\boldsymbol{a}}$が存在して，
$$||\boldsymbol{x} - \boldsymbol{a}||_2<\delta_{\varepsilon,\boldsymbol{a}}$$ならば$|f(\boldsymbol{x})-f(\boldsymbol{a})|<\varepsilon$が成立する．
</p>
"%}

このように，ベクトル空間を定義域に持つ関数にも連続性を定義することができる．そこで，距離をより一般的に捉えなおし,関数の連続性を定義することを考えよう．

## 距離空間

ユークリッド空間以外の空間でも連続写像を考えるためには，2点間の距離を測れる必要がある．ここではユークリッド空間の距離を考察し，一般の距離空間を定義する．

たとえば$(1,1)\in \mathbb{R}^2$と$(2,3)\in \mathbb{R}^2$の距離は，$\sqrt{(2-1)^2+(3-1)^2}=\sqrt{1+4}=\sqrt{5}$と計算される．これを$d((1,1),(2,3))$と書けば，距離は，$d:\mathbb{R}^2\times \mathbb{R}^2\to \mathbb{R}$なる写像を考えているということである．ここからの一般化として，ユークリッド空間の間の距離を定義する．

{% include definition.html content="
<b>ユークリッド距離</b>
<p>$d:\mathbb{R}^n\times \mathbb{R}^n\to \mathbb{R}$なる写像を
\[
    d(\boldsymbol{x},\boldsymbol{y})=\sqrt{\sum_{i=1}^n(x_i-y_i)^2}
\]
で定め，この$d$を距離とよぶ．ただし，$\boldsymbol{a} \in \mathbb{R}^n$に対し$\boldsymbol{a}=(a_1,\dots,a_n)$である．
</p>
"%}

距離$d$がユークリッド距離であることを強調するとき$d_E$とかく．

<a name="prop:dist"></a>
{% include proposition.html content="
$d_E$に対して次が成立する．
\[
    \begin{align}
    d_E(\boldsymbol{x},\boldsymbol{y})&\ge 0.\\
    d_E(\boldsymbol{x},\boldsymbol{y}) &= 0 \iff \boldsymbol{x}=\boldsymbol{y}.\\
    d_E(\boldsymbol{x},\boldsymbol{y}) &= d_E(\boldsymbol{y},\boldsymbol{x}).\\
    d_E(\boldsymbol{x},\boldsymbol{z}) &\le d_E(\boldsymbol{x},\boldsymbol{y})+d_E(\boldsymbol{y},\boldsymbol{z}).
    \end{align}
\]
" %}

{% include proof.html content="
定義から，上の3つは明らかに成立する．
$d(\boldsymbol{x},\boldsymbol{y})=||\boldsymbol{x}-\boldsymbol{y}||_2$であり，コーシーシュワルツの不等式より，
$||\boldsymbol{x}+\boldsymbol{y}||_2\le||\boldsymbol{x}||_2+||\boldsymbol{y}||_2$が成り立つ．
ここから
\[
    \begin{align}
    d_E(\boldsymbol{x},\boldsymbol{z})=||\boldsymbol{x}-\boldsymbol{z}||_2&=||\boldsymbol{x}-\boldsymbol{y}+\boldsymbol{y}-\boldsymbol{z}||_2\\
    &\le ||\boldsymbol{x}-\boldsymbol{y}||_2+||\boldsymbol{y}-\boldsymbol{z}||_2\\
    &\le d_E(\boldsymbol{x},\boldsymbol{y})+d_E(\boldsymbol{y},\boldsymbol{z})
    \end{align}
\]
であり，最後の不等式も成立する．
"%}

ユークリッド距離は，上のような性質を持つ．

しかし[命題6](#prop:dist)においては$d_E(\boldsymbol{x},\boldsymbol{z})$ユークリッド空間の間の写像であるという条件を明示的に用いていない．そこで[命題6](#prop:dist)を満たすような性質を持つ関数$d$を距離と定義することが考えられる．

つまり，次のようにして一般の集合上に距離を定義する．

<a name="def:dist"></a>
{% include definition.html content="
一般の集合$X$について，写像$d:X\times X \to \mathbb{R}$が次の4つの公理を満たすとき，$d$を距離といい，対$(X,d)$を距離空間という．

\[
    \begin{aligned}
        d(x,y)&\ge 0.\\
        d(x,y)&= 0 \iff x=y.\\
        d(x,y)&= d(y,x).\\
        d(x,z)&\le d(x,y)+d(y,z).
    \end{aligned}
\]
"%}
しばしば，距離空間$(X,d)$を$X$と略記する．

ここまでで，ユークリッド空間に対する考察から距離の概念を抽象化し，距離空間を定義した．

## 距離空間での連続性

ユークリッド空間での連続性は，ユークリッド距離を用いて定義された．ここからの類推として，一般の距離空間に対しても距離を用いて連続性を定義することが考えられる．距離空間における関数の連続性の定義は次のようになる．

<a name="def:cont-map"></a><!--アンカー-->
{% include definition.html content="
$(X_1,d_1),(X_2,d_2)$を距離空間とし，$f:X_1\to X_2$を写像とする．$f$が
点$a\in X_1$で連続であるとは$f$が次を満たすことである．
<br>
任意の正の数$\varepsilon$に対して，正の数$\delta_{\varepsilon,a}$が存して，$d(x,a)<\delta_{\varepsilon,a}$ならば$d(f(x),f(a))<\varepsilon$が成立する．
"%}

連続性の概念は，ユークリッド空間におけるものから，距離が定まるより一般な集合への拡張を果たした．

今まで見てきた連続性は，定義域内の一点を固定したときに，その点に対して定まる概念であった．写像の連続性は定義域における各点での連続性に帰着される．すなわち，$(X_1,d_1),(X_2,d_2)$を距離空間とし，$f:X_1\to X_2$を写像とするとき，$f$が**連続写像**であるとは，各$a\in X_1$で$f$が連続となることである．


しかし関数の性質を調べるときには，定義域内の1点での性質ではなく，定義域全体での連続性を議論することが多い．そこで，定義域内の点をとって連続かどうかを議論するという視点を捨て，点によらない関数の連続性の定義を考えよう．距離は距離空間内の2つの点に対して定義されるものであったから，点によらずに関数の連続性を定義するために**「距離をさらに抽象化することはできないか？」**という問いが考えられる．

[定義8](#def:cont-map)における連続性の定義は，集合上に定まる距離に依存している．距離を抽象化するために，連続性の定義から距離を隠す，すなわち距離に依存しない連続性の定義を考えよう．そのために，距離に依存しない概念を見つけることから始める．

## 距離空間における点列の収束について
距離空間において距離に依存しない概念が登場するのは，点列の収束について考えるときである．一次元の数列の収束は次のように定義されていた．
{% include definition.html content="
実数からなる数列$\{a_n\}_{n\in \mathbb{Z}^+}$が$\alpha\in \mathbb{R}$に収束するとは，
任意の正の数$\varepsilon$に対して，ある正の整数$N(\varepsilon)$が存在し，$n\ge N$ならば，$|a_n-\alpha|<\varepsilon$が成立することである．

"%}
すなわち，「どんなに小さい正の数$\varepsilon$を選んでも，ある正の整数$N=N(\varepsilon)$より先の自然数に対する項は，極限値との距離を$\varepsilon$より小さくできる」ということである．数列の極限においても，収束概念の定式化には距離の概念が不可欠である．一般の距離を用いれば，距離空間の場合においても点列の収束を定義できる．
{% include definition.html content="
$X=(X,d)$を距離空間とする．Xの元からなる数列$\{a_n\}_{n\in \mathbb{Z}^+}$が$\alpha\in X$に収束するとは，
任意の正の数$\varepsilon$に対して，ある正の整数$N=N(\varepsilon)$が存在し，$n\ge N$ならば，$d(a_n,\alpha)<\varepsilon$が成立することである．

"%}
ここで，距離空間における定義に別の解釈を与えてみよう．$d(a_n,\alpha)<\varepsilon$とは，$n\ge N$なる$n$に対しては$a_n$と$\alpha$の距離が$\varepsilon$未満である，ということだった．これはつまり，$\alpha$を中心とする半径$\varepsilon$の境界を含まない円板$B(\alpha;\varepsilon)$考えたとき，$N$より先の$n$に対して，全ての$a_n$が$B(\alpha;\varepsilon)$に含まれる，ということである．つまり，収束の定義は次のような書き換えが可能である．
{% include definition.html content="
$X=(X,d)$を距離空間とする．Xの元からなる数列$\{a_n\}_{n\in \mathbb{Z}^+}$が$\alpha\in X$に収束するとは，
任意の正の数$\varepsilon$に対して，ある正の整数$N=N(\varepsilon)$が存在し，$n\ge N$ならば，$a_n \in B(\alpha;\varepsilon)$が成立することである．
"%}
これは単なる定義の書き換えと思われるかもしれない．しかしながら，この集合は，距離空間において距離の抽象化を考えるときに，非常に有用である．距離の抽象化を与える概念が，この集合を用いて表現されることを見ていこう．

## 距離を抽象化する

前節で現れた集合は，今後頻繁に現れる．そこで，この集合に名前をつけておこう．

距離空間$X=(X,d)$について，
$$
B(a;\varepsilon) = \left\{\, x\in X \, \mid d(a,x)<\varepsilon \,\right\}
$$
を$a\in X$の **$\varepsilon$近傍**という．

以下に定義する，距離空間から定まる集合は，すべて$\varepsilon$近傍から定まる概念である．その意味で，$B(a;\varepsilon)$は基本的である．

$\varepsilon$近傍の定義を見れば，$\varepsilon$近傍は境界がなく”開いている”円板，という印象を受ける．$X$の任意の部分集合にも，”開いている”集合を定義することができる．ここで，$\varepsilon$近傍が本質的な役割を果たす．
{% include definition.html content="
$A$を距離空間$X$の部分集合とする．$a\in A$に対して，$B(a ;\delta)\subset A$なる$\delta$が存在するとき，$a$を$A$の<b>内点</b>という．$A$の内点全体の集合を<b>内部</b>とよび，$A^i$とかく．
<br>
$A^c = X \backslash A$を$A$の<b>補集合</b>という．
<br>
$A^c$の内点を，$A$の<b>外点</b>という．$A$の外点全体の集合を<b>外部</b>とよび，$A^e$とかく．
外部でも内部でもない点全体の集合を<b>境界</b>とよび，$A^f$とかく．
"%}
明らかに，$A^i\subset A$が成立する．また，この定義により，$X=A^i\cup A^e \cup A^f$が非交和として成り立つ．

{% include definition.html content="
$X$を距離空間とし，$A$は$X$の部分集合とする．
$A^i=A$を満たすとき，$A$を<b>開集合</b>という．
$A^c$が開集合のとき，$A$を<b>閉集合</b>という．
"%}

集合の相当条件から，$A$が開集合であることは，$A\subset A^i$と同値である．開集合かつ閉集合となる集合も存在することに注意する．

{% include example.html content="
$\varnothing,X$などは，開かつ閉集合である．
<br>
開集合であり，かつ閉集合である集合を，<b>開閉集合（Clopen set）</b> という．
"%}

距離空間における開集合は，境界がない集合として捉えられそうである．距離空間に対してはこの感覚は正しいと考えられる．しかし，ここまでの議論では，開集合が持つ性質として抽象化できそうなものは見られない．開集合を具体的に追うことで，開集合が持つ性質を調べよう．

{% include theorem.html content="
$X$を距離空間とする．任意の$r$について$B(a;r)$は開集合である．
さらに，$A^i$は開集合であり，$A$に包まれる開集合の中で最大のものである．
" %}

{% include proof.html content="
略.
"%}

<a name="thm:open"></a><!--アンカー-->
{% include theorem.html content="
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. $(A_\lambda)_{\lambda\in \Lambda}$について，各$A_\lambda$が開集合なら$\displaystyle \bigcup_{\lambda\in \Lambda}A_\lambda$は開集合である．
<br> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. $(A_i)_{i=1}^N$について，各$A_i$が開集合なら$\displaystyle \bigcap_{i=1}^NA_i$は開集合である．
"%}

{% include proof.html content="
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. $a\in \bigcup_{\lambda\in \Lambda}A_\lambda=A$とする．ある$\lambda$が存在し，$a\in A_\lambda$であり，仮定から，$a\in A_\lambda$に対して，ある$r>0$が存在し，$B(a;r)\subset A_\lambda$となる．このとき，$B(a;r)\subset A$であり，$a$は$A$の内点である．よって，$A$は開集合である．
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. $a\in \bigcap_{i=1}^NA_i=A$とする．各$i\in \mathbb{Z}_N$に対して，$a\in A_i$であり，仮定より，ある$r_i>0$が存在して$B(a;r_i)\subset A_i$となる．$$r=\min\{r_1,\dots,r_N\}$$とすれば，すべての$i$で$B(a;r)\subset A_i$が成立する．すなわち，$B(a;r)\subset A$であり，$a$は$A$の内点である．よって，$A$は開集合である．
"%}


{% include theorem.html content="
集合が開集合であることは，開球の和集合であることと同値である．
"%}

{% include proof.html content="
開球は開集合であるから，定理13より，開球の和集合は開集合である．
$A$を開集合とする．各$a\in A$について，$r_a$が存在して，$B(a;r_a)\subset A$
となる．$\bigcup_{a\in A}B(a;r_a) \subset A,A \subset \bigcup_{a\in A}B(a;r_a)$である．よって，$A=\bigcup_{a\in A}B(a;r_a)$であり，$A$は開球の和集合である．
"%}

開集合に対して成立する種々の定理を見てきた．ここで，距離空間における開集合の性質をまとめる．

<a name="thm:op-sys"></a><!--アンカー-->
{% include theorem.html content="
距離空間$X=(X,d)$において，$d$から定まる開集合全体を$\mathcal{O}_d$とかき，$(X,d)$の<b>開集合系</b>という．$\mathcal{O}_d\subset \mathscr{P}(X)$である．さらに，開集合系にたいして次が成立する．
\[
    \begin{align}
        \tag{1}\label{axiom:1}
        & \varnothing,X\in \mathcal{O}_d.\\
        \tag{2}\label{axiom:2}
        & O_1,O_2\in \mathcal{O}_d ~ \implies O_1\cap O_2\in \mathcal{O}_d.\\
        \tag{3}\label{axiom:3}
        & (\forall \lambda\in \Lambda\,(O_\lambda \in \mathcal{O}_d) )\implies \bigcup_{\lambda\in \Lambda}O_\lambda \in \mathcal{O}_d.
    \end{align}
\]
"%}

[定理18](#thm:op-sys)<!--参照-->は，$\mathcal{O}_d$が距離から定まる集合であるという条件を明示的に用いていない．ここで，距離空間における開集合が満たす性質$(\ref{axiom:1})$～$(\ref{axiom:3})$を公理として採用できないか，ということを考える．詳しくは，次の節で述べよう．

ここで，開集合と似た概念である近傍に関するいくつかの定義を確認しておこう．

{% include definition.html content="
$X$を距離空間とする．$a\in X$が$X$の部分集合$U$の内点となるとき，$U$を$a$の<b>近傍</b>という．点$a$の近傍全体の集合を$\mathfrak{N}(a)$とかき，<b>近傍系</b>という．
"%}

近傍を用いて[定義8](#def:cont-map)における連続性の定義を書き直す．[^neighborhood]

[^neighborhood]:近傍系を用いて開集合を定義し，位相空間を定義することもできる．(またの機会に……)

<a name="def:cont"></a><!--アンカー-->
{% include definition.html content="
$(X_1,d_1),(X_2,d_2)$を距離空間とし，$f:X_1\to X_2$を写像とする．$f$が
点$a\in X_1$で連続であるとは次のことである．<br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;「任意の正の数$\varepsilon$に対して$d(x,a)<\delta_{\varepsilon,a}$ならば，$d(f(x),f(a))<\varepsilon$を満たす正の数$\delta_{\varepsilon,a}$が存在する．」
<br>
$\iff$
「任意の正の数$\varepsilon$に対して$x\in B(a;\delta_{\varepsilon,a})$ならば，$f(x)\in B(f(a);\varepsilon)$を満たす正の数$\delta_{\varepsilon,a}$が存在する．」
<br>
$\iff$
「任意の正の数$\varepsilon$に対して$x\in B(a;\delta_{\varepsilon,a})$ならば，$x\in f^{-1}(B(f(a);\varepsilon))$を満たす正の数$\delta_{\varepsilon,a}$が存在する．」
<br>
$\iff$
「任意の正の数$\varepsilon$に対して$B(a;\delta_{\varepsilon,a})\subset 
f^{-1}(B(f(a);\varepsilon))$を満たす正の数$\delta_{\varepsilon,a}$が存在する．」
<br>
$\iff$ 「$f(a)$の近傍$U$について，$f^{-1}(U)$が$a$の近傍になる．」
"%}

[定義8](#def:cont-map)のあとで注意したように，写像の連続性は定義域の各点の連続性の議論に帰着される．

[定義20](#def:cont)の1,2,3,4は任意の$\varepsilon>0$に対しての定義となっているが，$\varepsilon'>\varepsilon>0$に対して，$f^{-1}(B(f(a);\varepsilon))\subset f^{-1}(B(f(a);\varepsilon'))$となるから，十分小さい$\varepsilon$にたいして，$d(x,a)<\delta_{\varepsilon,a}$ならば，$d(f(x),f(a))<\varepsilon$を満たす正の数$\delta_{\varepsilon,a}$が存在することを確認すればよい．


ここまで距離空間と距離空間上に定まる開集合を見てきた．[定義20](#def:cont)の書き換えを念頭に置けば，開集合を用いて連続写像を簡明に表現できる．

<a name="thm:cont-op"></a><!--アンカー-->
{% include theorem.html content="
$(X_1,d_1),(X_2,d_2)$を距離空間とし，$f:X_1\to X_2$を写像とする．<i>TFAE.</i>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. $f$は連続である．
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. $X_2$の開集合$Q$について$f^{-1}(Q)$は$X_1$の開集合である．
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. $X_2$の閉集合$Q$について$f^{-1}(Q)$は$X_1$の閉集合である．
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. $f\left(\overline{A}\right)\subset \overline{f(A)}.$
"%}

ここで<i><b>TFAE</b></i>は"The Followings Are Equivalent"（以下はすべて互いに同値）の略である．

簡単に1,2,3の同値性を述べる．

{% include proof.html content="
<b>1$\implies$2を示す．</b>
<br>
$Q$を$X_2$の開集合とし，$P=f^{-1}(Q)$とおく．
$a\in P\iff f(a)\in Q$であり，$a\in P$ならば，ある$\varepsilon>0$によって，
$B(f(a);\varepsilon)\subset Q$とできる．$f$は連続であるから，$\varepsilon$に対して，
$B(a;\delta) \subset f^{-1}(B(f(a);\varepsilon))$となる$\delta$が存在する．
よって，$B(a;\delta) \subset f^{-1}(B(f(a);\varepsilon))\subset f^{-1}(Q)=P$であり，
$P$は開集合である．
<br>
<b>2$\implies $1を示す．</b>
<br>
任意の$\varepsilon>0$に対して，$B(f(a);\varepsilon)$は開集合である．
よって，$f^{-1}(B(f(a);\varepsilon))$も開集合であり，$\varepsilon$にたいして，$B(a;\delta)\subset f^{-1}(B(f(a);\varepsilon))$とな$\delta$が存在する．これは，$f$が連続であることを示している．
<br>
<b>2$\iff $3を示す．</b>
<br>$(f^{-1}(Q))^c=f^{-1}(Q^c)$に注意すれば，「$Q$が閉集合ならば，$f^{-1}(Q)$は閉集合である．」$\iff$「$Q^c$が開集合ならば，$f^{-1}(Q^c)$は開集合である．」であり，同値性が示される．
"%}

[定理21](#thm:cont-op)<!--参照-->により，距離空間の間の連続写像は，開集合の概念のみを用いて表現されることがわかった．

つまり，開集合を距離によらず定義できれば[定理21](#thm:cont-op)の命題のうちの一つを連続写像の定義として採用できるということである．

## 位相空間での連続写像

距離空間における開集合全体の集合は，[定理18](#thm:op-sys)の性質を満たす．そこからの抽象化として，距離空間における開集合が満たすべき性質を取り出し，開集合の定義とする．

{% include definition.html content="
集合$X$と$\mathcal{O}\subset \mathscr{P}(X)$について，$\mathcal{O}$が<b>位相</b>であるとは次の3つの公理を満たすことである．
\[
    \begin{align}
        (1) \quad & \varnothing,X\in \mathcal{O}.\\
        (2) \quad & O_1,O_2\in \mathcal{O} ~ \implies O_1\cap O_2\in \mathcal{O}.\\
        (3) \quad & (\forall \lambda\in \Lambda\,(O_\lambda \in \mathcal{O}) )\implies \bigcup_{\lambda\in \Lambda}O_\lambda \in \mathcal{O}.
    \end{align}
\]
このとき，組$(X,\mathcal{O})$を$\mathcal{O}$を<b>開集合系</b>とする<b>位相空間</b>という．
"%}
しばしば，位相空間$(X,\mathcal{O})$を，位相空間$X$と略記する．$U\in \mathcal{O}$なる$U$を$\mathcal{O}$-開集合という．位相が明らかである場合には，単に開集合ということもある．2つ目の公理より，$\mathcal{O}$は有限個の交叉で閉じている．

上の公理は，距離空間の開集合系に対して成り立つ性質([定理18](#thm:op-sys))からの類推によって得られた．以上により距離の定まっていない集合に対しても開集合を導入することができた．同じように，距離空間に対する連続写像の定理を援用し，位相空間の間の連続写像の定義とする．

{% include definition.html content="
$(X_1,\mathcal{O}_1),(X_2,\mathcal{O}_2)$を位相空間とする．写像$f:X_1\to X_2$が連続であるとは，任意の$Q\in \mathcal{O}_2$に対して，$f^{-1}(Q)\in \mathcal{O}_1$となることである．
"%}

以上で，位相空間の間の連続写像が定義できた．

異なる位相を入れた位相空間の間の恒等写像に対しては，次のような性質がある．

{% include example.html content="
$(X,\mathcal{O}_1,(X,\mathcal{O}_2)$を位相空間とし，$f:(X,\mathcal{O}_1)\to (X,\mathcal{O}_2)$を恒等写像とする．$f$が連続写像であることは，$\mathcal{O}_2\subseteq \mathcal{O}_1$となることと同値である．
"%}

{% include proof.html content="
各$x\in X$に対して，$f(x)=x$であることに注意すれば，定義より，$f$が連続であるとは，$\mathcal{O}_2$-開集合$Q$について，$f^{-1}(Q)=Q$が$\mathcal{O}_1$-開集合となることであり，これは，$Q\in \mathcal{O}_2\implies Q\in \mathcal{O}_1$となることと同値であるから，$f$が連続であることは，$\mathcal{O}_2\subseteq \mathcal{O}_1$となることと同値である．
"%}

距離空間$(X,d)$において，$d$から定まる開集合全体を$\mathcal{O}_d$とおくと，$\mathcal{O}_d$は位相である．よって，すべての距離空間は位相空間となる．すなわち位相空間は距離空間を一般化したものと捉えられる．

## おわりに

今回は，位相空間の一般論に踏み込まず，連続写像に焦点を当てました．位相空間のことはあまり知らないため，勉強してまた何か書くことができればいいと思います．
ありがとうございました．

## 参考文献

1. 内田伏一　(1986).『数学シリーズ　集合と位相』,裳華房．
2. 松坂和夫　(2018).『解析入門　中』,岩波書店.
