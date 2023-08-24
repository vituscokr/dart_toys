# web

flutter web project 

```shell
flutter create web
cd web
```

웹 지원 하도록 설정 하기 위해서는 아래와 같이 명령을 입력한다. 
```shell
flutter config --enable-web
```
웹 지원 하지 않도록 설정 하기 위해서는 아래의 명령어를 입력한다. 
```shell
flutter config --no-enable-web
```
대응되는 디바이스를 확인 하는 명령어입니다.

```shell
flutter devices 
```
웹앱 시작은 아래의 명령어로 

```shell
flutter run -d chrome 
```

빌드하기 
```shell
flutter build web

```
web/build/web

```shell
cd build/web 
python3 -m http.server 8000
```





## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
