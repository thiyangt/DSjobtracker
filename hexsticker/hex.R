library(hexSticker)
library(showtext)
library(here)
font_add_google("Gochi Hand", "gochi")
## Automatically use showtext to render text for future devices
showtext_auto()
#imgurl <- system.file("figures/hex.jpg", package="hexSticker")
sticker(here("hexsticker", "figures", "hex.jpg"), package="DSjobtracker",
        p_color="#99000d",
        p_size=21, s_x=1, s_y=.75, s_width=.43,
        h_fill = "#3af000",
        filename=here("hexsticker", "figures", "hexsticker.png"),
        h_color="#253494",
        p_family = "gochi")

