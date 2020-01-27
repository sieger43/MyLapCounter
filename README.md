# MyLapCounter
## Summary
"My Lap Counter" is a timer application for use by runners to capture "lap times" during the course of the run, for example, at known milage points. A unique feature of "My Lap Counter" versus other available lap counter apps in the App Store is that "My Lap Counter" increases the size of the counter text when the user rotates the screen to landscape. Another unique feature is that "My Lap Counter" captures the geographic location of each lap time.
## Time Tab
The application uses Core Location to find the user's current location so that the Weather Tab can do a weather forecast lookup. The very first screen of a fresh install of "My Lap Counter" asks for permission to access the user's current location.
<br/>
<br/>
<kbd><img src="https://raw.githubusercontent.com/sieger43/MyLapCounter/master/Screen_00.png" /></kbd>
<br/>
<br/>
Subsequent launches of "My Lap Counter" go directly to the "Time Tab".
<br/>
<br/>
<kbd><img src="https://raw.githubusercontent.com/sieger43/MyLapCounter/master/Screen_01.png" /></kbd> 
<br/>
<br/>
When the user rotates the screen to landscape, the timer text is now displayed with a larger font size. 
<br/>
<br/>
<kbd><img src="https://raw.githubusercontent.com/sieger43/MyLapCounter/master/Screen_01a.png" /></kbd>
<br/>
### Start Button Behavior
1. The Start Button initiates the counter. 
2. When the user presses the Start Button, the text of button changes to "Stop".
3. Pressing the Stop Button stops the counter, and the button text changes to "Start".
4. When clicking the Start Button when the counter text is other than 0:00:00, the text resets to 0:00:00 and starts counting up again.
### Lap Button Behavior
1. Pressing the Lap Button saves the date/time and the current value of the lap counter to the table on the Lap History Screen.
## Lap Tab
<kbd><img src="https://raw.githubusercontent.com/sieger43/MyLapCounter/master/Screen_02.png" /></kbd>
1. The table has the saved values of the time/date and the associated lap count from when the user clicks the Lap Button on the Lap Counter Screen.
2. Selecting a row in the table displays the details of the lap record entry.
<br/>
<kbd><img src="https://raw.githubusercontent.com/sieger43/MyLapCounter/master/Screen_02a.png" /></kbd>
<br/>
3. The data persists across application sessions by using Core Data.
<br/>
4. The Clear Lap History Button removes all of the UI table entries and all of the associated Core Data entries after the user confirms the action.
<br/>
<kbd><img src="https://raw.githubusercontent.com/sieger43/MyLapCounter/master/Screen_02b.png" /></kbd>
<br/>

## Weather Tab
<br/>
<kbd><img src="https://raw.githubusercontent.com/sieger43/MyLapCounter/master/Screen_03.png" /></kbd>

1. The weather screen is to show the "pre-run" weather to the user to possibly make a go/no-go decision on a run.
2. The weather uses the https://openweathermap.org/ API.
3. The Update Button manually initiates a lookup of the current weather. If the look up fails, the user is prompted with an alert.
<br/>
<kbd><img src="https://raw.githubusercontent.com/sieger43/MyLapCounter/master/Screen_03a.png" /></kbd>

4. The user's current location is fetched using the Core Location services.
5. The current weather condistions are persisted across application sessions by using UserDefaults.

## About Tab
<br/>
<kbd><img src="https://raw.githubusercontent.com/sieger43/MyLapCounter/master/Screen_04.png" /></kbd>
