library(dplyr)
# vrstice - geni
# stolpci - meritev
rows <- sapply("g", paste0, seq(1, 6))[, 1]
cols <- sapply("T", paste0, seq(1, 5))[, 1]

matrika_izrazanja <- matrix(
  nrow = 6, ncol = 5,
  data = c(
    0, 9, 7, 3, 12,
    10, 8, 1, 0, 4,
    3, 0, 10, 1, 0,
    1, 12, 8, 2, 10,
    1, 8, 8, 1, 13,
    12, 10, 0, 2, 2
  ),
  dimnames = list(rows, cols)
)
matrika_izrazanja

c1 <- matrika_izrazanja[1, ]
c2 <- matrika_izrazanja[c(2, 3, 4), ] |> colMeans()
c3 <- matrika_izrazanja[c(5, 6), ] |> colMeans()

c1
c2
c3

matrika_izrazanja <- rbind(matrika_izrazanja, c1, c2, c3)
matrika_izrazanja

# # korak 1: izberemo k voditeljev
# # X = {g1, g3, g5}
voditelji <- c("c1", "c2", "c3")
#
# # korak 2: izračunamo (evklidske) razdalje vseh genov od voditeljev
matrika_razdalj <- dist(
  matrika_izrazanja,
  method = "euclidean",
  diag = TRUE,
  upper = TRUE
) |>
  as.matrix() |>
  round(digits = 2)
matrika_razdalj[c("g1", "C3", "C1"), "C3"]

#
# # vzamemo stolpce voditeljev
razdalje_voditelji <- matrika_razdalj[-(nrow(matrika_razdalj):(nrow(matrika_razdalj) - 2)), voditelji] |>
  round(digits = 2)
razdalje_voditelji
#
# # korak 3: shranimo nove voditelje
# voditelji_2 <- list(C1 = "g1", C2 = c("g2", "g3", "g4"), C3 = c("g5", "g6"))
# voditelji_2

d <- \(g1, g2) {
  if (length(g1) != length(g2)) {
    message("uhhhhhh")
  }
  sum <- 0
  for (i in 1:length(g1)) {
    sum <- sum + (g1[i] - g2[i])**2
  }
  sqrt(sum)
}

d(matrika_izrazanja[5, ], matrika_izrazanja[6, ]) / 2

C1 <- colMeans(matrika_izrazanja[c(5, 6), ])
matrika_izrazanja <- rbind(matrika_izrazanja, C1)
matrika_izrazanja

d(matrika_izrazanja[2, ], matrika_izrazanja[3, ]) / 2

C2 <- colMeans(matrika_izrazanja[c(2, 3), ])
matrika_izrazanja <- rbind(matrika_izrazanja, C2)
matrika_izrazanja

d(matrika_izrazanja[4, ], matrika_izrazanja["C2", ]) / 2

abs((d(matrika_izrazanja[2, ], matrika_izrazanja[3, ]) / 2) -
  (d(matrika_izrazanja[4, ], matrika_izrazanja["C2", ]) / 2))

C3 <- colMeans(matrika_izrazanja[c("C2", "g4"), ])
matrika_izrazanja <- rbind(matrika_izrazanja, C3)
matrika_izrazanja

C4 <- colMeans(matrika_izrazanja[c("C3", "C1"), ])
matrika_izrazanja <- rbind(matrika_izrazanja, C4)
matrika_izrazanja

d(matrika_izrazanja["C3", ], matrika_izrazanja["C1", ]) / 2
d(matrika_izrazanja["g5", ], matrika_izrazanja["C4", ])

8.24 - 4.16
8.24 - 6.42

d(matrika_izrazanja["g1", ], matrika_izrazanja["C4", ])
d(matrika_izrazanja["g1", ], matrika_izrazanja["C4", ]) - 4.08 - 4.16
