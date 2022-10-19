datm <- readRDS("./box_plot_input.RDS")
bcol = c(
  "#1B9E77",
  "#D95F02",
  "#7570B3",
  "#E7298A",
  "#66A61E",
  "#E6AB02",
  "#A6761D",
  "#666666",
  "#7FC97F",
  "#BEAED4",
  "#FDC086",
  "#FFFF99",
  "#386CB0",
  "#F0027F",
  "#BF5B17",
  "#666666"
)
genes = c("TP53","DNMT3A","IDH2","IDH1","RUNX1","TET2",
          "FLT3","NRAS","NPM1","CEBPA")

par(mar = c(3, 4, 2, 2))

boxplot(
  value ~ Hugo_Symbol,
  data = datm,
  xaxt = "n",
  boxwex = 0.5,
  outline = FALSE,
  lty = 1,
  lwd = 1.4,
  outwex = 0,
  staplewex = 0,
  ylim = c(0, 1),
  axes = FALSE,
  border = bcol,
  horizontal = FALSE,
  ylab = NA
)

axis(
  side = 2,
  at = seq(0, 1, 0.2),
  las = 1,
  font = 1,
  lwd = 1.5,
  cex.axis = 0.8
)
axis(
  side = 1,
  at = 1:length(genes),
  labels = genes,
  tick = FALSE,
  las = 2,
  font = 3,
  line = -1,
  cex.axis = 0.8
)
axis(
  side = 3,
  at = 1:length(genes),
  font = 1,
  tick = FALSE,
  line = -1,
  las = 1,
  cex.axis = 0.8
)
abline(
  h = seq(0, 1, 0.2),
  v = 1:length(genes),
  col = grDevices::adjustcolor(col = "gray70",
                               alpha.f = 0.25),
  lty = 2
)
stripchart(
  value ~ Hugo_Symbol,
  vertical = TRUE,
  data = datm,
  method = "jitter",
  add = TRUE,
  pch = 16,
  col = bcol,
  cex = 0.5
)

