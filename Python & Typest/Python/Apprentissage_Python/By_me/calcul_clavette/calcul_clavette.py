
def saisie_cisaillement_clavette():
    b = float(input("Quel est la largeur b de la clavette (en mm) ? : ").replace(" ", "").replace(",", "."))
    L = float(input("Quel est la longueur L de la clavette (en mm) ? : ").replace(" ", "").replace(",", "."))
    D = float(input("Quel est le diamètre D de l'arbre (en mm) ? : ").replace(" ", "").replace(",", "."))
    C = float(input("Quel est le couple transmis à l'arbre (en N*m) ? : ").replace(" ", "").replace(",", "."))
    Rₚₑ = float(input("Quel est la résitance élastique du matériau (en MPa), (ex: 210MPa pour l'acier) ? : ").replace(" ", "").replace(",", "."))
    return b, L, D, C, Rₚₑ

def calcul_section_cisaillée(b, L):
    S_c = b * L
    return S_c

def calcul_effort_tangentiel(D, C):
    F_t = (2000 * C) / D
    return F_t

def calcul_contrainte_cisaillée(S_c, F_t, Rₚₑ):
    τ = F_t / S_c
    return τ

def main():
    b, L, D, C, Rₚₑ = saisie_cisaillement_clavette()
    S_c = calcul_section_cisaillée(b, L)
    F_t = calcul_effort_tangentiel(D, C)
    τ = calcul_contrainte_cisaillée(S_c, F_t, Rₚₑ)

    print(f"Surface section cisaillée : {S_c:.2f} mm²")
    print(f"Effort tengentiel : {F_t:.2f} N")
    print(f"Résistance élastique : {Rₚₑ:.2f} MPa")
    if τ <= Rₚₑ:
        print("La clavette résiste !")
    else:
        print("La clavette ne résiste pas !")

if __name__ == "__main__":
    main()