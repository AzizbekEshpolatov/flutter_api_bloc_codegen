# flutter_api_bloc_codegen

## uz

### Loyihaning maqsadi
Ushbu loyiha siz bergan API asosida, model sinflarini va bloc kodlarini avtomatik yaratishni 
ta'minlaydi. Shunday qilib, qo'lda kod yozish jarayoni kamayadi va ishlab chiqish tezlashadi.

### Asosiy vazifalar
- API interfeyslarini avtomatik generatsiya qilish
- Model sinflarni avtomatik yaratish
- Bloc kodini avtomatik generatsiya qilish
- `pubspec.yaml` fayliga kerakli paketlarni qo'shish

### Qanday ishlatish
**Paketlarni qo'shish:**  
   `pubspec.yaml` faylingizga quyidagi qismni joylashtiring:
   ```yaml
   dependencies:
     dio: ^x.x.x
     retrofit: ^x.x.x
     json_annotation: ^x.x.x
     flutter_bloc: ^x.x.x

   dev_dependencies:
     build_runner: ^x.x.x
     retrofit_generator: ^x.x.x
     json_serializable: ^x.x.x


## en

### Project Purpose
This project aims to streamline development by automatically generating API interfaces, model classes, and bloc code based on a provided API schema. This minimizes manual coding, reduces errors, and accelerates the development process.

### Theoretical Background
- **API Interface Generation:**  
  Automatically generating API interfaces avoids repetitive boilerplate code for network requests. By using annotations and code generators (e.g., Retrofit with Dio), the API client is consistent and less error-prone.

- **Model Class Generation:**  
  Models are generated automatically from JSON schemas or annotated classes, facilitating seamless JSON serialization and deserialization. This leverages tools like `json_serializable` to ensure data integrity and ease of maintenance.

- **Bloc Code Generation:**  
  The Bloc pattern separates business logic from UI components. Auto-generating bloc code standardizes state management, reduces manual coding, and ensures that the communication between the UI and business logic adheres to best practices.

- **Integration with Flutter Ecosystem:**  
  The project integrates popular packages such as `dio` for HTTP networking, `retrofit` for API client generation, and `flutter_bloc` for state management. The use of `build_runner` automates the code generation process, promoting rapid development and a clean project structure.

### Main Features
- Automatic generation of API interfaces
- Automatic generation of model classes
- Automatic generation of bloc code
- Pre-configured dependencies for seamless integration in Flutter projects

### How to Use
1. **Add Dependencies:**  
   Include the following in your `pubspec.yaml`:
   ```yaml
   dependencies:
     dio: ^x.x.x
     retrofit: ^x.x.x
     json_annotation: ^x.x.x
     flutter_bloc: ^x.x.x

   dev_dependencies:
     build_runner: ^x.x.x
     retrofit_generator: ^x.x.x
     json_serializable: ^x.x.x
