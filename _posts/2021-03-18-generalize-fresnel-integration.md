---
layout: article
title: "フレネル積分の一般化について"
permalink: /posts/generalize-fresnel-integral
author: 
date:   2021-03-18 14:45:00 +0900
modify_date: 
tags: 解析学 複素関数論
mathjax_autoNumber: false
---

## 要約

フレネル積分を一般化した積分$\displaystyle \int_0^\infty \sin(x^k)dx$の値は

$$
\int_0^\infty \sin(x^k)dx=\Gamma\left(1+\frac{1}{k}\right)\sin\left(\frac{\pi}{2k}\right)
$$

である．

## フレネル積分

フレネル積分は

$$
\int_0^\infty \sin(x^2)dx
$$

で表される積分である．ここでは，$x^2$を$x^k(k\geqq 2)$に置き換えた

$$
\int_0^\infty \sin(x^k)dx
$$

をフレネル積分の一般化とし，この値を求める．ただし$k$は整数とする．
積分を求める道具として，コーシーの積分定理を用いる．

## コーシーの積分定理

単連結領域$D$上で正則な関数$f(z)$，$D$内の任意の有限長の閉曲線$C$について

$$
\oint_C f(z)dz=0
$$

が成立する．

また，特に次の不等式が成立することに注意する．

$\sin \theta$に関する不等式
:   $0\le \theta \le \pi/2$なる$\theta$に対して

    $$
    \sin \theta \ge \frac{2}{\pi}\theta
    $$

    が成立する．

    証明
    :   グラフを考えればほとんど明らかである．$f(\theta)=\sin \theta-\dfrac{2}{\pi}\theta$とおく．$f'(\theta)=\cos \theta -\dfrac{2}{\pi}$である．$0<\dfrac{2}{\pi}<1$と$\cos \theta$の単調性から，$\cos\alpha =\dfrac{2}{\pi}$なる$\alpha(0< \alpha < \dfrac{\pi}{2})$がただ一つ存在する．$f(\theta)$は$0<\theta<\alpha$で単調増加，$\alpha<\theta<\dfrac{\pi}{2}$で単調減少である．$f(0)=f(\pi/2)=0$から
    
    $$
    f(\theta)\ge 0\Longleftrightarrow \sin \theta-\dfrac{2}{\pi}\theta \ge 0\Longleftrightarrow \sin \theta \ge \dfrac{2}{\pi}\theta. 
    $$

    <div style="text-align: right;"> $\Box$ </div>

## 積分を分解する

$$
f(z)=\exp(iz^k)
$$

とおき，下の画像のような積分路で$f(z)$を積分する．向きは，$C_1$は原点から$(R,0)$向き，$C_2$は反時計回り，$C_3$は弧の端から原点向きである．$C=C_1+C_2+C_3$とする．$C$は$\mathbb{C}$内の単純閉曲線となる．

![画像](https://github.com/Y-Naka-implicit/Y-Naka-implicit/blob/main/equation.jpg?raw=true)

$f(z)$は全平面で正則であるから，とくに$C$の中で正則である．よって，コーシーの積分定理より

$$
\oint_C f(z)dz=\int_{C_1}f(z)dz+\int_{C_2}f(z)dz+\int_{C_3}f(z)dz=0
$$

が成立する．$\displaystyle I_i=\int_{C_i}f(z)dz$とおくと，定義から$I_1+I_2+I_3=0$が成り立つ．

$$
\begin{align}
C_1&=\{ t \mid 0\le t \le R \},\\
C_2&=\{ Re^{i\theta} \mid 0\le \theta \le \dfrac{\pi}{2k} \},\\
C_3&=\{\, te^{i\frac{\pi}{2k}} \mid 0\le t \le R \, \}
\end{align}
$$

であるから

$$
\begin{align}
I_1&=\int_{C_1}f(z)dz=\int_0^R \exp(it^k)dt,\\
I_2&=\int_0^{\frac{\pi}{2k}}\exp(iR^ke^{ik\theta})Rie^{i\theta}d\theta,\\
I_3&=\int_{C_3}\exp(iz^k)dz\\
    &=-e^{i\frac{\pi}{2k}}\int_0^R \exp (it^k\cdot e^{i\frac{\pi}{2}})dt\\
    &=-e^{i\frac{\pi}{2k}}\int_0^R \exp (-t^k)dt
\end{align}
$$

である．

$$
\lim_{R\to \infty}\mathrm{Im}\, I_1 = \int_0^\infty \sin(x^k)dx
$$

であるため，$I_1, I_2$の値がわかれば$I_1 = -(I_2+I_3)$から$\displaystyle \int_0^\infty \sin(x^k)dx$の値が求められる．

## 積分の値を求める

### $I_2$の値

$0\le \theta \le \dfrac{\pi}{2k}$より，$0\le k\theta \le \dfrac{\pi}{2}$である．これを用いると

$$
\begin{align}
|I_2| &\le R\int_0^{\frac{\pi}{2k}}\exp(-R^k\sin k\theta)d\theta\\
    & \le R\int_0^{\frac{\pi}{2k}}\exp(-R^k\frac{2k}{\pi}\theta)d\theta\\
    & =\dfrac{\pi}{2kR^{k-1}}(1-e^{-\frac{R^k}{k}})\\
    & \longrightarrow 0 \qquad (R \longrightarrow \infty)
    \end{align}
$$

以上より，$R\to \infty$で$I_2\to 0$である．

### $I_3$の値

$$
I_3=-e^{i\frac{\pi}{2k}}\int_0^R \exp (-t^k)dt
$$

において$u=t^k$と変数変換をする．$u,t\ge 0$より，$t=u^{1/k}$であり$\dfrac{dt}{du}=\dfrac{1}{k}u^{1/k-1}$である．よって

$$
\begin{align}
I_3 &= -\frac{e^{i\frac{\pi}{2k}}}{k}\int_0^{R^k} u^{\frac{1}{k}-1}\exp (-u)dt\\
    & \xrightarrow[R\to \infty]{} -\frac{e^{i\frac{\pi}{2k}}}{k}\Gamma \left(\frac{1}{k}\right)
\end{align}
$$

である．ここでガンマ関数$\Gamma(\cdot)$は

$$
\Gamma(s)=\int_0^\infty x^{s-1}e^{-s}dx
$$

で定められる広義積分であり，この関数は$s>0$で収束する．また，$\Gamma(s+1)=s\Gamma(s)$が成り立つ．

$1/k>0$より，$\dfrac{1}{k}\Gamma\left(\dfrac{1}{k}\right)=\Gamma\left(1+\dfrac{1}{k}\right)$であるから

$$
\lim_{R\to \infty}I_3=-\frac{e^{i\frac{\pi}{2k}}}{k}\Gamma \left(\frac{1}{k}\right)=-e^{i\frac{\pi}{2k}}\Gamma\left(1+\frac{1}{k}\right)
$$

である．

### 積分の値

以上より

$$
\begin{align}
\lim_{R\to \infty}I_2 &= 0\\
\lim_{R\to \infty}I_3 &= -\frac{e^{i\frac{\pi}{2k}}}{k}\Gamma \left(\frac{1}{k}\right)=-e^{i\frac{\pi}{2k}}\Gamma\left(1+\frac{1}{k}\right)
\end{align}
$$

であることがわかった．$I_1 = -(I_2+I_3)$より

$$
\begin{align}
\lim_{R\to \infty}\mathrm{Im}\, I_1 &= -\lim_{R\to \infty}\mathrm{Im}\, (I_2+I_3)\\
&= -\lim_{R\to \infty}\mathrm{Im}\, I_3\\
&= -\mathrm{Im}\, \left(\lim_{R\to \infty} I_3 \right)\\
&= \mathrm{Im}\, \left\{ e^{i\frac{\pi}{2k}}\Gamma\left(1+\frac{1}{k}\right) \right\}\\
&=\Gamma\left(1+\frac{1}{k}\right)\sin\left(\frac{\pi}{2k}\right)
\end{align}
$$

であり$\displaystyle\lim_{R\to \infty}\mathrm{Im}\, I_1 = \int_0^\infty \sin(x^k)dx$より

$$
\int_0^\infty \sin(x^k)dx=\Gamma\left(1+\frac{1}{k}\right)\sin\left(\frac{\pi}{2k}\right)
$$

である.

## 補足

$I_1$の実部を取れば

$$\displaystyle
\int_0^\infty \cos(x^k)dx=\Gamma\left(1+\frac{1}{k}\right)\cos\left(\frac{\pi}{2k}\right)
$$

であることも分かる．

## 参考文献

畑 政義，『数理科学のための複素関数論』，サイエンス社，2018年．
