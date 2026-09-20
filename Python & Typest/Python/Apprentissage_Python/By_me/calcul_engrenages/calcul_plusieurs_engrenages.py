from math import pi, tan, radians

def saisie_train_engrenages():
    N1 = float(input("Quel est la vitesse de rotation en entrée N1 (en tr/min) ? : ").replace(" ", "").replace(",", "."))
    P = float(input("Quel est la puissance d'entrée (en kW)").replace(" ", "").replace(",", "."))
    nb_etages = int(input("Combien y'a-t-il d'étages").replace(" ", "").replace(",", "."))
    etages = []
    for i in range(nb_etages):
        Z1 = int(input("Quel est le nomrbe de dents du pignon moteur (Z1) ? : "))
        Z2 = int(input("Quel est le nombre de dents de la roue menée (Z2) ? : "))
        m = float(input("Quel est le module de (Z1) et (Z2) ? : ").replace(" ", "").replace(",", "."))
        η =  float(input("Indiquer le rendement (ex: 0.95 pour 95%)").replace(" ", "").replace(",", "."))
        dico = {"Z1": Z1, "Z2": Z2, "m": m, "η": η}
        etages.append(dico)
    return N1, P, etages

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
    N_actuel, P_actuelle, etages = saisie_train_engrenages()
    
    for i, etage in enumerate(etages, 1):
        Z1 = etage["Z1"]
        Z2 = etage["Z2"]
        m = etage["m"]
        η = etage["η"]
        
        r, N2 = calcul_cinematique(Z1, Z2, N_actuel)
        d1, d2, a = calcul_geometrique(Z1, Z2, m)
        ω1, C1, C2, Ft, Fr = calcul_efforts(d1, N_actuel, Z1, Z2, P_actuelle, η)
        
        print(f"\n--- ÉTAGE {i} ---")
        print(f"Rapport de réduction r : {r:.3f}")
        print(f"Vitesse de sortie N2 : {N2:.2f} tr/min")
        print(f"Diamètres primitifs : d1 = {d1:.2f} mm | d2 = {d2:.2f} mm")
        print(f"Entraxe a : {a:.2f} mm")
        print(f"Couple C1 : {C1:.2f} N*m | Couple C2 : {C2:.2f} N*m")
        print(f"Effort tangentiel Ft : {Ft:.2f} N | Effort radial Fr : {Fr:.2f} N")
        
        N_actuel = N2
        P_actuelle = P_actuelle * η
        
if __name__ == "__main__":
    main()