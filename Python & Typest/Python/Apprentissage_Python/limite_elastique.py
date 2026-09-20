# Dictionnaire des limites élastiques (en MPa)
limites_elastiques = {
    "Acier 316L": 205,
    "Aluminium 6061": 276,
    "Titane Grade 5": 880,
    "Cuivre": 70,
    "Inconel 718": 1030
}

while True:
    print("\n----------------------------------")
    print("Matériaux disponibles :")
    for materiau in limites_elastiques:
        print(f"- {materiau}")

    materiau_saisi = input("\nEntrez le nom du matériau (ou 'q' pour quitter) : ").strip()
    if materiau_saisi.lower() == 'q':
        break

    # Recherche du matériau
    limite_elastique = None
    materiau_choisi = materiau_saisi

    for nom, valeur in limites_elastiques.items():
        if nom.lower() == materiau_saisi.lower():
            limite_elastique = valeur
            materiau_choisi = nom
            break

    if limite_elastique is None:
        print("❌ Erreur : Matériau non reconnu. Réessaie !")
        continue

    # Choix de la face du volume qui reçoit la force
    print("\nSur quelle face du volume la force est-elle appliquée ?")
    print("1. Face supérieure (Longueur x Largeur)")
    print("2. Face latérale (Largeur x Épaisseur)")
    print("3. Face frontale (Longueur x Épaisseur)")
    print("4. Surface déjà calculée (en mm²)")
    choix = input("Choix (1, 2, 3 ou 4) : ").strip()

    try:
        if choix == "1":
            L = float(input("Entrez la longueur (en mm) : ").replace(" ", "").replace(",", "."))
            l = float(input("Entrez la largeur (en mm) : ").replace(" ", "").replace(",", "."))
            surface_mm2 = L * l

        elif choix == "2":
            l = float(input("Entrez la largeur (en mm) : ").replace(" ", "").replace(",", "."))
            e = float(input("Entrez l'épaisseur (en mm) : ").replace(" ", "").replace(",", "."))
            surface_mm2 = l * e

        elif choix == "3":
            L = float(input("Entrez la longueur (en mm) : ").replace(" ", "").replace(",", "."))
            e = float(input("Entrez l'épaisseur (en mm) : ").replace(" ", "").replace(",", "."))
            surface_mm2 = L * e

        elif choix == "4":
            surf_str = input("Entrez la surface directe (en mm²) : ")
            surface_mm2 = float(surf_str.replace(" ", "").replace(",", "."))

        else:
            print("❌ Choix invalide !")
            continue

    except ValueError:
        print("❌ Erreur : Saisie numérique invalide !")
        continue

    if surface_mm2 <= 0:
        print("❌ Erreur : La surface doit être supérieure à 0 !")
        continue

    # Saisie de la force
    force_str = input("Entrez la force appliquée (en N) : ").strip()
    if force_str.lower() == 'q':
        break

    try:
        force = float(force_str.replace(" ", "").replace(",", "."))
    except ValueError:
        print("❌ Erreur : Force invalide !")
        continue

    # Calcul de la contrainte (1 MPa = 1 N/mm²)
    contrainte_mpa = force / surface_mm2

    print(f"\nRésultat pour le {materiau_choisi} (Re = {limite_elastique} MPa) :")
    print(f"👉 Surface de contact : {surface_mm2:.2f} mm²")
    print(f"👉 Contrainte calculée : {contrainte_mpa:.4f} MPa")

    if contrainte_mpa > limite_elastique:
        print(f"⚠️ Attention : La contrainte dépasse la limite élastique ({limite_elastique} MPa). Plasticité !")
    else:
        print(f"✅ La contrainte est sous la limite élastique ({limite_elastique} MPa). Élastique !")