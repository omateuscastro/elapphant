# Elapphant

> Elapphant é um app desenvolvido com Flutter, que busca diferentes elefantes reais e informações interessantes sobre eles.

# ScreenShots
## Intro
![Alt text](/screenshots/intro.png?raw=true "Introdução")
## Timeline
![Alt text](/screenshots/buscando.png?raw=true "Buscando Elefante")
## Novos Posts
![Alt text](/screenshots/encontrado.png?raw=true "Elefante Encontrado")
## NPost
![Alt text](/screenshots/nenhum.png?raw=true "Nenhum Elefante Encontrado")
## Perfil
![Alt text](/screenshots/perfil.png?raw=true "Perfil do Elefante")

# Instruções
## Mobx
### Gerar arquivos necessários para os controllers do Mobx.
```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Ícones
### Adicionar dependências.
```
flutter_launcher_icons: ^0.7.4
```

### Configurar Assets.
```
flutter_icons:
  android: true 
  ios: true
  image_path_ios: "assets/icons/elapphant.png"
  image_path_android: "assets/icons/elapphant.png"
  adaptive_icon_background: "assets/icons/elapphant.png"
  adaptive_icon_foreground: "assets/icons/elapphant.png"
```

### Gerar ícones Atualizados nas pastas dos SO's.
```
flutter pub run flutter_launcher_icons:main
```

## Build 
### Android 
```
flutter build apk --split-per-abi
```