# Synthesis

**Synthesis** is an application developed as part of a school project. It has been realized with the Flutter framework.
The course is given in French, you will find all the details of the application in French.

## Description

L'application Synthesis est destiné aux étudiants. Le but de celle-ci est de créer ou rejoindre facilement des groupes
dans lesquels tout est centralisé.
Effectivement, on va retrouver dans un groupe toute une liste de cours. Pour chaque cours,
on y retrouve les ressources officielles, mais ce n'est pas tout : les étudiants peuvent y partager leur notes, leur
synthèse ou encore des photos prisent durant le cours. En plus de cela, un étudiant en difficulté
peut poser ses questions via un chat dédié au cours qui lui pose un problème.

## Design

Le design de l'application a été réalisé à l'aide de l'outil
[Figma](https://www.figma.com). Vous pouvez accéder au **mockup** de
l'application via ce [lien](https://www.figma.com/file/zMKzLaDnktYNdJXcdXekuK/Synthesis?node-id=0%3A1).

### v2
<p float="left">
  <img src="resourcesREADME/home.png" width="200" />
  <img src="resourcesREADME/home1.png" width="200" /> 
  <img src="resourcesREADME/home2.png" width="200" />
</p>
<p float="left">
  <img src="resourcesREADME/home3.png" width="200" />
   <img src="resourcesREADME/connexionv2.png" width="200" /> 
  <img src="resourcesREADME/inscriptionv2.png" width="200" />
</p>

<p float="left">
  <img src="resourcesREADME/chooseoptionv2.png" width="200" />
</p>

### v1
<p float="left">
  <img src="resourcesREADME/Home1.png" width="200" />
  <img src="resourcesREADME/Home2.png" width="200" /> 
  <img src="resourcesREADME/Home3.png" width="200" />
</p>
<p float="left">
  <img src="resourcesREADME/Sign-in.png" width="200" />
  <img src="resourcesREADME/Registration.png" width="200" /> 
  <img src="resourcesREADME/ForgotPassword.png" width="200" />
</p>
<p float="left">
  <img src="resourcesREADME/JoinOrCreateGroup.png" width="200" />
  <img src="resourcesREADME/GroupHome.png" width="200" /> 
  <img src="resourcesREADME/CourseHome.png" width="200" />
</p>
<p float="left">
  <img src="resourcesREADME/Chat.png" width="200" />
  <img src="resourcesREADME/RessourceExample.png" width="200" /> 
  <img src="resourcesREADME/ParticipantExample.png" width="200" />
</p>

## Site Map
La carte de l'application a également été réalisé avec [Figma](https://www.figma.com). Voici ci-dessous l'ensemble des
intéractions possible au sein de l'application. Afin d'**intéragir** avec les maquettes
réalisées vous pouvez clicker sur ce [lien](https://www.figma.com/proto/zMKzLaDnktYNdJXcdXekuK/Synthesis?node-id=5%3A159&scaling=scale-down&page-id=0%3A1&starting-point-node-id=5%3A159).

![site map](resourcesREADME/siteMap.png)

## Fonctionnalités
- En tant qu'**anonyme**, je peux me connecter via l'application.
- En tant qu'**anonyme**, je peux me connecter à l'application via **Google**.
- En tant qu'**utilisateur connecté**, je peux rejoindre un groupe.
- En tant qu'**utilisateur connecté**, je peux créer groupe.
- En tant qu'**utilisateur connecté**, je peux accéder au contenu d'un groupe.
- En tant qu'**utilisateur connecté**, je peux partager le code du groupe.
- En tant qu'**utilisateur connecté**, je peux consulter la liste des membres du groupe.
- En tant qu'**utilisateur connecté**, je peux ajouter un cours à un groupe.
- En tant qu'**utilisateur connecté**, je peux ajouter/consulter une ressource pour un cours.
- En tant qu'**utilisateur connecté**, je peux ajouter/consulter une note pour un cours.
- En tant qu'**utilisateur connecté**, je peux ajouter/consulter une photo pour un cours.
- En tant qu'**utilisateur connecté**, je peux poser une question via le chat du cours dédié.
- En tant qu'**utilisateur connecté**, je peux télécharger une ressource d'un cours.
- En tant qu'**utilisateur connecté**, j'ai accès aux ressources téléchargé en mode hors ligne.

## Dépendances
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
  liquid_swipe: ^3.0.0
  smooth_page_indicator: ^1.0.0+2
  font_awesome_flutter: ^10.2.1
  carousel_slider: ^4.1.1
  image_card: ^0.0.4
  avatars: ^3.0.2
  dropdown_button2: ^1.9.1
  firebase_core: ^2.3.0
  firebase_auth: ^4.1.5
  get: ^4.6.5
  firebase_core_platform_interface: 4.5.2
  cloud_firestore: ^4.1.0
  google_sign_in: ^5.4.2
```

