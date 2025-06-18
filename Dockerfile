# Étape 1 : image officielle Rasa
FROM rasa/rasa:3.6.8

# Étape 2 : Dossier de travail
WORKDIR /app

# Étape 3 : Copie tous les fichiers dans le conteneur
COPY . /app

# Étape 4 : Installer les dépendances Python avec les bons droits
# On passe temporairement en root pour éviter les erreurs de permission
USER root
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
# Revenir à l’utilisateur non-root utilisé par Rasa
USER 1001

# Étape 5 : Entraîner le modèle
RUN rasa train

# Étape 6 : Lancer le serveur Rasa avec l’API activée
CMD ["run", "--enable-api", "--cors", "*", "--debug"]
