def saisie_section():
    b = float(input("Quel est la largeur b (en mm) ? : ").replace(" ", "").replace(",", "."))
    h = float(input("Quel est la hauteur h (en mm) ? : ").replace(" ", "").replace(",", "."))
    return b, h

def calcul_section(b, h):
    Igz = (b * h**3) / 12
    y = h / 2
    return Igz, y

def saisie_chargement_materiau():
    L = float(input("Quel est la longueur L entre appuis (en mm) ? : ").replace(" ", "").replace(",", "."))
    F = float(input("Quel est la charge F ponctuelle centrée  (en N) ? : ").replace(" ", "").replace(",", "."))
    Re = float(input("Quel est la limite d'élasticité Re (en MPa) ? : ").replace(" ", "").replace(",", "."))
    s = float(input("Quel est le coefficient de sécurité ? (ex: 1, 2, etc..) : ").replace(" ", "").replace(",", "."))
    E = float(input("Quel est le module de Young ? (en MPa, ex: 210000 pour l'acier) : ").replace(" ", "").replace(",", "."))
    return L, F, Re, s, E

def calcul_flexion(F, L, y, Igz, E, Re, s):
    Mfz_max = F * L / 4
    σ_max = Mfz_max * y / Igz
    f = (F * L**3) / (48 * E * Igz)
    σ_adm = Re / s
    return Mfz_max, σ_max, f, σ_adm

def verifier_resistance(σ_max, σ_adm):
    if σ_max <= σ_adm:
        print("La pièce résiste")
    else:
        print(" Attention : la pièce ne résiste pas !")

def main():
    b, h = saisie_section()
    Igz, y = calcul_section(b, h)
    L, F, Re, s, E = saisie_chargement_materiau()
    Mfz_max, σ_max, f, σ_adm = calcul_flexion(F, L, y, Igz, E, Re, s)

    print(f"Moment fléchissant max Mfz_max : {Mfz_max:.2f}" "N*mm")
    print(f"Contrainte maximale σ_max : {σ_max:.2f}" "MPa")
    print(f"Flèche maximale f : {f:.2f}" "mm")
    print(f"Contrainte admissible σ_adm : {σ_adm:.2f} MPa")
    print("----------------------------")
    verifier_resistance(σ_max, σ_adm)

if __name__ == "__main__":
    main()


    
    