def questions():
    nom = input("Quel est votre nom ? ")
    age = int(input("Quel est votre age ? "))
    return nom, age

def reponses(nom, age):
    print("Vous vous appelez",nom)
    print(f"Vous avez {age} ans")

nom, age = questions()
reponses(nom, age)

# Test de synchronisation GitHubdzsdsd