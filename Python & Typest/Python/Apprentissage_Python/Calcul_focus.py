
import math
import matplotlib.pyplot as plt

EP = 400
HFP = -100
L_retombee = 75
angle = 15

difference = EP - HFP
cos_angle = math.cos(math.radians(angle))

longueur = difference / cos_angle + L_retombee

fig, ax = plt.subplots(figsize=(12, 7))

ax.set_xlim(0, 10)
ax.set_ylim(0, 10)
ax.axis("off")

ax.text(
    0.5, 9.2,
    "Calcul de longueur de platine",
    fontsize=20,
    fontweight="bold",
    ha="center"
)

ax.text(
    0.5, 7.8,
    "1. Formule de base",
    fontsize=13,
    fontweight="bold"
)

ax.text(
    0.5, 7.1,
    r"$L_{\mathrm{platine}} = "
    r"\frac{EP-HFP}{\cos(\theta)} + L_{\mathrm{retombée}}$",
    fontsize=18
)

ax.text(
    0.5, 5.8,
    "2. Application numérique",
    fontsize=13,
    fontweight="bold"
)

ax.text(
    0.5, 5.1,
    rf"$L_{{\mathrm{{platine}}}} = "
    rf"\frac{{{EP}-({HFP})}}{{\cos({angle}^\circ)}}"
    rf" + {L_retombee}$",
    fontsize=17
)

ax.text(
    0.5, 4.2,
    rf"$= \frac{{{difference}}}{{{cos_angle:.4f}}}"
    rf" + {L_retombee}$",
    fontsize=17
)

# Résultat
ax.text(
    0.5, 2.8,
    "3. Résultat final",
    fontsize=13,
    fontweight="bold"
)

ax.text(
    0.5, 1.8,
    rf"$L_{{\mathrm{{platine}}}}"
    rf" \approx {longueur:.2f}\ \mathrm{{mm}}$",
    fontsize=24,
    fontweight="bold",
    ha="center"
)

# Export PDF
plt.savefig(
    "calcul_platine.pdf",
    format="pdf",
    bbox_inches="tight"
)

# Affichage
plt.show()