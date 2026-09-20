import random

print('Your dassword: ')

chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()?"

password = ''
for x in range(16):
    password += random.choice(chars)

print(password)