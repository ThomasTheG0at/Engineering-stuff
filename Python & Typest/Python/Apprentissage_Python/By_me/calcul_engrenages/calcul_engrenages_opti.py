from math import pi, tan, radians

def saisie_donnees():
    Z1 = int(input("Quel est le nomrbe de dents du pignon moteur (Z1) ? : "))
    Z2 = int(input("Quel est le nombre de dents de la roue menée (Z2) ? : "))
    N1 = float(input("Quel est la vitesse de rotation en entrée N1 (en tr/min) ? : ").replace(" ", "").replace(",", "."))
    m = float(input("Quel est le module de (Z1) et (Z2) ? : ").replace(" ", "").replace(",", "."))
    P = float(input("Quel ets la puissance d'entrée (en kW)").replace(" ", "").replace(",", "."))
    η =  float(input("Indiquer le rendement (ex: 0.95 pour 95%)").replace(" ", "").replace(",", "."))
    return Z1, Z2, N1, m, P, η 

def calcul_cinematique(Z1, Z2, N1):
    r = Z1/Z2    
    N2 = N1*r
    return r, N2

def calcul_geometrique(Z1, Z2, m):
    d1 = m*Z1
    d2 = m*Z2
    a = (d1 + d2) / 2
    return d1, d2, a

def calcul_efforts(d1, N1, Z1, Z2, P, η):
    ω1 = 2*pi*N1 / 60
    C1 = P*1000 / ω1
    C2 = C1*(Z2 / Z1)*η
    Ft = 2000*C1 / d1
    Fr = Ft*tan(radians(20))
    return ω1, C1, C2, Ft, Fr

def main():
    Z1, Z2, N1, m, P, η = saisie_donnees()

    r, N2 = calcul_cinematique(Z1, Z2, N1)
    print(f"Rapport de réduction r : {r:.3f}")
    print(f"La vitesse de sortie est : {N2:.2f} tr/min")

    d1, d2, a = calcul_geometrique(Z1, Z2, m)
    print(f"Diamètre primitif pignon d1 : {d1:.2f} mm")
    print(f"Diamètre primitif roue d2 : {d2:.2f} mm")
    print(f"Valeur de l'entraxe a : {a:.2f} mm")

    ω1, C1, C2, Ft, Fr = calcul_efforts(d1, N1, Z1, Z2, P, η)
    print(f"Vitesse angulaire ω1 : {ω1:.2f} radians/s")
    print(f"Couple C1 : {C1:.2f} N*m")
    print(f"Effort tangentiel Ft : {Ft:.2f} N")
    print(f"Effort radial Fr : {Fr:.2f} N")
    print(f"Couple C2 : {C2:.2f} N*m")

if __name__ == "__main__":
    main()
