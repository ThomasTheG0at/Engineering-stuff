from math import pi, tan, radians

def calcul_cinematique():

    # 1. On demande à l'utilisateur de remplir les paramètres suivants
    Z1 = int(input("Quel est le nomrbe de dents du pignon moteur (Z1) ? : "))                                                  # int = nombre entier
    Z2 = int(input("Quel est le nombre de dents de la roue menée (Z2) ? : "))                                                  # int = nombre entier
    N1 = float(input("Quel est la vitesse de rotation en entrée N1 (en tr/min) ? : ").replace(" ", "").replace(",", "."))      # float = nombre flottants, avec virgules

    # 2. Calcul rapport de réduction
    r = Z1/Z2    

    # 3. Calcul vitesse de sortie (N2)
    N2 = N1*r

    return r, N1, N2, Z1, Z2

# 4. On appelle la fonction et on affiche les résultats
r, N1, N2, Z1, Z2 = calcul_cinematique()
print(f"Rapport de réduction r : {r:.3f}")
print(f"La vitesse de sortie est : {N2:.2f} tr/min")

def calcul_geometrique(Z1, Z2):

    # 5. On demande à l'utilisateur de remplir le module
    m = float(input("Quel est le module de (Z1) et (Z2) ? : ").replace(" ", "").replace(",", "."))

    # 6. Calcul diamètre primitif pignon moteur
    d1 = m*Z1

    # 7. Calcul diamètre primitif roue menée
    d2 = m*Z2

    # 8. Calcul de l'entraxe
    a = (d1 + d2) / 2

    return d1, d2, a

# 9. On appelle la fonction et on affiche les résultats
d1, d2, a = calcul_geometrique(Z1, Z2)
print(f"Diamètre primitif pignon d1 : {d1:.2f} mm")
print(f"Diamètre primitif roue d2 : {d2:.2f} mm")
print(f"Valeur de l'entraxe a : {a:.2f} mm")

def calcul_efforts(d1, N1):

    # 10. On demande à l'utilisateur de remplir la puissance d'entrée
    P = float(input("Quel ets la puissance d'entrée (en kW)").replace(" ", "").replace(",", "."))

    # 11. Calcul vitesse angulaire ω1 (en rad/s)
    ω1 = 2*pi*N1 / 60

    # 12. Calcul moteur C1 (en N·m) à partir de la puissance d'entrée P (en kW)
    C1 = P*1000 / ω1

    # 13. Calcul effort tangentiel Ft (en N)
    Ft = 2000*C1 / d1

    # 14. Calcul effort radial Fr (en N) avec un angle de pression standard de 20°
    Fr = Ft*tan(radians(20))

    return ω1, C1, Ft, Fr

# 15. On appelle la fonction et on affiche les résultats
ω1, C1, Ft, Fr = calcul_efforts(d1, N1)
print(f"Vitesse angulaire ω1 : {ω1:.2f} radians/s")
print(f"Couple C1 : {C1:.2f} N*m")
print(f"Effort tangentiel Ft : {Ft:.2f} N")
print(f"Effort radial Fr : {Fr:.2f} N")