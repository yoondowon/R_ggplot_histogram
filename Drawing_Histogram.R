library(ggplot2)
library(MASS)

data("Cars93")   # MASS ��Ű������ Cars93 �����͸� �����ɴϴ�.
data("minn38")   # MASS ��Ű������ minn98 �����͸� �����ɴϴ�.

ggplot( Cars93, aes(x=Passengers)) +   # x��: ž���� ��, ž���� ���� ���� ������ �׷����ϴ�.
  geom_histogram()   # �⺻ histogram�� �׸��ϴ�.
ggsave("histogram_basic.jpg", dpi = 300)   # ggplot�� �����մϴ�.

ggplot( Cars93, aes(x=Passengers)) +   # x��: ž���� ��, ž���� ���� ���� ������ �׷����ϴ�.
  geom_histogram(fill="#F8766D")   # ���� ������ �����մϴ�.
ggsave("histogram_col.jpg", dpi = 300)   # ggplot�� �����մϴ�.

ggplot( Cars93, aes(x=Passengers)) +   # x��: ž���� ��, ž���� ���� ���� ������ �׷����ϴ�.
  geom_histogram(fill="#F8766D", colour="black")   # ���� ����, ���� ������ �����մϴ�. 
ggsave("histogram_col_line.jpg", dpi = 300)   # ggplot�� �����մϴ�.

ggplot( Cars93, aes(x=Passengers)) +   # x��: ž���� ��, ž���� ���� ���� ������ �׷����ϴ�.
  geom_histogram(fill="#F8766D", colour="black", binwidth = 0.5)   # ���� ����, ���� ����, �� �β��� �����մϴ�. 
ggsave("histogram_col_line_width.jpg", dpi = 300)   # ggplot�� �����մϴ�.

ggplot( Cars93, aes(x=Passengers)) +   # x��: ž���� ��, ž���� ���� ���� ������ �׷����ϴ�.
  geom_histogram(fill="#F8766D", colour="black", binwidth = 0.5) +   # ���� ����, ���� ����, �� �β��� �����մϴ�. 
  scale_x_continuous(breaks = c(1:8))   # x���� 8���� ������ ���� �����ϴ�.
ggsave("histogram_col_line_width_brk.jpg", dpi = 300)   # ggplot�� �����մϴ�.

ggplot( Cars93, aes(x=Passengers)) +   # x��: ž���� ��, ž���� ���� ���� ������ �׷����ϴ�.
  geom_histogram(fill="#F8766D",  colour="black", bins = 4) +   # ���� ����, ���� ����, ������׷��� 4���� �����ϵ��� �����մϴ�.
  scale_x_continuous(breaks = c(2,4,6,8))   # x���� 4���� ������ ���� �����ϴ�
ggsave("histogram_col_line_width_bin.jpg", dpi = 300)   # ggplot�� �����մϴ�.

ggplot( Cars93, aes(x=Passengers, fill=Origin)) +   # x��: ž���� ��, ���� �׸�: ���(�̱������� �ƴ���), ž���� ���� ����� ���� ������ �׷����ϴ�.
  geom_histogram(binwidth = 0.5) +   # �� �β��� �����մϴ�. 
  scale_x_continuous(breaks = c(1:8))   # x���� 8���� ������ ���� �����ϴ�.
ggsave("histogram_add_cate.jpg", dpi = 300)   # ggplot�� �����մϴ�.

ggplot( Cars93, aes(x=Passengers, fill=Origin)) +   # x��: ž���� ��, ���� �׸�: ���(�̱������� �ƴ���), ž���� ���� ����� ���� ������ �׷����ϴ�.
  geom_histogram(position = "dodge", binwidth = 0.5) +   # �� �β��� �����մϴ�. origin �׸��� ���� ������ �׸��ϴ�.
  scale_x_continuous(breaks = c(1:8))   # x���� 8���� ������ ���� �����ϴ�.
ggsave("histogram_add_cate_dodge.jpg", dpi = 300)   # ggplot�� �����մϴ�.

ggplot( Cars93, aes(x=Passengers, fill=Origin)) +   # x��: ž���� ��, ���� �׸�: ���(�̱������� �ƴ���), ž���� ���� ����� ���� ������ �׷����ϴ�.
  geom_histogram(position = "fill", binwidth = 0.5) +   # �� �β��� �����մϴ�. origin �׸��� �װ� ī��Ʈ�� �ƴ� ������ ��Ÿ���ϴ�. 
  scale_x_continuous(breaks = c(1:8))   # x���� 8���� ������ ���� �����ϴ�.
ggsave("histogram_add_cate_fill.jpg", dpi = 300)   # ggplot�� �����մϴ�.

ggplot( Cars93, aes(x=Passengers, fill=Origin)) +   # x��: ž���� ��, ���� �׸�: ���(�̱������� �ƴ���), ž���� ���� ����� ���� ������ �׷����ϴ�.
  geom_histogram(position = "dodge", binwidth = 0.5) +   # �� �β��� �����մϴ�. origin �׸��� ���� ������ �׸��ϴ�.
  scale_x_continuous(breaks = c(1:8)) +   # x���� 8���� ������ ���� �����ϴ�.
  facet_grid(AirBags~.)   # airbag ���п� ���� �׷����� �����׸��ϴ�. ���θ� �����մϴ�. 
ggsave("histogram_add_cate_dodge_facet_y.jpg", dpi = 300, width = 5, height = 10)   # ggplot�� �����մϴ�. ���η� ��� ������ ���߾��ݴϴ�.

ggplot( Cars93, aes(x=Passengers, fill=Origin)) +   # x��: ž���� ��, ���� �׸�: ���(�̱������� �ƴ���), ž���� ���� ����� ���� ������ �׷����ϴ�.
  geom_histogram(position = "dodge", binwidth = 0.5) +   # �� �β��� �����մϴ�. origin �׸��� ���� ������ �׸��ϴ�.
  scale_x_continuous(breaks = c(1:8)) +   # x���� 8���� ������ ���� �����ϴ�.
  facet_grid(.~AirBags)   # airbag ���п� ���� �׷����� �����׸��ϴ�. ���θ� �����մϴ�.
ggsave("histogram_add_cate_dodge_facet_x.jpg", dpi = 300, width = 10, height = 5)   # ggplot�� �����մϴ�. ���η� ��� ������ ���߾��ݴϴ�.

air_levels <- levels(Cars93$AirBags)   # airbag level�� �����صӴϴ�.
Cars93$AirBags <- as.numeric(Cars93$AirBags)   # factor�� airbag column�� ���ڷ� ��ȯ�մϴ�. 

ggplot( Cars93, aes(x=AirBags, fill=Origin)) +   # x��: airbag ����, ���� �׸�: ���(�̱������� �ƴ���), airbag�� ����� ���� ������ �׷����ϴ�.
  geom_histogram(position = "dodge", binwidth = 0.5) +   # �� �β��� �����մϴ�. origin �׸��� ���� ������ �׸��ϴ�.
  scale_x_continuous(breaks = c(1:3), labels = c(air_levels))   # airbag�� 3���� level�� �����Ǿ� �����Ƿ� x���� 3���� ������ �Ʊ� �����صξ��� �� ��Ī���� ���� �����ϴ�.
ggsave("histogram_factor.jpg", dpi = 300)   # ggplot�� �����մϴ�.

ggplot( minn38, aes(x=hs, y=f, fill=phs)) +   # x��: �����б� ��ũ, y��: ��, ���� �׸�: ���� �� ����, �����б� ��ũ�� ���� �� ������ ������ �׷����ϴ�. 
  geom_bar(position = "dodge", width = 0.5, stat = "identity")   # �� �β��� �����մϴ�. phs �׸��� ���� ������ �׸��ϴ�. hs�� ������ �ϳ��� �׸����� �ν��մϴ�. 
ggsave("barplot_like_histogram.jpg", dpi = 300)   # ggplot�� �����մϴ�.