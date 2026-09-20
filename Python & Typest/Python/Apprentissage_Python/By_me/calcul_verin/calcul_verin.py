from math import pi

def saisie_donnees_verin():
    D = float(input("Quel est le diamètre D du piston (en mm) ? : ").replace(" ", "").replace(",", "."))
    d = float(input("Quel est le diamètre d de la tige (en mm) ? : ").replace(" ", "").replace(",", "."))
    P = 0.0
    F = 0.0
    choix = input("Connaissez-vous : (1) La pression d'utilisation ou (2) La force souhaitée ?")
    if choix == "1": 
        P = float(input("Quel est la pression P d'utilisation (en bar) ? : ").replace(" ", "").replace(",", "."))
    elif choix == "2":
        F = float(input("Quel est la force souhaitée F (en N) ? : ").replace(" ", "").replace(",", "."))
    return D, d, P, F

def calcul_pression(F, D):
    S_piston = (pi * D**2) / 4
    P = (F / S_piston) * 10
    return P

def calcul_sections_forces(D, d, P):
    P_Nmm = P / 10
    S_piston = (pi * D**2) / 4
    S_tige = (pi * (D**2 - d**2)) / 4
    F_poussee = P_Nmm * S_piston
    F_traction = P_Nmm * S_tige
    return P_Nmm, S_piston, S_tige, F_poussee, F_traction

def calcul_vitesses(Q, S_piston, S_tige):
    V_rentree = (Q * 10**6) / S_tige
    V_sortie = (Q * 10**6) / S_piston
    return V_rentree, V_sortie

def saisie_conditions_utilisation():
    Q = 0.0
    V = 0.0
    choix = input("Connaissez-vous : (1) Le débit Q de la pompe (en m³/s) (2) La vitesse de sortie V souhaitée (en m/s) ? : ")
    if choix == "1": 
        Q = float(input("Quel est le débit Q de la pompe (en m³/s) ? : ").replace(" ", "").replace(",", "."))
    elif choix == "2":
        V = float(input("Quel est la vitesse de sortie V souhaitée (en m/s) ? : ").replace(" ", "").replace(",", "."))
    F_ext = float(input("Quel est la charge extérieure réelle à déplacer (en N) ? : ").replace(" ", "").replace(",", "."))
    return Q, V, F_ext

def calcul_debit(V, S_piston):
    Q = (V * S_piston) / 10**6
    return Q

def calcul_taux_decharge(F_ext, F_pousse):
    τ = (F_ext / F_pousse) * 100
    return τ

def main():
    D, d, P, F = saisie_donnees_verin()
    if P == 0.0:
        P = calcul_pression(F, D)
    P_Nmm, S_piston, S_tige, F_poussee, F_traction = calcul_sections_forces(D, d, P)
    Q, V, F_ext = saisie_conditions_utilisation()
    if Q == 0.0:
        Q = calcul_debit(V, S_piston)
    V_rentree, V_sortie = calcul_vitesses(Q, S_piston, S_tige)
    τ = calcul_taux_decharge(F_ext, F_poussee)

    print("\n RÉSULTATS DU DIMENSIONNEMENT ")
    print(f"Pression retenue : {P:.2f} bar")
    print(f"Effort de poussée : {F_poussee:.1f} N")
    print(f"Effort de traction : {F_traction:.1f} N")
    print(f"Vitesse de sortie : {V_sortie:.3f} m/s")
    print(f"Vitesse de rentrée : {V_rentree:.3f} m/s")
    print(f"Taux de charge : {τ:.1f} %")

if __name__ == "__main__":
    main()