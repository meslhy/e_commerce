# E-Commerce

A Flutter e-commerce app built on the Route Misr e-commerce API: browse products and categories, manage favorites and a cart, and check out your profile.

## Features

- Register and login
- Home tab with image slideshows and product highlights
- Categories tab
- Product details screen with a read-more description
- Favorites tab
- Cart screen with cart items
- Profile tab
- Session persistence with shared_preferences
- Toast feedback and connectivity-aware error handling

## Tech Stack

- **Flutter / Dart**
- **State management:** flutter_bloc (Cubit) + dartz
- **Dependency injection:** get_it + injectable
- **Networking:** http against `ecommerce.routemisr.com`
- **UI:** carousel_slider, flutter_image_slideshow, cached_network_image, readmore, fluttertoast

## Architecture

Layered structure under `lib/`: `data/` (models, repo implementations, data sources), `domain/` (contracts, use cases, DI) and `ui/` (screens and view models).

## Getting Started

```bash
flutter pub get
dart run build_runner build
flutter run
```
