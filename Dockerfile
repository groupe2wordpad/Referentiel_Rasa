# Étape 1 : image officielle Rasa
FROM rasa/rasa:3.6.8

# Étape 2 : Dossier de travail
WORKDIR /app

# Étape 3 : Copie tous les fichiers dans le conteneur
COPY . /app

# Étape 4 : Installer les dépendances Python avec les bons droits
USER root
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Étape 5 : Entraîner le modèle (toujours en root ici pour éviter les erreurs)
#RUN rasa train

# Étape 6 : Revenir à l’utilisateur non-root utilisé par Rasa
USER 1001

# Étape 7 : Lancer le serveur Rasa avec l’API activée
CMD ["run", "--enable-api", "--cors", "*", "--debug"]
