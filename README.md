# 🔥 Enemy Losses Dashboard 🔥

This is a simple and nice-looking iOS dashboard app, the main purpose of which is to show the enemy losses in a pretty way by providing the cumulative losses and a short description of each equipment type on tap.

<img src="https://github.com/kiddden/enemyLossesDashboardApp/blob/main/images/HIMARS%20waiting%20for%20prey.jpeg" alt="drawing" width="1000"/>


## Data source

[Repository](https://github.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset) - covers each day of the war, except the first day(24.02), data is updated at the end of each day.


## Used Technologies
- SwiftUI
- MVVM
- JSON parsing
## Tracked losses

- Personnel
- Prisoner of War(POW)
- Estimated amount of wounded
- Estimated total human losses
- Aircraft
- Helicopter
- Tank
- Armored Personnel Carrier(APC)
- Field Artillery
- Multiple Rocket Launcher(MLR)
- Military Auto
- Fuel Tank
- Drone
- Naval Ship
- Anti-Aircraft Warfare
- Special Equipment
- Mobile Short-Range Ballistic Missile System(SRBM)
- Vehicles and Fuel Tanks
- Cruise Missiles
- Greatest Losses Direction

## Important Notices
- Estimated amount of wounded(including lost) is calculated as personnel losses multiplied by 3. 
3 wounded per 1 killed is known as the average killed\wounded ratio in most modern conflicts. However, this number is still not accurate.
- Total human losses are calculated as (personnel loses * pow * wounded). Considering the fact that one variable in this equation is not accurate the total human losses indicator is very approximate as well.

## License
[MIT](https://choosealicense.com/licenses/mit/)
