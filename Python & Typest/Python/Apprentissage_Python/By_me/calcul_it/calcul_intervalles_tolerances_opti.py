from donnees import TRANCHES, obtenir_ecarts

def saisie_diametre():
    D = float(input("Quel est le diamètre nominale ? : ").replace(" ", "").replace(",", "."))
    return D

def trouver_index_tranche(d_nom):
    for i in range(len(TRANCHES) - 1):
        if TRANCHES[i] < d_nom <= TRANCHES[i + 1]:
            return i

def saisie_symbole():
    aju_alesage = (input("Quel est l'ajustement de l'alésage ? : ").replace(" ", "").replace(",", "."))
    aju_arbre = (input("Quel est l'ajustement de l'arbre ? : ").replace(" ", "").replace(",", "."))
    return aju_alesage, aju_arbre

def calculer_cotes(d_nom, ES, EI):
    Dmax = d_nom + ES / 1000
    Dmin = d_nom + EI / 1000
    return Dmax, Dmin

def calculer_jeu(Dmax, Dmin, dmax, dmin):
    Jmax = Dmax - dmin
    Jmin = Dmin - dmax
    if Jmin >= 0:
        nature = "avec jeu"
    elif Jmax <= 0:
        nature = "avec serrage"
    else:
        nature = "incertain"
    return Jmax, Jmin, nature

def main():
    D = saisie_diametre()
    aju_alesage, aju_arbre = saisie_symbole()
    index = trouver_index_tranche(D)
    ES, EI = obtenir_ecarts(aju_alesage, index)
    es, ei = obtenir_ecarts(aju_arbre, index)
    Dmax, Dmin = calculer_cotes(D, ES, EI)
    dmax, dmin = calculer_cotes(D, es, ei)
    Jmax, Jmin, nature = calculer_jeu(Dmax, Dmin, dmax, dmin)

    print(f"Ajustement : Ø {D}/{aju_alesage}/{aju_arbre}")
    print(f"Jeu : Jmax = {Jmax:.3f} mm | Jmin = {Jmin:.3f} mm")
    print(f"Alésage : Dmax = {Dmax:.3f} mm | Dmin = {Dmin:.3f} mm")
    print(f"Arbre : dmax = {dmax:.3f} mm | dmin = {dmin:.3f} mm")
    print(f"Montage de l'ajustement : {nature}")

if __name__ == "__main__":
    main()