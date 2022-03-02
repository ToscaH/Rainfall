library(ggplot2)

plot_df <- read.csv("data/average-rainfall.csv")

g <- ggplot(
  data = plot_df,
  mapping = aes(
    x = as.integer(month_num),
    y = average_rainfall,
    colour = location)) +
  geom_point() +
  geom_line() +
  labs(
    x = "Time (months)",
    y = "Average rainfall (mm)",
    colour = "City",
    title = "Pattern of monthly rainfall in Melbourne and Oxford",
    subtitle = "(1855-2015)") +
  scale_x_continuous(
    breaks = plot_df$month_num[seq(1,12,1)],
    labels = plot_df$month[seq(1,12,1)]) +
  scale_color_manual(name="City", values=c("Green","Blue"))+
  theme_classic() +
  theme(axis.text.x = element_text(angle = -45, size=5))


ggsave(filename = "out/result2.png",
       plot = g,
       height = 10.5, width = 14.8,
       units = "cm")

sink(file = "out/package-versions.txt")
sessionInfo()
sink()
