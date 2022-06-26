# ecommerce_bloc

This is an e-commerce app with clean architecture which uses bloc(Business Logic Component) as state management system...

In this  app there are three modules-
1.Search Product
2.Product description
3.Cart

As it maintains clean architecture we have the data layer and presentation layer...

In this case the data layer contains remote data source and repositories...
Remote data source will perform HTTP GET requests on the Search Product API and returns the data to repository.
Then bloc gets data from repoitory.After getting the required data bloc will emit new states.As a result UI gets 
updated....

In the presentation layer we have bloc as the ui adapter/controller which is responsible for the state management of the app.
Lastly we have views in presentation layers where all the widgets are housed which is actually seen by the users.This is the place where user interact with the app and sees the output..

Dependency flow --->

Remote data source -> Repository -> Bloc -> UI

In the presentation layer there is an search input field...
whenever an input matches an event is triggered to bloc...
Bloc sends the input data to repository....After that repository sends it to remote data source which actually performs Http reequests.
On successful api request it sends the response back to repository which is then recieved by bloc from repository.
In case of success the bloc emits new states to SearchStateSuccess.

As a result the ui gets new states in Blocbuilder.. So it rebuilds the ui according to new state...
And the user sees the list of prodcts fetched from api.

If the user tap on some product he will be redirected to curresponding product details page.

In this project pagination is implemented where first offset is 10 and limit is 10...
when user scrolls onNextPage event triggers and offset gets updated to the addition of the limit..and it is continued until there is no data to fetch.

There is also a shopping cart system including shopping repository and shopping bloc..
Based on user interaction it will add,remove products in the cart and also increment and decrement them based on availability of the item in the cart.


############# Dependency Injection ################

In stead of making the classes construct their dependencies directly I've used the <<<<<< service locator >>>>>>>>> design pattern
where all the dependencies are registered in a centralized place before athe pp starts.More specifically before runApp() method...

Service locator hides the creation logic of instances and also facilitates unit testing...

We registerd the data sources and repositories as singletons so that it returns the existing instance everytime it is called which reduces memory complexity.
But I've registered bloc as factory because registering it as singletons might invove a closed stream which is disposed in the stateful widgets.

