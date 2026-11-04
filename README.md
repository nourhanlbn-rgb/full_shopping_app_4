# Full Shopping App 4

A simple Flutter app that practices navigation with `go_router`, forms, and validation.

## Features

- **Login page**: validates username and password, then goes to Home.
- **Signup page**: form with Username, Email, Password and Confirm Password, with validation messages (including "Passwords do not match").
- **Home page**: welcome screen with a Logout button.
- **Products page**: sub-route under `/home`.
- **Route protection**: any path starting with `/home` redirects to `/login` if the user is not logged in.

## Routes

| Path | Page | Notes |
|---|---|---|
| `/login` | LoginPage | initial location |
| `/signup` | SignupPage | top-level, so new users can open it without being logged in |
| `/home` | HomePage | protected by redirect |
| `/home/products` | ProductsPage | protected by redirect |

## Navigation experiments (go vs push)

| # | Open | Back | Console result |
|---|---|---|---|
| 1 | `push("/signup")` | `pop()` | start Login, start Signup, finish Signup |
| 2 | `go("/signup")` | `pop()` | start Login, start Signup, finish Login, then error "There is nothing to pop" |
| 3 | `go("/signup")` | `go("/login")` | start Login, start Signup, finish Login, start Login, finish Signup |
| 4 | `push("/signup")` | AppBar back arrow | same as experiment 1 |

**Conclusion:** `push` adds a page on top of the stack, so the old page stays alive and `pop` returns to it. `go` replaces the whole stack, so the old page is disposed and there is nothing to pop back to.

## Project structure

```
lib/
  main.dart
  router.dart
  login_page.dart
  signup_page.dart
  home_page.dart
  products_page.dart
  test.dart          # Database (username, password, isLoggedIn)
```

## Run the app

```
flutter pub get
flutter run -d chrome
```

## Built with

- Flutter
- go_router
