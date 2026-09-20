import matplotlib.pyplot as plt
import numpy as np

# Courbe contrainte-déformation simplifiée
deformation = np.linspace(0, 0.05, 100)
contrainte  = np.where(
    deformation < 0.002,
    210000 * deformation,                      # zone élastique (E = 210 GPa)
    420 + 500 * (deformation - 0.002) ** 0.3   # zone plastique
)

plt.figure(figsize=(8, 5))
plt.plot(deformation * 100, contrainte, color='#e94560', lw=2)
plt.axvline(0.2, color='gray', ls='--', lw=1, label='Re0.2')
plt.xlabel('Déformation (%)')
plt.ylabel('Contrainte (MPa)')
plt.title('Courbe contrainte-déformation — Acier 316L')
plt.legend()
plt.grid(True, alpha=0.3)
plt.tight_layout()
plt.savefig('courbe_traction.png', dpi=150)
plt.show()