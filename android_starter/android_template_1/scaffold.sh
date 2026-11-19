#!/bin/bash

# === Config ===
APP_NAME="MyGradleApp"
PACKAGE="com.example.myapp"
DIR="my-gradle-app"
PACKAGE_DIR=${PACKAGE//./\/}

echo "📁 Creating project: $DIR with package: $PACKAGE"

# === Create directories ===
mkdir -p $DIR/app/src/main/java/$PACKAGE_DIR
mkdir -p $DIR/app/src/main/res/layout
mkdir -p $DIR/app/src/main/res/values
mkdir -p $DIR/app/src/main/res/drawable

# === Copy and replace placeholders ===
cp templates/root/settings.gradle $DIR/settings.gradle

# Replace root build.gradle
cp templates/root/build.gradle $DIR/build.gradle

# Replace app build.gradle
sed "s/PACKAGE_NAME/$PACKAGE/g" templates/app/build.gradle > $DIR/app/build.gradle

# Copy proguard rules
cp templates/app/proguard-rules.pro $DIR/app/proguard-rules.pro

# Copy and replace manifest
sed "s/PACKAGE_NAME/$PACKAGE/g" templates/src/AndroidManifest.xml > $DIR/app/src/main/AndroidManifest.xml

# Copy and replace MainActivity
sed "s/PACKAGE_NAME/$PACKAGE/g" templates/src/MainActivity.java > $DIR/app/src/main/java/$PACKAGE_DIR/MainActivity.java

# === Initialize Gradle Wrapper ===
cd $DIR
gradle wrapper --gradle-version 8.1

echo "✅ Project '$APP_NAME' created in: $(pwd)"
echo "➡️ To build, run: ./gradlew assembleDebug"