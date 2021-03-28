# Mots-clés
- **Final** : constante

- **_name** : le underscore indique un élément privé (au lieu de public par défaut)

- **Instanciation d'une classe** : le new n'est pas nécessaire, car automatiquement considéré par le compilateur. On peut le mettre ou non, c'est au choix

- **Exemple de liste en dart:**
```Dart 
int main() {
  List<int> list = List<int>();
  list.add(5);
  list.addAll([6,7,9]);
  print("Liste 1 : " + list.toString());
  List<int> list2 = List.filled(10, 5);
  print("Liste 2 : " + list2.toString());
  List<int> list3 = List.generate(100, (index) => index * 2);
  print("Liste 3 : " + list3.toString());
}
```

Output :

<img src="md.imgs/dart lists.png" />


- "Raised buttons have a minimum size of 88.0 by 36.0 which can be overidden with ButtonTheme."
```dart
  ButtonTheme(
    minWidth: 200.0,
    height: 100.0,
    child: RaisedButton(
      onPressed: () {},
      child: Text("test"),
    ),
  );
```
