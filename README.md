# Class Sync Timetable Manager (CSTM)

## Introduction

The CSTM application is designed to streamline the process of managing academic schedules for faculty members across various departments. Built using Firebase and Flutter, the application provides real-time updates, secure user authentication, in-app notifications, lesson plan recording, and comprehensive report generation.

## Features

- **User Authentication:** Secure login for admin and faculty users.
- **Timetable Management:** Easy access and management of timetables.
- **Real-Time Updates:** Instant in-app notifications for timetable changes.
- **Lesson Plan Recording:** Log and view topics covered in each class.
- **Report Generation:** Generate PDF reports summarizing lesson plans.

## Screens and Functionalities

### Welcome Screen
- **Functionality:** Starting point of the application displaying login and registration options.
- **Components:**
    - Login button
    - Registration button

### Login Screen
- **Functionality:** Allows users to log in using their university credentials.
- **Components:**
    - Email field
    - Password field
    - Login button

### Registration Screen
- **Functionality:** Allows users to register using their university credentials.
- **Components:**
    - Email field
    - Password field
    - Professor Code field
    - Login button

### Timetable Screen
- **Functionality:** Displays the user’s timetable for the week and allows user to enter the contents of a lecture taught.
- **Components:**
    - Weekly timetable view
    - Button to enter contents of lecture taught in a class (click on a scheduled class to go to this screen)
    - Filter Vacancy button
    - Push CSV to Firebase Firestore button
    - Generate Lesson Plan button

### Filter Vacancy Screen
- **Functionality:** Enables a user to search for all available faculty in a given timeslot of a given day.
- **Components:**
    - Day of Week button
    - Slot button
    - Search button
    - Professor Code List Displayer (Default Value is 'No Faculty Available!'; Please click the search button everytime a new search has to be made.)

### Push CSV Screen
- **Functionality:** Enables faculty to initialize their timetable when entering the application for the very first time by giving a csv file containing their timetable information in a given format (PLEASE CHECK 'assets/sample_timetable.csv' FILE FOR REQUIRED FORMAT).
- **Components:**
    - Pick CSV File button
    - Section & Semester Info field (this information has to be entered in a specified format as mentioned above this field inside the application)
    - Insert from CSV button

### Insert Lesson Plan Screen
- **Functionality:** Enables faculty to record their lesson plans for each class.
- **Components:**
    - Contents Taught field
    - Override Date field (If given empty, current date is taken)
    - Insert Lesson Plan button

### Lesson Plan Report Generation Screen
- **Functionality:** Allows faculty to generate and download PDF reports summarizing the topics covered in their classes using the entered lesson plan.
- **Components:**
    - Generate Lesson Plan button inside Timetable Screen

### Notifications Sample
- **Functionality:** Displays real-time in-app notifications about timetable changes.
- **Components:**
    - Popup conveying that a change has been made to the user's timetable

## Technologies Used

- **Backend:** Firebase (Realtime Database, Authentication)
- **Frontend:** Flutter

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/RYXVL/class_sync_timetable_manager.git
   cd class_sync_timetable_manager

2. **Setup application on Firebase:**

   i. Goto https://firebase.google.com/

   ii. Register/Login

   iii. Click on 'Go to console'

   iv. Click on 'Add project'

   v. Give your project a name, then click on continue, then enable or disable google analytics for this project as per requirement, then click on continue

   vi. After setup, click on android icon inside the firebase-setup page

   vii. Add Android package name present inside 'android/app/build.gradle' file. Copy the value ahead of the key 'applicationId'. Click on Register app.

   viii. Download the generated google-services.json file and put it inside 'android/app'. Then go back to the website and click Next.

   ix. Inside Add Firebase SDK Section select Groovy (build gradle), copy the generated line and paste it inside 'android/build.grade' (project level) file inside the dependencies section of the file.

   x. Copy the next generated lines and paste inside 'android/app/build.grade' (app level) file inside the respective plugin and dependencies sections. Click on Continue to console.

   Android app configuration has been completed!

3. **Setup Firebase configuration inside the application:**
   NOTE: Make sure npm is already installed on the machine.

   i. Open Project settings inside firebase and note down 'Project ID'

   ii. For windows, download firebase cli from 'https://firebase.tools/bin/win/instant/latest' and install it.

   iii. Inside the code editor's terminal run the following commands
   ```bash
   dart pub global activate flutterfire_cli
   npm install -g firebase-tools
   firebase login
   ```

   iv. Go to 'android/app/build.grade' file and copy the value corresponding to 'applicationId' key. Then run the following commands on the terminal (Incase you do find your project name already listen then skip this step, but if not then enter the following commands)
   ```bash
   flutterfire config \
   --project=<project_name> \
   --out=lib/firebase_options.dart \
   --android-app-id=<application_id>
   ```

   v. Choose 'android' for platform configuration support. After this a firebase_options.dart file should be automatically generated inside the libs folder, thus concluding the configuration.