# SwiftUIとFirebaseを使用したログイン画面


## 概要
このプロジェクトは、SwiftUIとFirebaseを使用してログイン画面を作成するためのサンプルアプリです。  
ユーザーはメールアドレスとパスワードを使用してログインできます。  
`Firebase Authentication`を使用して、ユーザーの認証情報を管理します。

### Git Infomation
<div>
  <img src="https://img.shields.io/badge/Swift-FA7343?style=for-the-badge&logo=swift&logoColor=white">
  <img src="https://img.shields.io/badge/firebase-ffca28?style=for-the-badge&logo=firebase&logoColor=black">
  <img src="https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=apple&logoColor=white">
  <img src="https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white">
</div>

![GitHub repo size](https://img.shields.io/github/repo-size/Vermouth117/SwiftUI_SOLO)
![GitHub last commit](https://img.shields.io/github/last-commit/Vermouth117/SwiftUI_SOLO)
![GitHub top language](https://img.shields.io/github/languages/top/Vermouth117/SwiftUI_SOLO)
![GitHub language count](https://img.shields.io/github/languages/count/Vermouth117/SwiftUI_SOLO)

<br>

## 必要な環境

このプロジェクトをビルドおよび実行するためには、以下の要件が必要です。

- Xcode 11以降
- iOS 13以降
- Firebaseプロジェクト
  
## Firebaseのセットアップ

1. [Firebaseコンソール](https://console.firebase.google.com/)にアクセスし、新しいプロジェクトを作成します。
2. iOSアプリを追加し、バンドルIDを入力します。
3. ダウンロードした`GoogleService-Info.plist`ファイルをプロジェクトのルートディレクトリに追加します。
  
## プロジェクトのセットアップ

1. プロジェクトをクローンするか、ダウンロードします。
2. `LoginScreen.swift`ファイル内のFirebaseの設定を編集します。  
`configureFirebase()`メソッド内のAPIキーとプロジェクトIDを、Firebaseコンソールから取得した情報で置き換えます。

```swift
// Firebaseの設定
private func configureFirebase() {
    FirebaseApp.configure()
}
```
  
## ビルドと実行

1. Xcodeでプロジェクトを開きます。
2. シミュレータまたは実機を選択し、ビルドと実行を行います。
  
## ログイン

アプリが起動すると、ログイン画面が表示されます。  
メールアドレスとパスワードを入力し、「ログイン」ボタンをタップしてログインします。  
正しい認証情報が提供された場合、ログインが成功し、アプリのメイン画面に遷移します。
  
## Firebase Authenticationのカスタマイズ

このサンプルでは、Firebase Authenticationを使用してログインを処理していますが、  
必要に応じてカスタマイズすることができます。  
Firebase Authenticationのドキュメントを参照し、追加の機能やセキュリティ対策を実装することができます。
  
## 注意事項

このサンプルアプリは教育目的で作成されたものであり、  
実際のアプリケーションに組み込む前にセキュリティの改善が必要です。  
パスワードの
ハッシュ化やエラーハンドリングなど、セキュリティ上のベストプラクティスに従ってください。
