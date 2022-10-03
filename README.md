# TripApplicationSystem

#### Technologies
 
The application should be structured as below: 
 
* Modules for REST Web Services. 
* Module for the service layer, which should consist of the following:
O Spring for the service layer (Spring Boot)
O Hibernate for the persistence layer
O MySQL as RDBMS (or any other RDBMS)
* Maven for the dependencies between the modules besides the other proprietary libraries.
* Logging possibility via log4j.
* Swagger.
* Spring Security

#### Functionalities
* login page for the user. (User Role and ADMIN Role) Using Spring security for basic authentication
On successful login, the user can open the main page.
* The admin can create new users, approves or rejects applications from users.
* The User should have the possibility to make CRUD operations on the application for a Trip.
*	A Trip should have these fields:
1)	Trip reason which should be a select box with these values to choose from:
a)	Meeting
b)	Training
c)	Project
d)	Workshop
e)	Event
f)	Other
2)	Trip description
3)	From
4)	To
5)	Departure date
6)	Arrival date
*	The above field are the mandatory fields that should be filled when creating a trip.
*	When the user has created a trip, on the details page of that trip a SEND APPROVAL button will be shown.
*	When clicking this button, the user sends an approval request to ADMIN. If ADMIN approves the trip, the user has the opportunity to add a flight in this TRIP. After the request is approved, this button should not be shown anymore. Instead, the Add Flight button should be shown. If ADMIN does not approve the user cannot create Flights.
*	The TRIP should have a STATUS field, which cannot be modified by the user. When first creating a Trip the status should be CREATED. When the user sends an approval request this status should be WAITING FOR APPROVAL. When ADMIN has approved the request, the trip status should be APPROVED. (Hint: Trip Status should help with the visibility of the Send Approval button)
*	When creating a flight the following fields should be shown:
a)	From
b)	To
c)	Departure Date
d)	Arrival Date
*	Log Out functionality.

