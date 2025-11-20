library(readr)
library(ggplot2)
library(cowplot)
library(patchwork)
library(see)

theme_set(theme_bw())

scale_fill_okabeito(
  palette = "full",
  reverse = FALSE,
  order = 1:3,
  aesthetics = "fill",
  )

sum_table = read_table("https://raw.githubusercontent.com/adagilis/PopGen25/refs/heads/main/notes/data/pi_dxy.txt")
pi = subset(sum_table,metric=="pi")
dxy = subset(sum_table,metric=="Dxy")
dxy$pop_pair=paste(dxy$pop1,dxy$pop2,sep="-")

p1 = ggplot(pi,aes(x=pop1,y=value, fill=pop1))+
    geom_boxplot() +
    scale_fill_manual("A: Pops",values = c("#fbac04ff", "#377498ff", "#009E73")) +
    labs(x = "Populations", y = "Pi value")

p3 = ggplot(dxy,aes(x=value,fill=pop_pair))+
    scale_fill_manual(values = c("#c07da4ff", "#fbac04ff", "#377498ff")) +
    labs(fill="B: Pop Pairs") +
    geom_density(alpha=0.7,col="black") +
    coord_cartesian(expand = FALSE) +
    labs(x = "Dxy Value", y = "Density")

p2 = ggplot(pi,aes(x=start,y=value,col=pop1))+
    geom_smooth()+  
    scale_color_manual("C: Pops", values = c("#fbac04ff", "#377498ff", "#009E73")) +
    facet_grid(~chr) +
    coord_cartesian(expand = FALSE) +
    labs(x = "Chromosome", y = "Pi Value")


figure = (p1+p3)/p2 + plot_annotation(tag_levels = 'A') + plot_layout(guides = "collect")
figure
