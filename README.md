# Google Sheet Api integration and pdf generator App

This Flutter application fetches character data from a Google Sheets API using Google Apps Script and displays it in a list. It also allows you to generate a PDF document of the character data.

## Setup

### Google Sheets and Apps Script

1. **Create a Google Sheets Document:**
   - Create a Google Sheets document with columns for `Name`, `Purpose`, and `Enemy`.
   - Populate the sheet with character data.

2. **Create a Google Apps Script:**
   - Open Google Sheets and go to `Extensions` > `Apps Script`.
   - Replace the default `Code.gs` with the provided script.
   - Deploy the script as a web app and set access to `Anyone, even anonymous`.
   - Copy url of web app and paste it in string named Apiurl in characterservice class.

### Flutter App

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/OmamaSajid/googlesheetApi
### Update Dependencies:
-flutter pub get
### Run the App:
-flutter run
### Usuage:
- Launch the app on your Android device.
- Fetch character data from the Google Sheets API using the deployed Apps Script URL.
- View and interact with character data in a list view.
- Generate a PDF of the character data by tapping the PDF icon on the app bar.
### Dependencies
- http: ^1.2.1
- pdf: ^3.11.0
- path_provider: ^2.1.3
- open_file: ^3.3.2
- 
Feel free to reach out to me if you have any questions, suggestions, or just want to connect!

- Email: omamasajid345@gmail.com



