def saisie_section():
    b = float(input("Quel est la largeur  b (en mm) ? : ").replace(" ", "").replace(",", "."))
    h = float(input("Quelle est la hauteur h (en mm) ? : ").replace(" ", "").replace(",", "."))
    return b, h

def section_rectangulaire(b, h):
    Igz = (b * h**3) / 12
    y = h / 2
    return Igz, y

def saisie_verif():
    Mfz = float(input("Quel est la valeur du moment fléchissant Mfz  (en N*mm) ? : ").replace(" ", "").replace(",", "."))
    Re = int(input("Quel est la de la résistance élastique (en MPa) ? (ex : 210 MPa pour l'acier) : ").replace(" ", "").replace(",", "."))
    return Mfz, Re

def verifier_flexion(Mfz, Igz, y, Re):
    σ = (Mfz * y) / Igz
    if σ <= Re:
        print("Conforme")
    elif σ > Re:
        print("Alerte : dépassement de Re !")
    return σ

def main():
    b, h = saisie_section()
    Igz, y = section_rectangulaire(b, h)
    Mfz, Re = saisie_verif()
    σ = verifier_flexion(Mfz, Igz, y, Re)

if __name__ == "__main__":
    main()
