# Script pour configurer Gradle et générer l'APK React Native
cd C:\Users\hamadouche\Downloads\snioersolv6

git restore android/gradle.properties || echo "Aucune modification à restaurer pour gradle.properties"

echo 'pluginManagement {
    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()
    }
}
dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}
rootProject.name = "snioersolv6"
include ":app"' > android/settings.gradle

echo 'buildscript {
    ext {
        buildToolsVersion = "33.0.0"
        minSdkVersion = 21
        compileSdkVersion = 33
        targetSdkVersion = 33
        kotlinVersion = "1.8.0"
        androidXCore = "1.9.0"
    }
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.1.0")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.8.0")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url "https://www.jitpack.io" }
    }
}' > android/build.gradle

echo 'plugins {
    id "com.android.application"
    id "org.jetbrains.kotlin.android"
}

android {
    compileSdk 33

    defaultConfig {
        applicationId "com.snioersolv6"
        minSdk 21
        targetSdk 33
        versionCode 1
        versionName "1.0"
        testInstrumentationRunner "androidx.test.runner.AndroidJUnitRunner"
    }

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro"
        }
    }
}

dependencies {
    implementation "androidx.core:core:1.9.0"
    implementation "com.facebook.react:react-native:+"
    implementation "androidx.appcompat:appcompat:1.6.1"
    implementation "androidx.swiperefreshlayout:swiperefreshlayout:1.1.0"
    testImplementation "junit:junit:4.13.2"
    androidTestImplementation "androidx.test.ext:junit:1.1.5"
    androidTestImplementation "androidx.test.espresso:espresso-core:3.5.1"
}' > android/app/build.gradle

echo 'distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-8.0-bin.zip
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists' > android/gradle/wrapper/gradle-wrapper.properties

echo 'org.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=512m
android.useAndroidX=true
android.enableJetifier=true' > android/gradle.properties

cd android
.\gradlew.bat clean
.\gradlew.bat assembleRelease
cd ..
