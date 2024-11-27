# Working with NStack

> [!IMPORTANT]
> ⚠️ **Notes regarding the NStack**
>
> NStack might currently be down as the
> organization plans to sunset this service.
> However, this guide will assist future
> developers if they choose to work with it &
> NStack is up again.

_Please visit [Nstack website](https://www.nstack.io) to check if it's up._

The feature integration was removed in the [chore: Removed NStack feature integration](https://github.com/ml-opensource/flutter-template/pull/161) Pull Request.

**NStack** is a Backend-as-a-Service (BaaS) developed by Nodes/Monstarlab. It offers features such as localization, in-app messaging, and rate limiting.

---

## Getting Started  

For more details about the Flutter package for the NStack library, visit [NStack Flutter SDK on GitHub](https://github.com/nstack-io/flutter-sdk).  

---

## Installation  

To use NStack, you'll need a typical `build_runner` setup. Follow these steps to install the required packages by adding them to your `pubspec.yaml` file:  

```yaml
dependencies:
  nstack:
    git:
      url: https://github.com/nstack-io/flutter-sdk.git
      ref: v0.5.1

dev_dependencies:
  build_runner:
```

### Additional Notes  

- **Circular Dependencies:** Some packages may cause circular dependency issues. To resolve this, specify exact versions of those dependencies.  

  Example:  

  ```yaml
  flutter_svg: 2.0.9
  lottie: 3.0.0
  ```  

---

## Running the Code Generator  

1. **Create Configuration File:**  
   Create a file named `nstack.json` under `/lib/nstack` with the following content:  

   ```json
   {
     "version": 1,
     "nstack_project_id": "YOUR_PROJECT_ID",
     "nstack_api_key": "YOUR_REST_API_KEY"
   }
   ```  

2. **Run the Generator:**  
   Based on your use case, run one of the following commands:  

   - If your package depends on Flutter:  

     ```bash
     flutter pub run build_runner build
     ```  

   - Otherwise:  

     ```bash
     pub run build_runner build
     ```  

   A successful execution will generate a `nstack.dart` file tailored to your project.  

3. **Incremental Updates:**  
   To watch for changes in `nstack.json` and trigger automatic rebuilds, use the following command:  

   ```bash
   flutter pub run build_runner watch --delete-conflicting-outputs
   ```  

   Increment the `"version"` number in `nstack.json` and save to trigger an update.  

---

## Example Usage  

1. **Import Generated File:**  
   Import the `nstack.dart` file in your project.  

2. **Integrate NStack Widget:**  
   In your `app.dart`, under `MaterialApp.router`, use the following code in the `builder`:  

   ```dart
   return MaterialApp.router(
     // ... other codes go here
     builder: (context, widget) {
       if (widget == null) {
         return const SizedBox();
       }

       return NStackWidget(
         child: widget,
       );
     },
   );
   ```  

3. **Analysis Options:**  
   Add the following to your `analysis_options.yaml` to exclude the generated `nstack.dart` file:  

   ```yaml
   - "**/*nstack.dart"
   ```  

---

## Additional Setup  

### Java and Gradle Compatibility  

Ensure you have **Java 17** and a compatible Gradle version for Android builds.  

### Workaround for Namespace Issue  

If NStack complains about missing namespaces in its library, apply the following workaround in your `android/build.gradle`:  

```gradle
// android/build.gradle
rootProject.buildDir = "../build" // <-- existing line 

// Start of NStack Workaround
subprojects {
    afterEvaluate { project ->
        if (project.name == 'nstack') {
            if (project.hasProperty('android')) {
                project.android {
                    if (namespace == null) {
                        namespace project.group
                    }
                }
                project.buildscript {
                    dependencies {
                        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:2.0.20"
                    }
                }
            }
        }
    }
}
// End of NStack Workaround
```  

---

This guide provides a complete overview of integrating and using NStack in a Flutter project. If you encounter issues, feel free to consult the official [NStack Flutter SDK documentation](https://github.com/nstack-io/flutter-sdk).  
