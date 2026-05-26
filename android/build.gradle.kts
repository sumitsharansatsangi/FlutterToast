group = "io.github.ponnamkarthik.toast.fluttertoast"
version = "1.0-SNAPSHOT"

plugins {
    id("com.android.library")
}

repositories {
    google()
    mavenCentral()
}

android {
    namespace = "io.github.ponnamkarthik.toast.fluttertoast"

    compileSdk = 37

    defaultConfig {
        minSdk = 21
        targetSdk = 37
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_21
        targetCompatibility = JavaVersion.VERSION_21
    }

    kotlinOptions {
        jvmTarget = "21"
    }

    sourceSets {
        getByName("main") {
            java.srcDir("src/main/kotlin")
        }
    }

    lint {
        disable += "InvalidPackage"
    }
}