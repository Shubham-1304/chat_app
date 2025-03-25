# chat_app

## Architecture: MVVM
- model
    - service: for creating class that interact with external apis
    - repositories: for call functions from service class to get the response and pass it to viewmodel layer
    - api_models: data class to structure api response

- viewmodel
    - blocs: state management folder to accept the event from the user action and return the required data using multiple states

- view 
    - screens
    - widgets

## Packages Used
- bloc: for state management
- dartz: to handle eror messages smoothly
- flutter_screenutil: for creating widgets dimension dynamically according to device's screen
- get_it: fo dependency injection
- http: for calling external apis
- shimmer: to show user-friendly loading shimmer

## API Calls
For getting data from api in real time, I have used postman mockserver and added the required get api with their expected response.

## Things not taken into consideration
- api request based on group_id

## Scope of improvement
- To follow dependency inversion we can create abstract classes of service and repository classes
- Widgets can be improved by restructing widget properties for generic use
- Messages can be cached in-memory and in persistant disk to reduce api calls which could have also helped in offline support
- Unit testing can be done to identify the edge-cases.
- A pull-to-refresh  feature can be added to update the messgage list
