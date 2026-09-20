def calculer_duree_vie(C, P, n, type_roulement):
    
    # 1. Choix de l'exposant p
    if type_roulement == "billes":
        p = 3
    else:
        p = 10 / 3

    # 2. Calculs (bien indentés)
    L10 = (C / P) ** p                # En millions de tours
    L10h = (10**6 * L10) / (60 * n)   # En heures

    # 3. Renvoi des deux résultats
    return L10, L10h

# 4. Demander les valeurs à l'utilisateur
C = float(input("Entrez la charge dynamique de base C (en N): ").replace(" ", "").replace(",", "."))
P = float(input("Entrez la charge équivalente P (en N): ").replace(" ", "").replace(",", "."))
n = float(input("Entrez la vitesse de rotation n (en tr/min): ").replace(" ", "").replace(",", "."))

# 5. Demander le type de roulement
type_roulement = input("Entrez le type de roulement (billes ou rouleaux): ")

# 6. On appelle les 2 fonction et on affiche les résultats
L10, L10h = calculer_duree_vie(C, P, n, type_roulement)
print(f"Durée de vie (L10) : {L10:.2f} millions de tours")
print(f"Durée de vie (L10h) : {L10h:.0f} heures")

# 7. Demander le rythme de travail
heures_par_jour = float(input("Entrez le nombre d'heures de fonctionnement par jour (ex: 8 ou 24): "))
jours_par_an = float(input("Entrez le nombre de jours de fonctionnement par an (ex: 220 ou 365): "))

# 8. Calculer la durée de vie en années
annees = L10h / (heures_par_jour * jours_par_an)
print(f"Durée de vie en années : {annees:.2f} ans")