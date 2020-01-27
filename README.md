# MyLapCounter

## Lap Counter Screen
<kbd><img src="https://raw.githubusercontent.com/sieger43/MyLapCounter/master/Screen_01.png?token=ACR6PGCHYNMUD6UEQYD6CYK6FYZCY /></kbd>
### Start Button Behavior
1. The Start Button initiates the counter. 
2. When the user presses the Start Button, the text of button changes to "Stop".
3. Pressing the Stop Button stops the counter, and the button text changes to "Start".
4. When clicking the Start Button when the counter text is other than 0:00:00, the text resets to 0:00:00 and starts counting up again.
### Lap Button Behavior
1. Pressing the Lap Button saves the date/time and the current value of the lap counter to the table on the Lap History Screen.
2. Pressing the Lap Button also causes the screen to flash (like when taking an iPhone screenshot) as feedback to the user that the lap counter value is saved.
## Lap History Screen
![screen_02](https://raw.githubusercontent.com/sieger43/LapCounterMockup/master/Screen_02.png)
1. The table has the saved values of the time/date and the associated lap count from when the user clicks the Lap Button on the Lap Counter Screen.
2. The data is persisted across application sessions by using CoreData.
3. the Clear Lap History Button removes all of the UI table entries and all of the associated Core Data entries.
## Weather Screen
![screen_03](https://raw.githubusercontent.com/sieger43/LapCounterMockup/master/Screen_03.png)
1. The weather screen is to show the "pre-run" weather to the user to possibly make a go/no-go decision on a run.
2. The weather uses the https://openweathermap.org/ API.
3. The Update Button manually initiates a lookup of the current weather.
4. The user's current location is fetched using the Core Location services https://developer.apple.com/documentation/corelocation/getting_the_user_s_location
## About
![screen_04](https://raw.githubusercontent.com/sieger43/LapCounterMockup/master/Screen_04.png)
