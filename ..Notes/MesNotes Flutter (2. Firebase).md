# Étapes suivies pour la mise en place de FlutterFirebase

0. Prérequis (source : https://firebase.flutter.dev/docs/overview)
- Dans `./pubspec.yaml` ajouter les dépendances suivantes, puis Ctrl+S ou bien run `flutter packages get` en CLI
```dart dependencies:
  flutter:
    sdk: flutter
  firebase_core: "0.5.2"
  cloud_firestore: "^0.14.3"
```

- Créer un projet Android sur la Console Firebase (https://console.firebase.google.com)
- Après avoir suivi les étapes indiquées sur le site, DL le fichier `google-services.json` et le placer dans `./android/app/`
- Dans `./android/build.gradle` ajouter les services google aux dépendances du buildscript, cela permet à Firebase d'utiliser les fichiers de configuration sur Android
```gradle
buildscript {
    ext.kotlin_version = '1.3.50'
    repositories {
        google()
        jcenter()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:3.5.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
        classpath 'com.google.gms:google-services:4.3.3'
    }
}
```
- Dans `./android/app/build.gradle` ajouter la ligne suivante en-dessous de `apply plugin: 'com.android.application'` pour permettre d'exécuter le plugin des services google dont on vient d'ajouter le classpath
```gradle
apply plugin: 'com.google.gms.google-services'
```

- Toujours dans le même fichier `./android/app/build.gradle` ajouter  le `multiDexEnabled true` qui permet de build un projet contenant du Firebase sans devoir pousser le SDK min à la version 20 ou supérieure. Pour que le multiDex fonctionne, il faut aussi ajouter une ligne dans les dépendances tout en bas de ce même fichier
```gradle
    defaultConfig {
        // TODO: Specify your own unique Application ID 
        // (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.example.projet"
        minSdkVersion 16
        targetSdkVersion 29
        multiDexEnabled true
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
```
```gradle
dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
    implementation 'com.android.support:multidex:1.0.3'
}
```

# Lorsque l'installation et la configuration sont faites, implémentation dans le projet :
1. Initialisation de FlutterFire (bootstrap) grâce au plugin firebase_core
2. Initialisation du plugin cloud_firestore