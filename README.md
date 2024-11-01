# Project Title

## Overview

This project is a Flutter application developed using Flutter SDK version 3.24.2 and Dart version 3.5.2. The app includes features like a Splash Screen, Login, User List, Update Data, and Delete Data functionalities. It utilizes the [Dio](https://pub.dev/packages/dio) library for API requests and [GetX](https://pub.dev/packages/get) for state management.

## Features

- Splash Screen
- Login functionality
- List of users from a dummy API
- Update user data
- Delete user data
- Responsive layout supporting multiple screen resolutions (16:9, 19.5:9, 22:9)

## Installation

### Prerequisites

1. **Flutter SDK**: Version 3.24.2 or the latest
2. **Dart**: Version 3.5.2 or the latest
3. **Dio**: For HTTP requests ([Dio package](https://pub.dev/packages/dio))
4. **GetX**: For state management ([GetX package](https://pub.dev/packages/get))

## Architecture

This project follows the **Clean Architecture** and **Modular Design** principles, ensuring separation of concerns and making the codebase more maintainable and testable.

### Project Structure

- **Domain Layer**: 
  - Located in `domain/main_domain`, this layer contains the core business logic and entities of the application. It is responsible for defining the use cases and models that represent the business domain.
  
- **Data Layer**: 
  - Also found within `domain/main_domain`, this layer handles data retrieval, whether from local storage or remote APIs. It abstracts the data sources from the domain layer, ensuring that the application logic is not tightly coupled with data retrieval mechanisms.

- **UI Layer**:
  - The user interface components are organized in `features/main_feature`. This layer contains all the screens and widgets that users interact with, ensuring that the presentation logic is separate from the business logic.

- **Utility Layer**:
  - Shared libraries for common utilities and dependencies are placed in `shared_libraries/common` and `shared_libraries/dependencies`. This modular structure allows for better code reuse and organization across different features of the application.

By employing Clean Architecture and a modular approach, this project is designed to be scalable and adaptable to future requirements, making it easier to test individual components and maintain the code over time.

### Steps to Run the Project

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
2. Run command belos:
   ```bash
   flutter pub get
   melos bootstrap/melos bs

### Steps to Run the Test
1. Must change directory to domain/main_domain
2. Run command belos:
   ```bash
   flutter test test/usecases/get_list_user_use_case_test.dart
   flutter test test/usecases/post_user_use_case_test.dart

