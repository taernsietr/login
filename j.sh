#!/bin/bash

PROJECT_FOLDER="/home/tsrodr/Run/UFRRJ/IC809/login"
SOURCE_FOLDER="src/main/java"
CLASS_FOLDER="WEB-INF/classes"
TOMCAT_LIBS=$PROJECT_FOLDER/$SOURCE_FOLDER/*":/usr/share/tomcat10/lib/*"

echo "Beginning script..."

# Check source folder
if [[ -e $PROJECT_FOLDER/$SOURCE_FOLDER/*.class ]]; then
    echo "Class files present in source directory, removing..."
    rm $PROJECT_FOLDER/$SOURCE_FOLDER/*.class
fi
# Check class folder
if [[ -e $PROJECT_FOLDER/$CLASS_FOLDER/*.class ]]; then
    echo "Class files present in WEB-INF, removing..."
    rm $PROJECT_FOLDER/$CLASS_FOLDER/*.class
fi

# Compile .java files into .class using Tomcat libs
javac -cp $TOMCAT_LIBS $PROJECT_FOLDER/$SOURCE_FOLDER/*.java

# Move .class files into the correct folder
mv $PROJECT_FOLDER/$SOURCE_FOLDER/*.class -t $PROJECT_FOLDER/$CLASS_FOLDER/

# Restart Tomcat - cache might not clear otherwise
systemctl restart tomcat10.service

echo "All done!"
