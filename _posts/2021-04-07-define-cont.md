---
layout: article
title: "連続写像の定義"
parmalink: /posts/define-cont
author: zab
date: 2021-04-07 
tags: 位相空間論
modify_date: 
mathjax_autoNumber: false
---

## はじめに

今回の主題は，位相空間の間の連続写像を定義することです．そのために，高校数学までの素朴な定義から出発し，距離空間における連続写像を取り扱います．距離空間における開集合系の性質を述べ，慣例に則って，位相を開集合系によって定義します．最後に，位相を用いた連続写像の表現を定義します．本編では，語尾はである調で統一しています．

## $\varepsilon\delta$論法による連続性の定義

ここでは，距離空間の連続写像を考えるために，高校での連続の定義の問題点を挙げ，$\varepsilon\delta$論法による連続の定義を行う．
高校までで学んだ連続の定義は，次のようであった．

定義(?)．
:   :   $a$を$f(x)$の定義域に属する値とするとき，関数$f(x)$が$x=a$で連続であるとは，次の2つのことが満たされていることである．[^oshima]
1. 極限値$\lim_{x\to a}f(x)$が存在する．
2. $\lim_{x\to a}f(x)=f(a)$が成立する．

[^oshima]: 大島利雄ほか13名著 (2018).極限,『改訂版　数学III』,数研出版,pp.141-142.より引用．

上の定義の問題点は，「極限値$\lim_{x\to a}f(x)$が存在する．」が定義されていないということである．これは，「存在する」という概念が明確でなく問題がある．素朴には，$f,g$が点$a$で連続な関数であるとき，$f+g,fg,f/g$が点$a$連続かどうかという問いに答えることができない．これは，極限の式を用いる限り存在する問題であるため，連続の定義には極限の記号を使わない形式を導入することが必要だということがわかる．そこで，極限の存在と連続であることを次のように定義する．


定義 1.
:   **極限が存在すること**
$I\subset \mathbb{R}$を区間とする．$f:I\to \mathbb{R}$に対して$\lim_{x\to a}f(x)=\alpha$とは次のことである．
ある実数$\alpha$が存在し，任意の$\varepsilon>0$に対して，ある$\delta$が存在して，$0<|x-a|<\delta$ならば$|f(x)-\alpha|<\varepsilon$が成立する．

    **連続であること**
$I\subset \mathbb{R}$を区間として，$a\in I$を固定する．関数$f:I\to \mathbb{R}$が点$a$で連続であるとは次のことである．
任意の正の数$\varepsilon$に対して，正の数$\delta_{\varepsilon,a}$が存在し，$|x-a|<\delta_{\varepsilon,a}$ならば$|f(x)-f(a)|<\varepsilon$が成立する．

極限の存在に対しては，$f$は点$a$で定義されていなくてよいことがわかる．連続の定義では，$f$は点$a$で定義されていなけらばならない．
この定義は，論理式を直訳したような形をとっており，具体的にどのように利用するのかがわかりにくい．そこで，具体的に例を挙げる．

e.g.
:   $$
f(x)=
\begin{cases}\dfrac{\sin x}{x}&(x\neq 0)\\
1&(x=0)
\end{cases}
$$

が$x=0$で連続であることを示す．$f:\mathbb{R}\to \mathbb{R}$である．$\varepsilon>0$を任意にとる．任意の$x\in \mathbb{R}$で$|\sin x-x|\le|x^2|=|x|^2$が成立することに注意する．$\delta=\varepsilon>0$とすれば，$0<|x|<\delta$ならば，$|f(x)-f(0)|=\left|\dfrac{\sin x}{x}-1\right|=\dfrac{|\sin x-x|}{|x|}<|x|<\delta=\varepsilon$が成立し，確かに$f$は$x=0$で連続である．$\Box$
{: success}

つまり，関数$f$が点$a$で連続であるとは，$f(x)$と$f(a)$の差を限りなく$0$に近づけたとき，それに対応して$x$と$a$の差も限りなく小さくできる，ということである．さらに，定義を見れば，2点間の距離が定義できれば，極限，連続であることは定義できそうである．実際に，ベクトルを定義域に持つ関数でも，連続であることは定義できる．
一般の区間とは$I\subset \mathbb{R}^n$であって，$I=I_1\times I_2\times \dots \times I_n(I_i\subset \mathbb{R}$は区間)となるものである．$\boldsymbol{x}=(x_1,\dots,x_n)\in \mathbb{R}^n$に対して，写像$||\cdot ||_2:\mathbb{R}^n\to \mathbb{R}$を
$$
||\boldsymbol{x}||_2=\sqrt{\sum_{i=1}^n(x_i)^2}
$$
で定める．この写像をユークリッドノルムという．ユークリッドノルムを用いての連続性は次のように定義される．

定義 2.
:   **連続であること**
$I\subset \mathbb{R}^n$を区間とする．関数$f:I\to \mathbb{R}$が点$\boldsymbol{a}\in I$で連続であるとは次のことである．
任意の正の数$\varepsilon$に対して，正の数$\delta_{\varepsilon,\boldsymbol{a}}$が存在して，$||\boldsymbol{x}-\boldsymbol{a}||_2<\delta_{\varepsilon,\boldsymbol{a}}$ならば$|f(\boldsymbol{x})-f(\boldsymbol{a})|<\varepsilon$が成立する．

## 距離空間での連続性

ノルムは，ベクトルそのものの大きさを測る写像である．ユークリッド空間以外の空間でも連続写像を考えるためには，2点間の距離を直接測れる方がよい．ここではユークリッド空間の距離を考察し，一般の距離空間を定義する．


$(1,1)\in \mathbb{R}^2$と$(2,3)\in \mathbb{R}^2$の距離は，$\sqrt{(2-1)^2+(3-1)^2}=\sqrt{1+4}=\sqrt{5}$と計算される．これを$d((1,1),(2,3))$と書けば，距離は，$d:\mathbb{R}^2\times \mathbb{R}^2\to \mathbb{R}$なる写像を考えているということである．ここからの一般化として，ユークリッド空間の間の距離を定義する．

ユークリッド距離．
:   $d:\mathbb{R}^n\times \mathbb{R}^n\to \mathbb{R}$なる写像を，$$
d(\boldsymbol{x},\boldsymbol{y})=\sqrt{\sum_{i=1}^n(x_i-y_i)^2}
$$
で定め，この$d$を距離とよぶ．ただし，$\boldsymbol{a}=(a_1,\dots,a_n)$である．

ユークリッド距離であることを強調するとき，ユークリッド距離を$d_E$とかく．

命題.
:   $d_E$に対して次が成立する．
$$
d_E(\boldsymbol{x},\boldsymbol{y})\ge 0.\\
d_E(\boldsymbol{x},\boldsymbol{y})= 0 \iff \boldsymbol{x}=\boldsymbol{y}.\\
d_E(\boldsymbol{x},\boldsymbol{y})= d_E(\boldsymbol{y},\boldsymbol{x}).\\
d_E(\boldsymbol{x},\boldsymbol{z})\le d_E(\boldsymbol{x},\boldsymbol{y})+d_E(\boldsymbol{y},\boldsymbol{z}). 
$$

Proof.
:   定義から，上の3つは明らかに成立する．$d(\boldsymbol{x},\boldsymbol{y})=||\boldsymbol{x}-\boldsymbol{y}||_2$であり，コーシーシュワルツの不等式より，$||\boldsymbol{x}+\boldsymbol{y}||_2\le||\boldsymbol{x}||_2+||\boldsymbol{y}||_2$が成り立つ．ここから，$d_E(\boldsymbol{x},\boldsymbol{z})=||\boldsymbol{x}-\boldsymbol{z}||_2=||\boldsymbol{x}-\boldsymbol{y}+\boldsymbol{y}-\boldsymbol{z}||_2\le ||\boldsymbol{x}-\boldsymbol{y}||_2+||\boldsymbol{y}-\boldsymbol{z}||_2\le d_E(\boldsymbol{x},\boldsymbol{y})+d_E(\boldsymbol{y},\boldsymbol{z})$であり，最後の不等式も成立する．$\Box$

ユークリッド距離は，上のような性質を持つ．ここで，命題の主張は，ユークリッド空間の間の写像であるということを明らかにしていない．ここで考えられるのは，ユークリッド距離が持つ性質を一般の”距離”の公理として採用するのできるのではないかということである．実際にそれは可能であり，次のように，一般の集合上にも距離が定義できる．

定義 3.
:   一般の集合$X$について，写像$d:X\times X \to \mathbb{R}$が次の4つの公理を満たすとき，$d$を距離といい，対$(X,d)$を距離空間という． 

$$
d(x,y)\ge 0.\\
d(x,y)= 0 \iff x=y.\\
d(x,y)= d(y,x).\\
d(x,z)\le d(x,y)+d(y,z). 
$$

しばしば，距離空間$(X,d)$を$X$と略記する．

ユークリッド空間での連続性は，ユークリッド距離に対して定まるものである．ここからの類推として，一般の距離空間に対しても連続性が定義できるのではないかということが考えられる．実際に，距離空間の間に連続性が定義できる．距離空間の間の写像の連続性の定義は次のようになる．

定義 4.
:   $(X_1,d_1),(X_2,d_2)$を距離空間とし，$f:X_1\to X_2$を写像とする．$f$が
点$a\in X_1$で連続であるとは次のことである．
任意の正の数$\varepsilon$に対して，正の数$\delta_{\varepsilon,a}$が存して，$d(x,a)<\delta_{\varepsilon,a}$ならば$d(f(x),f(a))<\varepsilon$が成立する．

今まで見てきた連続性は，定義域内の一点を固定したときに，その点に対して定まる概念であった．一般に連続性を考えるときはある集合全体での連続性を議論することが多い．そこで，点によらない連続の定義をする．すなわち，$(X_1,d_1),(X_2,d_2)$を距離空間とし，$f:X_1\to X_2$を写像とするとき，$f$が連続写像であるとは，各$a\in X_1$で$f$が連続となることである．こうして，写像の連続性は各点での連続性に帰着されることがわかる．

ここまでで，ユークリッド空間に対する考察から距離の概念を抽象化し，距離空間を定義した．連続性の概念は，ユークリッド空間におけるものから，距離が定まる集合への拡張を果たした．ここで私たちが考えることは，連続性をさらに抽象化することはできないか？ということである．定義4における連続性の定義は，集合上に定まる距離に依存している．ここから更なる抽象化を考えるとき，連続性の定義から距離を隠すことが必要になる．距離の抽象化として何が考えられるのかというところで，集合を用いることを思いつく．距離から定まる何らかの集合を定義できれば，距離を排して抽象化できそうである．そして実際に，距離に依存しない連続性の定義は可能であることを見る．

## 距離の抽象化を目指して
距離から定まる最も基本的な集合を定義する．
距離空間$X=(X,d)$について，$B(a;\varepsilon)=\{\, x\in X \, \mid d(a,x)<\varepsilon \,\}$を$a\in X$の$\varepsilon$近傍という．
これから定義する距離空間から定まる集合は，すべて$\varepsilon$近傍から定まる概念である．その意味で，$B(a;\varepsilon)$は基本的である．

定義 5. 
:   距離空間$X$の部分集合$A$について考える．$a\in A$に対して，$B(a ;\delta)\subset A$なる$\delta$が存在するとき，$a$を$A$の内点という．$A$の内点全体の集合を内部とよび，$A^i$とかく．
$A^c$の内点を，$A$の外点という．$A$の外点全体の集合を外部とよび，$A^e$とかく．
外部でも内部でもない点全体の集合を境界とよび，$A^f$とかく．
明らかに，$A^i\subset A$が成立する．また，この定義により，$X=A^i\cup A^e \cup A^f$が非交和として成り立つ．

定義 6. 
:   $X$を距離空間とし，$A$は$X$の部分集合とする．
$A^i=A$を満たすとき，$A$を開集合という．
$A^c$が開集合のとき，$A$を閉集合という．

集合の相当条件から，$A$が開集合であることは，$A\subset A^i$と同値である．開集合かつ閉集合となる集合も存在することに注意する．

e.g.
:   $\varnothing,X$などは，開かつ閉集合である．開集合であり，かつ，閉集合である集合を，**Clopen set**という．

距離空間における開集合は，境界がない集合として捉えられそうである．距離空間に対してはこの感覚は正しいと考えられる．しかし，ここまでの議論では，開集合が持つ性質として抽象化できそうなものは見られない．開集合を具体的に追うことで，開集合が持つ性質を調べる．

定理 7.
:   $X$を距離空間とする．任意の$r$について$B(a;r)$は開集合である．
さらに，$A^i$は開集合であり，$A$に包まれる開集合の中で最大のものである．

*Proof.*
:   略． $\Box$



定理 8.
:   (1) $(A_\lambda)_{\lambda\in \Lambda}$について，各$A_\lambda$が開集合なら$\displaystyle \bigcup_{\lambda\in \Lambda}A_\lambda$は開集合である．
(2) $(A_i)_{i=1}^N$について，各$A_i$が開集合なら$\displaystyle \bigcap_{i=1}^NA_i$は開集合である．

*Proof.*
:   (1)を示す．$a\in \bigcup_{\lambda\in \Lambda}A_\lambda=A$とする．ある$\lambda$が存在し，$a\in A_\lambda$であり，仮定から，$a\in A_\lambda$に対して，ある$r>0$が存在し，$B(a;r)\subset A_\lambda$となる．このとき，$B(a;r)\subset A$であり，$a$は$A$の内点である．よって，$A$は開集合である．
(2)を示す．$a\in \bigcap_{i=1}^NA_i=A$とする．各$i\in \mathbb{Z}_N$に対して，$a\in A_i$であり，仮定より，ある$r_i>0$が存在して$B(a;r_i)\subset A_i$となる．$r=\min\{r_1,\dots,r_N\}$とすれば，すべての$i$で$B(a;r)\subset A_i$が成立する．すなわち，$B(a;r)\subset A$であり，$a$は$A$の内点である．よって，$A$は開集合である．$\Box$



定理 9.
:   集合が開集合であることは，開球の和集合であることと同値である．



*Proof.*
:   開球は開集合であるから，定理8より，開球の和集合は開集合である．
$A$を開集合とする．各$a\in A$について，$r_a$が存在して，$B(a;r_a)\subset A$
となる．$\bigcup_{a\in A}B(a;r_a) \subset A,A \subset \bigcup_{a\in A}B(a;r_a)$である．よって，$A=\bigcup_{a\in A}B(a;r_a)$であり，$A$は開球の和集合である． $\Box$

開集合に対して成立する種々の定理を見てきた．ここで，距離空間における開集合の性質をまとめる．

定理10．
:   距離空間$X=(X,d)$において，$d$から定まる開集合全体を$\mathcal{O}_d$とかき，$(X,d)$の**開集合系**という．$\mathcal{O}_d\subset \mathscr{P}(X)$である．さらに，開集合系にたいして次が成立する．
$$
\begin{align*}
(1)&\ \varnothing,X\in \mathcal{O}_d.\\
(2)&\ O_1,O_2\in \mathcal{O}_d\implies O_1\cap O_2\in \mathcal{O}_d.\\
(3)&\ (\forall \lambda\in \Lambda\,(O_\lambda \in \mathcal{O}_d))\implies \bigcup_{\lambda\in \Lambda}O_\lambda \in \mathcal{O}_d.
\end{align*}
$$

定理10は，$\mathcal{O}_d$が距離から定まる集合であるということを明らかにしていない．ここで，距離空間における開集合が満たす性質を公理として採用できないか，ということを考える．そして，それは実際に可能である．詳しくは，次の節で述べる．

定義 11.
:   $X$を距離空間とする．$a\in X$が$X$の部分集合$U$の内点となるとき，$U$を$a$の近傍という．点$a$の近傍全体の集合を$\mathfrak{N}(a)$とかき，**近傍系**という．

近傍系を用いて開集合を定義し，位相空間を定義することもできる．(またの機会に……)
近傍を用いて連続の定義を書き直す．


定義 12.
:   $(X_1,d_1),(X_2,d_2)$を距離空間とし，$f:X_1\to X_2$を写像とする．$f$が
点$a\in X_1$で連続であるとは次のことである．

「任意の正の数$\varepsilon$に対して$d(x,a)<\delta_{\varepsilon,a}$ならば，$d(f(x),f(a))<\varepsilon$を満たす正の数$\delta_{\varepsilon,a}$が存在する．」
$\iff$
「任意の正の数$\varepsilon$に対して$x\in B(a;\delta_{\varepsilon,a})$ならば，$f(x)\in B(f(a);\varepsilon)$を満たす正の数$\delta_{\varepsilon,a}$が存在する．」
$\iff$
「任意の正の数$\varepsilon$に対して$x\in B(a;\delta_{\varepsilon,a})$ならば，$x\in f^{-1}(B(f(a);\varepsilon))$を満たす正の数$\delta_{\varepsilon,a}$が存在する．」
$\iff$
「任意の正の数$\varepsilon$に対して$B(a;\delta_{\varepsilon,a})\subset 
f^{-1}(B(f(a);\varepsilon))$を満たす正の数$\delta_{\varepsilon,a}$が存在する．」
$\iff$ 「$f(a)$の近傍$U$について，$f^{-1}(U)$が$a$の近傍になる．」

定義4のあとで注意したように，写像の連続性は定義域の各点の連続性の議論に帰着される．

Remark 13.
:   $\varepsilon'>\varepsilon>0$に対して，$f^{-1}(B(f(a);\varepsilon))\subset f^{-1}(B(f(a);\varepsilon'))$
となるから十分小さい$\varepsilon$にたいして包含が成立することを確認すればよい．

ここまで，連続写像を抽象化するために，距離から定まる特別な集合を考えてきた．定義12の書き換えを念頭に置き，開集合の概念を用いれば，連続写像の概念を簡明に表現できる．

定理 14.
:   $(X_1,d_1),(X_2,d_2)$を距離空間とし，$f:X_1\to X_2$を写像とする．

*TFAE(The Followings Are Equivalent)*

1.  $f$は連続である．

2.  $X_2$の開集合$Q$について$f^{-1}(Q)$は$X_1$の開集合である．

3.  $X_2$の閉集合$Q$について$f^{-1}(Q)$は$X_1$の閉集合である．

4.  $f(\overline{A})\subset \overline{f(A)}.$


ここでは，簡単に1,2,3の同値性を述べる．


*Proof.*
:   $1\implies2$を示す．$Q$を$X_2$の開集合とし，$P=f^{-1}(Q)$とおく．
$a\in P\iff f(a)\in Q$であり，$a\in P$ならば，ある$\varepsilon>0$によって，
$B(f(a);\varepsilon)\subset Q$とできる．$f$は連続であるから，$\varepsilon$に対して，
$B(a;\delta) \subset f^{-1}(B(f(a);\varepsilon))$となる$\delta$が存在する．
よって，$B(a;\delta) \subset f^{-1}(B(f(a);\varepsilon))\subset f^{-1}(Q)=P$であり，
$P$は開集合である．
$2\implies 1$を示す．任意の$\varepsilon>0$に対して，$B(f(a);\varepsilon)$は開集合である．
よって，$f^{-1}(B(f(a);\varepsilon))$も開集合であり，$\varepsilon$にたいして，$B(a;\delta)\subset f^{-1}(B(f(a);\varepsilon))$とな$\delta$が存在する．これは，$f$が連続であることを示している．
$2 \iff 3$を示す． $(f^{-1}(Q))^c=f^{-1}(Q^c)$に注意すれば，「$Q$が閉集合ならば，$f^{-1}(Q)$は閉集合である．」$\iff$「$Q^c$が開集合ならば，$f^{-1}(Q^c)$は開集合である．」であり，同値性が示される．$\Box$

定理13により，距離空間の間の連続写像は，開集合の概念のみを用いて表現されることがわかった．ここから示唆されることは，開集合を距離に依らず定義できれば定理14を連続写像の定義として採用できる，ということである．

## 位相空間での連続写像
距離空間における開集合全体の集合は，定理10の性質を満たす．そこからの抽象化として，距離空間における開集合が満たすべき性質を取り出し，開集合の定義とする．

定義 15.
:   集合$X$と$\mathcal{O}\subset \mathscr{P}(X)$について，$\mathcal{O}$が**位相**であるとは次の3つの公理を満たすことである．
$$
\begin{align*}
(1)&\ \varnothing,X\in \mathcal{O}\\
(2)&\ O_1,O_2\in \mathcal{O}\implies O_1\cap O_2\in \mathcal{O}\\
(3)&\ (\forall \lambda \in \Lambda\, (O_\lambda\in \mathcal{O}))\implies \bigcup_{\lambda\in \Lambda}O_\lambda \in \mathcal{O}
\end{align*}
$$
このとき，組$(X,\mathcal{O})$を$\mathcal{O}$を**開集合系**とする**位相空間**という．しばしば，位相空間$(X,\mathcal{O})$を，位相空間$X$と略記する．$U\in \mathcal{O}$なる$U$を$\mathcal{O}$-開集合という．位相が明らかである場合には，単に開集合ということもある．2つ目の公理より，$\mathcal{O}$は有限個の交叉で閉じている．

上の公理は，距離空間の開集合系に対して成り立つ性質からの示唆である．こうして，距離の定まっていない集合に対しても開集合を導入することができた．同じように，距離空間に対する連続写像の定理を援用し，位相空間の間の連続写像の定義とする．

定義 16.
:   $(X_1,\mathcal{O}_1),(X_2,\mathcal{O}_2)$を位相空間とする．写像$f:X_1\to X_2$が連続であるとは，任意の$Q\in \mathcal{O}_2$に対して，$f^{-1}(Q)\in \mathcal{O}_1$となることである．

異なる位相を入れた位相空間の間の恒等写像に対しては，次のような性質がある．

e.g. 
:   $(X,\mathcal{O}_1,(X,\mathcal{O}_2)$を位相空間とし，$f:(X,\mathcal{O}_1)\to (X,\mathcal{O}_2)$を恒等写像とする．$f$が連続写像であることは，$\mathcal{O}_2\subseteq \mathcal{O}_1$となることと同値である．実際，各$x\in X$に対して，$f(x)=x$であることに注意すれば，定義より，$f$が連続であるとは，$\mathcal{O}_2$-開集合$Q$について，$f^{-1}(Q)=Q$が$\mathcal{O}_1$-開集合となることであり，これは，$Q\in \mathcal{O}_2\implies Q\in \mathcal{O}_1$となることと同値であるから，$f$が連続であることは，$\mathcal{O}_2\subseteq \mathcal{O}_1$となることと同値である．$\Box$

以上で，位相空間に対する連続写像の定義ができた．距離空間$(X,d)$において，$d$から定まる開集合全体を$\mathcal{O}_d$とおくと，$\mathcal{O}_d$は位相である．よって，すべての距離空間は位相空間となる．こうして，位相空間は，距離空間の一般化として捉えることもできる．

##まとめ
今回は，位相空間の一般論に踏み込まず，連続写像に焦点を当てました．位相空間のことはあまり知らないため，勉強してまた何か書くことができればいいと思います．
ありがとうございました．
## 参考文献
内田伏一　(1986).『数学シリーズ　集合と位相』,裳華房．
松坂和夫　(2018).『解析入門　中』,岩波書店．