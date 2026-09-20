from math import pi

def calculer_surface():

    # 1. On demande à l'utilisateur de choisir entre le calcul de l'aire en fonction du choix de l'utilisateur
    choix = input("Voulez-vous calculer l'aire : (1) D'un cylindre ? (2) D'un tube ? (3) D'un rectangle ? "
    "(4) D'un profilé rectangulaire ? Entrez 1, 2, 3 ou 4 : ")

    # 2. On vérifie que le choix est valide
    while choix not in ["1", "2", "3", "4"]:
        choix = input("Choix invalide. Veuillez entrer 1 pour cylindre, 2 pour le tube, 3 pour le rectangle ou 4 pour le profilé rectangulaire : ")

    # 3. On demande les dimensions en fonction du choix de l'utilisateur
    if choix == "1":    # Pour un cylindre
        d = float(input("Entrez le diamètre (en mm) : ").replace(" ", "").replace(",", "."))
        A = pi * d**2 / 4

    elif choix == "2":  # Pour un tube
        D = float(input("Entrez le diamètre extérieur D (en mm) : ").replace(" ", "").replace(",", "."))
        d = float(input("Entrez le diamètre intérieur d (en mm) : ").replace(" ", "").replace(",", "."))
        A = pi * (D**2 - d**2) / 4 

    elif choix == "3":  # Pour un rectangle
        l = float(input("Entrez la longueur (en mm) : ").replace(" ", "").replace(",", "."))
        L = float(input("Entrez la largeur (en mm) : ").replace(" ", "").replace(",", "."))
        A = l * L

    elif choix == "4":  # Pour un profilé rectangulaire creux
        L_ext = float(input("Entrez la largeur L exrérieur (en mm) : ").replace(" ", "").replace(",", "."))
        l_ext = float(input("Entrez la longueur l extérieur (en mm) : ").replace(" ", "").replace(",", "."))
        L_int = float(input("Entrez la largeur L intérieur (en mm) : ").replace(" ", "").replace(",", "."))
        l_int = float(input("Entrez la longueur l intérieur (en mm) : ").replace(" ", "").replace(",", "."))
        A = (L_ext * l_ext) - (L_int * l_int)

    return A 

# 4. On appelle la fonction et on affiche le résultat
A = calculer_surface()
print(f"L'aire calculée est : {A:.2f} mm²")



# 5. On demande à l'utilisateur de continuer vers le calcul de la contrainte normale
def calcule_contrainte_normale(A):

    # 6. On demande la force appliquée
    F = float(input("Entrez la force appliquée (en N) : ").replace(" ", "").replace(",", "."))

    # 7. On calcul la contrainte normale
    return F / A

# 8. On appelle la fonction et on affiche le résultat
sigma = calcule_contrainte_normale(A)
print(f"La contrainte normale est : {sigma:.2f} N/mm²")



# 9. On demande à l'utilisateur de continuer avec le calcul de sigma adm
def verifier_resistance(sigma):

    # 10. On demande à l'utilisateur de rentrer la limite d'élasticité souhaitée
    Re = float(input("Entrez la limite d'élasticité (en N/mm²) ou (MPa), (ex: 235MPa) : ").replace (" ", "").replace(",", "."))

    # 11. On demande à l'utilisateur de rentrer la limite d'élasticité souhaitée
    s = float(input("Entrez le coefficient de sécurité s souhaité (ex: 1.5 ou 2)").replace (" ", "").replace(",", "."))

    # 12. On calcul sigma adm pour vérifier si la pièce résiste
    sigma_adm = Re / s

    # 13. On vérifie si la pièce résiste
    if sigma <= sigma_adm:
        print("La pièce résiste !")                     # Oui

    else:
        print("Attention : la pièce ne résistera pas")  # Non

# 14. On appelle la fonction et on affiche le résultat
verifier_resistance(sigma)