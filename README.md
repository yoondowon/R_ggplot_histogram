# R_ggplot_histogram
R code for drawing hisogram with ggplot2 package

## 기본 히스토그램 그리기
```{r echo = FALSE, results = 'asis', warning=FALSE}
library(ggplot2)
library(MASS)

data("Cars93")   # MASS 패키지에서 Cars93 데이터를 가져옵니다.
data("minn38")   # MASS 패키지에서 minn98 데이터를 가져옵니다.
ggplot( Cars93, aes(x=Passengers)) +   # x축: 탑승자 수, 탑승자 수에 따른 분포를 그려봅니다.
  geom_histogram() 
```

## 기본 히스토그램 커스텀화하기
#### - 색상 추가하기 
#### - 선 추가하기 
#### - 두께 조절하기 
#### - X축 라벨링하기 
#### - 범위 조절하기 

## 기본 히스토그램에 항목 추가하기
#### - 바 내부에서 쌓인 형태 (stack)
#### - 항목별로 따로 구분된 형태 (dodge)
#### - 바 내부에서 쌓인 형태를 비율로 나타내기 (fill) 
#### - 항목별로 나눠서 그리기 (facet): 세로로 나누기
#### - 항목별로 나눠서 그리기 (facet): 가로로 나누기

## 범주형 데이터로 히스토그램 그리기
