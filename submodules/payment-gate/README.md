# Soctrip - Payment Gate

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

## Work in payment_gate project
- Open the main application with IDE (Android Studio (recommend) or VScode)
- The the payment_gate project is located at submodules/payment-gate

## miscellaneous
- To working with payment_gate project local git repo with Android Studio:
  - Open menu `Android Studio` if you are using MacOS or menu `File` for other OS
  - Choose `Preferences...`
  - Active tab `Version Control` then `Direactory Mappings`
  - Click on `soctrip-mobile` repository
  - Click on `-` button
  - Click `OK`
  - Now you can use the payment_gate project repository with Android Studio without confusion 

## How to use PaymentGate

- Add payment_gate to your dependency (in `pubspec.yaml` dependencies section). For example
```yaml
  payment_gate:
    path: ../payment-gate
```

- Create order.
  Request your back-end to create order, and get the `paymentToken`.
  _Please note that `success_callback_url` should be `PaymentGateApp.successCallbackUrl` or start
  with `PaymentGateApp.successCallbackUrl`. Alternative, use `PaymentGateApp.failCallbackUrl` `fail_callback_url`._

- Start payment process and get the result.
  _Please note that after the the payment succeed, you might need to tap to the icon to navigate
  back from the payment gate_

```dart

final paymentResult = await PaymentGateApp.start(context, paymentToken);
```