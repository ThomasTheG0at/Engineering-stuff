
def saisie_cisaillement_clavette():
    b = float(input("Quel est la largeur b de la clavette (en mm) ? : ").replace(" ", "").replace(",", "."))
    L = float(input("Quel est la longueur L de la clavette (en mm) ? : ").replace(" ", "").replace(",", "."))
    D = float(input("Quel est le diamètre D de l'arbre (en mm) ? : ").replace(" ", "").replace(",", "."))
    C = float(input("Quel est le couple transmis à l'arbre (en N*m) ? : ").replace(" ", "").replace(",", "."))
    Rₚₑ = float(input("Quel est la résitance élastique du matériau (en MPa), (ex: 210MPa pour l'acier) ? : ").replace(" ", "").replace(",", "."))
    h = float(input("Quel est la hauteur totale de la clavette  (en mm) ? : ").replace(" ", "").replace(",", "."))
    t_1 = float(input("Quel est la profondeur de la rainure dans l'arbre (en mm) ? : ").replace(" ", "").replace(",", "."))
    P_adm = float(input("Quel est la pression admise sur la clavette (en MPa) ? : ").replace(" ", "").replace(",", "."))
    return b, L, D, C, Rₚₑ, h, t_1, P_adm

def calcul_section_cisaillée(b, L):
    S_c = b * L
    return S_c

def calcul_effort_tangentiel(D, C):
    F_t = (2000 * C) / D
    return F_t

def calcul_surface_projetee(h, t_1, L):
    h_utile = h - t_1
    S_matage = h_utile * L
    return S_matage

def calcul_pression_reel(F_t, S_matage):
    p = F_t / S_matage
    return p

def calcul_contrainte_cisaillée(S_c, F_t):
    τ = F_t / S_c
    return τ

def main():
    b, L, D, C, Rₚₑ, h, t_1, P_adm = saisie_cisaillement_clavette()
    S_c = calcul_section_cisaillée(b, L)
    F_t = calcul_effort_tangentiel(D, C)
    S_matage = calcul_surface_projetee(h, t_1, L)
    p = calcul_pression_reel(F_t, S_matage)
    τ = calcul_contrainte_cisaillée(S_c, F_t, Rₚₑ)

    print(f"Effort tengentiel : {F_t:.2f} N")
    print(f"Résistance élastique : {Rₚₑ:.2f} MPa")
    if τ <= Rₚₑ:
        print("La clavette résiste !")
    else:
        print("La clavette ne résiste pas !")

    print(f"Pression réelle : {p:.2f} MPa")
    if p <= P_adm:
        print("La clavette résiste au matage !")
    else:
        print("La clavette ne résiste pas au matage !")

if __name__ == "__main__":
    main()