import numpy as np
import matplotlib.pyplot as plt

# --- 1. Données du problème ---
L = 6.0       # Longueur totale de la poutre (m)
F = 10000.0   # Force ponctuelle (N)
a = 2.0       # Position de la force par rapport à l'appui A (m)

# --- 2. Réactions aux appuis ---
R_B = F * a / L
R_A = F - R_B

print(f"R_A = {R_A / 1000:.2f} kN")
print(f"R_B = {R_B / 1000:.2f} kN")

# --- 3. Discrétisation le long de la poutre ---
x = np.linspace(0, L, 1000)

# --- 4. Effort tranchant V(x) et Moment fléchissant M(x) ---
V = np.where(x < a, R_A, R_A - F)
M = np.where(x < a, R_A * x, R_A * x - F * (x - a))

# --- 5. Tracé des diagrammes ---
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(8, 6), sharex=True)

# Graphique de l'effort tranchant
ax1.plot(x, V / 1000, color='crimson', lw=2)
ax1.axhline(0, color='black', lw=0.8, linestyle='--')
ax1.set_ylabel("Effort tranchant V (kN)")
ax1.set_title("Diagrammes des sollicitations RDM")
ax1.grid(True)

# Graphique du moment fléchissant (axe Y inversé pour les fibres tendues)
ax2.plot(x, M / 1000, color='royalblue', lw=2)
ax2.axhline(0, color='black', lw=0.8, linestyle='--')
ax2.set_xlabel("Position x (m)")
ax2.set_ylabel("Moment fléchissant M (kNm)")
ax2.grid(True)
ax2.invert_yaxis()  # Orienté vers le bas (convention RDM fibres tendues)

plt.tight_layout()
plt.show()