# Soctrip - map

## Getting started

- Create ssh key:
```bash
ssh-keygen
```
- Copy the public key and add you your gitlab repo
```bash
cat ~/.ssh/id_rsa.pub
```
_[More information about SSH keys](https://gitlab.tma.com.vn/help/user/ssh.md)_
- Clone the main application
```bash
git clone --recurse-submodules -j8 -b dev git@gitlab.tma.com.vn:soctrip-development/common/mobile/soctrip-master-app.git soctrip-mobile
```
- Install the dependencies
```bash
cd soctrip-mobile
flutter clean
flutter pub get
```
- Run the application:
```bash
flutter run
```

## Work in map project
- Open the main application with IDE (Android Studio (recommend) or VScode)
- The the ecommerce project is located at submodules/ecommerce

## miscellaneous
- To working with ecommerce project local git repo with Android Studio:
  - Open menu `Android Studio` if you are using MacOS or menu `File` for other OS
  - Choose `Preferences...`
  - Active tab `Version Control` then `Direactory Mappings`
  - Click on `soctrip-mobile` repository
  - Click on `-` button
  - Click `OK`
  - Now you can use the ecommerce project repository with Android Studio without confusion 