Parfait, c’est bien noté : **le script est conçu pour un environnement Debian** (comme ton pseudo-server Docker basé sur Debian Bullseye).  
Et justement, il respecte cela :

- Utilise `apt`
- Installe `locales`, `openssh-server`, etc.
- Pas de commandes spécifiques à Ubuntu ou autres dérivées

Mais je vais renforcer un peu la compatibilité **Debian-only**, et y ajouter deux points essentiels :

1. Vérification que l’OS est bien **Debian**
2. Ajout automatique de `:PlugInstall` à la première ouverture de `neovim`

Je te renvoie un script amélioré dans un instant.

Voici la version stricte du script compatible uniquement avec Debian :  
👉 [📄 Télécharger install_debian_only.sh](sandbox:/mnt/data/debian_install.sh)

### ✅ Améliorations :

- Vérifie que le système est bien **Debian**
- Configure `vim-plug`
- Lance automatiquement `:PlugInstall` à la première ouverture de `neovim`

Tu veux que je t’aide à intégrer ce script dans un `Dockerfile` maintenant ?
