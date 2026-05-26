import com.android.build.api.dsl.LibraryExtension

plugins {
    id("com.android.library")
}

group = "io.github.ponnamkarthik.toast.fluttertoast"
version = "1.0-SNAPSHOT"

repositories {
    google()
    mavenCentral()
}

configure<LibraryExtension> {
    namespace = "io.github.ponnamkarthik.toast.fluttertoast"

    // Match the SDK level required by the plugin/example build.
    compileSdk = 37

    defaultConfig {
        minSdk = 21
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_21
        targetCompatibility = JavaVersion.VERSION_21
    }

    // Configure Java source compatibility and Kotlin source directories
    sourceSets {
        getByName("main") {
            java {
                setSrcDirs(listOf("src/main/kotlin"))
            }
        }
    }

    lint {
        disable += "InvalidPackage"
    }
}
