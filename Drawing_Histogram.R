library(ggplot2)
library(MASS)

data("Cars93")   # MASS 패키지에서 Cars93 데이터를 가져옵니다.
data("minn38")   # MASS 패키지에서 minn98 데이터를 가져옵니다.

# Basic Histogram ##############################
ggplot( Cars93, aes(x=Passengers)) +   # x축: 탑승자 수, 탑승자 수에 따른 분포를 그려봅니다.
  geom_histogram()   # 기본 histogram을 그립니다.
ggsave("histogram_basic.jpg", dpi = 300)   # ggplot를 저장합니다.

# Customized Basic Histogram ##############################
## Add color for histogram bar ############################
ggplot( Cars93, aes(x=Passengers)) +   # x축: 탑승자 수, 탑승자 수에 따른 분포를 그려봅니다.
  geom_histogram(fill="#F8766D")   # 내부 색상을 설정합니다.
ggsave("histogram_col.jpg", dpi = 300)   # ggplot를 저장합니다.

## Add line for histogram bar #############################
ggplot( Cars93, aes(x=Passengers)) +   # x축: 탑승자 수, 탑승자 수에 따른 분포를 그려봅니다.
  geom_histogram(fill="#F8766D", colour="black")   # 내부 색상, 라인 색상을 설정합니다. 
ggsave("histogram_col_line.jpg", dpi = 300)   # ggplot를 저장합니다.

## Adjust width of histogram bar ##########################
ggplot( Cars93, aes(x=Passengers)) +   # x축: 탑승자 수, 탑승자 수에 따른 분포를 그려봅니다.
  geom_histogram(fill="#F8766D", colour="black", binwidth = 0.5)   # 내부 색상, 라인 색상, 바 두께를 설정합니다. 
ggsave("histogram_col_line_width.jpg", dpi = 300)   # ggplot를 저장합니다.

## Adjust label of histogram x-axis #######################
ggplot( Cars93, aes(x=Passengers)) +   # x축: 탑승자 수, 탑승자 수에 따른 분포를 그려봅니다.
  geom_histogram(fill="#F8766D", colour="black", binwidth = 0.5) +   # 내부 색상, 라인 색상, 바 두께를 설정합니다. 
  scale_x_continuous(breaks = c(1:8))   # x축을 8개로 나누고 라벨을 입힙니다.
ggsave("histogram_col_line_width_brk.jpg", dpi = 300)   # ggplot를 저장합니다.

## Adjust range of histgram ###############################
ggplot( Cars93, aes(x=Passengers)) +   # x축: 탑승자 수, 탑승자 수에 따른 분포를 그려봅니다.
  geom_histogram(fill="#F8766D",  colour="black", bins = 4) +   # 내부 색상, 라인 색상, 히스토그램을 4개로 구분하도록 설정합니다.
  scale_x_continuous(breaks = c(2,4,6,8))   # x축을 4개로 나누고 라벨을 입힙니다
ggsave("histogram_col_line_width_bin.jpg", dpi = 300)   # ggplot를 저장합니다.

# Add Category in Basic Histogram #########################
# Stack category ##########################################
ggplot( Cars93, aes(x=Passengers, fill=Origin)) +   # x축: 탑승자 수, 내부 항목: 기원(미국산인지 아닌지), 탑승자 수와 기원에 따른 분포를 그려봅니다.
  geom_histogram(binwidth = 0.5) +   # 바 두께를 설정합니다. 
  scale_x_continuous(breaks = c(1:8))   # x축을 8개로 나누고 라벨을 입힙니다.
ggsave("histogram_add_cate.jpg", dpi = 300)   # ggplot를 저장합니다.

## Dodge category #########################################
ggplot( Cars93, aes(x=Passengers, fill=Origin)) +   # x축: 탑승자 수, 내부 항목: 기원(미국산인지 아닌지), 탑승자 수와 기원에 따른 분포를 그려봅니다.
  geom_histogram(position = "dodge", binwidth = 0.5) +   # 바 두께를 설정합니다. origin 항목을 각각 나눠서 그립니다.
  scale_x_continuous(breaks = c(1:8))   # x축을 8개로 나누고 라벨을 입힙니다.
ggsave("histogram_add_cate_dodge.jpg", dpi = 300)   # ggplot를 저장합니다.

## Fill category ##########################################
ggplot( Cars93, aes(x=Passengers, fill=Origin)) +   # x축: 탑승자 수, 내부 항목: 기원(미국산인지 아닌지), 탑승자 수와 기원에 따른 분포를 그려봅니다.
  geom_histogram(position = "fill", binwidth = 0.5) +   # 바 두께를 설정합니다. origin 항목을 쌓고 카운트가 아닌 비율로 나타냅니다. 
  scale_x_continuous(breaks = c(1:8))   # x축을 8개로 나누고 라벨을 입힙니다.
ggsave("histogram_add_cate_fill.jpg", dpi = 300)   # ggplot를 저장합니다.

## Devide lay out by category using facet: Vertical #######
ggplot( Cars93, aes(x=Passengers, fill=Origin)) +   # x축: 탑승자 수, 내부 항목: 기원(미국산인지 아닌지), 탑승자 수와 기원에 따른 분포를 그려봅니다.
  geom_histogram(position = "dodge", binwidth = 0.5) +   # 바 두께를 설정합니다. origin 항목을 각각 나눠서 그립니다.
  scale_x_continuous(breaks = c(1:8)) +   # x축을 8개로 나누고 라벨을 입힙니다.
  facet_grid(AirBags~.)   # airbag 구분에 따라 그래프를 나눠그립니다. 세로를 분할합니다. 
ggsave("histogram_add_cate_dodge_facet_y.jpg", dpi = 300, width = 5, height = 10)   # ggplot를 저장합니다. 세로로 길게 비율을 맞추어줍니다.

## Devide lay out by category using facet: Horizontal #####
ggplot( Cars93, aes(x=Passengers, fill=Origin)) +   # x축: 탑승자 수, 내부 항목: 기원(미국산인지 아닌지), 탑승자 수와 기원에 따른 분포를 그려봅니다.
  geom_histogram(position = "dodge", binwidth = 0.5) +   # 바 두께를 설정합니다. origin 항목을 각각 나눠서 그립니다.
  scale_x_continuous(breaks = c(1:8)) +   # x축을 8개로 나누고 라벨을 입힙니다.
  facet_grid(.~AirBags)   # airbag 구분에 따라 그래프를 나눠그립니다. 가로를 분할합니다.
ggsave("histogram_add_cate_dodge_facet_x.jpg", dpi = 300, width = 10, height = 5)   # ggplot를 저장합니다. 가로로 길게 비율을 맞추어줍니다.

# Histogram with categorical data #########################
air_levels <- levels(Cars93$AirBags)   # airbag level을 저장해둡니다.
Cars93$AirBags <- as.numeric(Cars93$AirBags)   # factor인 airbag column을 숫자로 변환합니다. 

ggplot( Cars93, aes(x=AirBags, fill=Origin)) +   # x축: airbag 구분, 내부 항목: 기원(미국산인지 아닌지), airbag과 기원에 따른 분포를 그려봅니다.
  geom_histogram(position = "dodge", binwidth = 0.5) +   # 바 두께를 설정합니다. origin 항목을 각각 나눠서 그립니다.
  scale_x_continuous(breaks = c(1:3), labels = c(air_levels))   # airbag이 3개의 level로 형성되어 있으므로 x축을 3개로 나누고 아까 저장해두었던 라벨 명칭으로 라벨을 입힙니다.
ggsave("histogram_factor.jpg", dpi = 300)   # ggplot를 저장합니다.

# Bar Plot like Histogram #################################
ggplot( minn38, aes(x=hs, y=f, fill=phs)) +   # x축: 고등학교 랭크, y축: 빈도, 내부 항목: 졸업 후 상태, 고등학교 랭크와 졸업 후 상태의 분포를 그려봅니다. 
  geom_bar(position = "dodge", width = 0.5, stat = "identity")   # 바 두께를 설정합니다. phs 항목을 각각 나눠서 그립니다. hs의 값들을 하나의 항목으로 인식합니다. 
ggsave("barplot_like_histogram.jpg", dpi = 300)   # ggplot를 저장합니다.
