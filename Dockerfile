# Étape 1 : image officielle Rasa
FROM rasa/rasa:3.6.8

# Étape 2 : Crée le dossier de travail
WORKDIR /app

# Étape 3 : Copie tous les fichiers du projet dans l'image
COPY . /app

# Étape 4 : Installation de dépendances custom (optionnel)
# Ex: si tu as des packages dans requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Étape 5 : Entraîne le modèle (optionnel si tu veux l'entraîner ailleurs)
RUN rasa train

# Étape 6 : Lance le serveur Rasa avec l’API activée
CMD ["run", "--enable-api", "--cors", "*", "--debug"]
