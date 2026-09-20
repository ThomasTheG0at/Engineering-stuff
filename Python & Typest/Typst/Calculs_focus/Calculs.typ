#show math.equation: set text(fill: black)
#set text(size: 18pt)
#show math.equation: set text(size: 15pt)
#show math.equation.where(block: true): set block(above: 1.8em, below: 1.8em)
#set align(left)

#let EP = 400
#let HFP = -100
#let angle = 15deg
#let L_retombee = 75

#let Lplatine = (EP - HFP) / calc.cos(angle) + L_retombee

$ cos("Angle HSP") = #text(size: 15pt)[$ "Adjacent"/"Hypotenus" $] $

$ L_"platine" = #text(size: 15pt)[$ (EP - (HFP))/cos("Angle HSP") $] + L_"retombee" $

$ "EP" = 400 $
$ "HFP" = -100 $
$ cos("Angle HSP") = 15 "deg" $
$ L_"retombee" = 75 $

$ L_"platine" = #text(size: 15pt)[$ (EP - (#HFP))/cos(#angle) $] + 75 $

#text(size: 15pt, fill: black)[
$ L_"platine" = (EP - (#HFP))/cos(#angle) + #L_retombee = #Lplatine $
]

$sum_(i=3)^n i+2$


