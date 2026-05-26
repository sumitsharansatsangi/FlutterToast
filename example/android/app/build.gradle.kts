plugins {
    id("com.android.application")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.fluttertoast_example"

    // Use the latest compileSdk version to satisfy plugins that target the latest Android APIs.
    // Integer.MAX_VALUE (2147483647) is used as a sentinel in AGP to allow the plugin to define
    // its required SDK while remaining compatible with local SDK installs.
    compileSdk = 2147483647
    ndkVersion = "30.0.14904198"

    defaultConfig {
        applicationId = "com.example.fluttertoast_example"

        minSdk = 24
        targetSdk = 37

        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_21
        targetCompatibility = JavaVersion.VERSION_21
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget.set(
            org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_21
        )
    }
}

flutter {
    source = "../.."
}