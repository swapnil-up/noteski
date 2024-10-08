

12-09-2024 16:22

Status:

Tags:



### Chapter 2: dev accounts 

set up dev accounts for apple and google. It's also useful user authenticated data. not necessary you can use a dummy name, but may as well get an account.

for installing best to insert into path in bashrc as well because then flutter can be called from anywhere in the system. 

installed errorlens extension, it is great because it was able to easily show errors in the line, so less reliance on the mouse. 


### Chapter 3: Basics of Dart
It's good to really learn how dart language works. 
This can be stuff like

	ctrl+s is for hot reload

simple function definition:
String fullname(String firstName, String lastName) {
return firstName;
}

this is better way for working with strings:
```
String fullname(String firstName, String lastName) {

return '$firstName $lastName';

}
```

A way to shorten the function code is to use => instead of return and {}

The console is great because statements like print are so easy to see.

if you wrote don't within a message in quotes, then 
1. add a \ just before. 
2. add a double quote

so flutter can allow strings to work with not just + but also - * and / too. like * will just show the string multiple times. 


### Chapter 4: Basic Data Structures

To have a list it's simply  
```
['foo', 'bar', 'baz']
```
there's a ton of options from length to add. check docs

while lists are homogeneous, sets are unique things

```
{'foo', 'bar', 'baz', }
```
if I added another foo into this list it 
1. wouldn't be allowed if it was a const
2. would not add into the lisst if var

This is because sets only hold unique items. Might be fun to understand how the set does the checking to see if it is unique. 

with the auto type declaration, for sets if you use different datatypes then it'll use the parent datatype of object. 

maps are used for key-value pairs of info. Simply 

```
var person={
'age':20,
'name':'Foo',
};
```

### Chapter 5: On null safety

null safety means that variable don't support variables holding null by default. We opt into it by declaring the datatype explicitly then adding a question mark. 

```
int? age = 20;
```

Using the ternary operator (??) allows us to cherry pick non-null value. 
```
const nonNullValue = firstName ?? middleName ?? lastName
```
This'd allow for the compiler to choose the value on the right if the left is null

Null-aware assignment operator (??=). So this checks if the value on the left is null, and if it is, then replaces it with the one on the right. So for example:

```
String? name = firstName;
name ??= middleName;
print(name)
```

then here if the firstName is not null there's nothing to think about, but if it is then the it is assigned the middleName 

Conditional invocation (?.). 
This is used because we already have inbuilt methods that we can call for data structures like list and map, but if it is null then to not invoke that which would cause a problems. The above few might be thought of as a really quick shorthand for writing the whole if statement to check for null.

These are pretty important when we are working with databases and APIs that may return null values which could create all types of crashes. 

### Chapter 6: Enumeration and classes

```
enum PersonProperties { firstName, lastName, age }
```
If we look we can see that the defined name is in camelcase with the very first letter also capitalised. 

Tip: a callsite refers to the place where the function is called, and parameters are passed. 

Switch statements are great for enumerations. Use instead of if statements. 

```
switch(animalType){
	case AnimalType.bunny:
		print("Bunny");
		break;
	case AnimalType.cat:
		print("Cat");
		break;
}
```
If you have to use multiple cases then switch is recommended over if statements. To note is how there's a break after each of the statements. 

A constructor is great because you can create an instance of a class with optional parameters. 

For a class Person with String name we can write:
```
Class Person {
	final String name;
	Person(this.name)
	
}
```

For inheritance use extends then the super class. 

For abstract we just write 'abstract' in front of class ClassName. This means that the class can't be instantiated. It just groups some logic together. 

A factory constructor is a way to super quickly instantiate something that is to be mass produced. So for a Cat class, a factory could be:
```
factory Cat.fluffBall() {
	return Cat('Fluff Ball');
}
```
so now we just instantiate with a Cat.fluffBall();

Gotta read more about this because it also allows you to instantiate different classes. Useful for data parsing re. 

Custom operators can be overridded. Especially within specific class levels. 
```
@override
bool operator ==(covariant Cat other) ==> other.name ==name;

@override 
int get hashCode => name.hashCode;
```

This prolly won't be necessary aile. Here @override needs to be mentioned. covariant lets the compiler know that the super is to be removed. Not sure about other. Looks like it means second. 

The second override is necessary because apparently the compiler needs to know this for itself. So it put the new hashCode into it's internal set


### Chapter 7: Advanced dart extensions, future, streams, async await

Extensions add logic to existing classes. Seems to be useful for building libraries. Best for functionality that isn't necessary within the class itself, but is necessary for the current source file. 

For a class person:
```
extension FullName on Person{
	String get fullName => '$firstName $lastName';
}
```


A future is data to be returned in the future. 
```
Future<int> computation(int a) {
return Future.delayed(const Duration(seconds: 3), () => a*2);
}
```
Here an int is being returned in the future. We've delayed it by 3 seconds and the () is a shorthand-ish way to call the rest of the => as a function within the current function. 

We use Future with async and await. The async is for the function and the await is for the data. 

	Without the await the data returned is only a Future<Int>

Streams are for async continuous pipe of data. During instantiation within our async func we have 
```
await for(final value in getName()){
	print(value);
}
print('stream finished');
}
```

With the stream you also get to decide the duration and get values within. 

A generator returns a list of a thing. Related to lazy collections. 
```
Iterable<int> getNumbers() sync* {
	yield 1;
}
```
Need to look into lazy but it seems that instead of preparing all at once it prepares as required. Like food in a restaurant you prepare for the current customer not the 50th. 

Generics are used to avoid re-writing the same code again and again. 
```
class Pair<A, B>{
	final A value1;
	final B value2;
	Pair(this.value1, this.value2);
}
```
This allows you to not define the variable for parameters and then have to write new ones for each variation. 

### Chapter 8: Setup

	flutter create --org xxx.domain appname

So domain swapnil.com would be written in reverse. 

analysis_options.yaml is for showing things that the compiler will tell you you should do better. 

For adding dependencies, the quick method is to write the following in the terminal 
	flutter pub add PackageName
	

### Chapter 9: iOS setup

### Chapter 10: Android setup

Such a smart idea to run scrcpy via a terminal. Instant updates, less ram usage on the laptop, and able to click with mouse too. 

I'd already installed everything a while back just to try an anki hack :P, so there's not much to write. 

There's compilation which is a little slow tbh. Will need to see if there's settings to change. 

Enabled don't sleep screen when charging, so that new I don't need to keep unlocking when developing. 

### Chapter 11: Backend setup

Working is simpler now because of firebase cli. Does all the config work. The docs is simple to follow. Download firebase cli, then login then pub add flutterfire_cli.

once you've installed the cli, in a new terminal we simply write flutterfire configure. This then asks us if this is a new project, or existing and we're to choose from a list. Then it just does it's thing.  

### Chapter 12:  Register screen

A simple configuration usually done is to make the materialApp within the runApp, this is because when we're running the hot reload it reloads changes, but parses through everything. So by putting the materialApp within the runApp, that won't be called everytime thereby reducing resource load. 

A state is data that was mutated by user or the device. This could be good to save. 

write stl to get the default boilerplate for a stateless or stateful widget. 

For adding a container with a color red: 
```
return Container(

color: Colors.red,

);
```

We just return a scaffold, so it has a ;

For an appbar we have an AppBar and it's title itself is a Text widget. Everything's a widget.

A textButton needs something to do when clicked. We can leave it as empty with a () { }, like we did in a dart course. Here too the button text was a string wrapped in a Text widget. 

Code makes it easy to wrap a widget with another widget. ctrl+. will give you a list of options. You can also choose to remove existing widgets. So the center for column for example. 

Firebase has good documentation for how to login with email password, as well as Facebook, gmail and more. 

We've created an async for the simple reason that once the register button is clicked, firebase will do it's own process which will take a bit, so we await. 

For adding a textfield, we just write TextField(). 

A late allows you to assign a value later. 

A TextEditingController allows you to connect values from one spot and use it in another. We typically put _ before naming.

We have init and dispose for states. These are created at the start of initializing the stateful class. We @override to add what we then require. 

For init we name the variable then assign the datatype, while for dispose call .dispose() to the variable. Dispose is very necessary 

You can add hints with decoration parameter which is a widget of InputDecoration which itself holds a parameter of hintText which holds the string.

Make sure that the password field has text not visible, suggestions and autocorrect not allowed.


for emails make the keyboard input type as one made for an email address. 

The import for firebase_auth is firebase_auth.dart

first we have to initialize the firebase app. check docs and comments in the firebase dart file. 

Allow the email configuration in the firebase as well. The console through the web browser.

Look at the flutter architecture.

We need to initialize the widgetflutterbinding. This is so that we can then run a futureBuilder for the purpose of initializing the firebase before we start building the register. It has two main parts the builder and the future which now won't require an await

An async snapshot is the state of the object. A future has start, loading and the result which is fail or pass. 

Now for each of these states we can specify different things happening with a switch for the snapshot's connectionState. You can ask code to write the cases for you. You could also reduce it to work with only done and default.


now in the register's onpressed we get the variable data then create a user instance with FirebaseAuth. If we look into the definition it is a promise so we must await. 

### Chapter 13: Login

First we create a stateful registerview, and then make the login view, which is pretty similar to the previously made registerview

It is also good to structure code well. This can include a directory for views for example. 

While transferring code to new dart files, it is a cheat code to press ctrl . to quickly get code to import the required packages.

For login we must signin with the email and password. 

If the user doesn't exist (is not found) then we need to stop crashing of the app with a try catch block. for catch we can pass e as the parameter. If we print e.runtimeType then we can see what type of error it is. 

To catch specific type of exceptions, after try just write on ExceptionType catch(e). we can also print e.code as a statement within. 

Do the above for wrong password. 

NOTE: Since the video is old, currently to prevent email enumeration attacks, errors related to logging in such as user not found and wrong password are grouped under invalid credentials. 

Remember that hot reload doesn't affect anything changed within the main function. 

Also create weak password invalid email and an email already in use exception handling within the register view. For all of these make sure to get the e code yourself instead of guessing. Reps are good. 

### Chapter 14: Separate other views from app initialization

First move register view to it's own file. 

Now we make a simple stateless homepage. This will directly initialize the firebase everytime. Just show done and loading for the two cases. 

Ensure the user is non-null and their email is verified. Print the user into console

Now we also have a quick check to see if the user is verified. For that we'll have to be careful and remember that the user could be null and also use a ternary operator.

### Chapter 15: Github

A tag is cool, as we can use a tag to label things into categories.

### Chapter 16: Email verification view

Email verification by sending a link in your gmail that you need to first click. 

First we made a stateful widget for verifyemail. 

We create a navigator to push screens. It's a way to route pages. 
	Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const VerifyEmailView()))

The problem with the navigator is that we can't push a whole scaffold without getting an error. A simple way is to get just the column. 

The new view has a message then a verification button. While sending the email verification command got to remember that user can initially be null so ? but then this is async as we have to await a result. 

Once you get an email, you have to login once more to make the user verified.

The email isn't being verified though. Keeps saying that invalid or timed out when I click the link. 
FUCKING FOUR HOURS ON THAT SHIT. TRIED ALL SORTS OF FUCKING SOLUTIONS AND HOOPS. The problems was that I changed my api keys for google cloud platform because I pushed them to github like a newb (fair), but it wasn't updated in firebase project settings. Tried all sorts of different maneuvers until I finally realized that maybe the one thing I did different might've caused the problem. So reverted it and I'm all good. UGHHHHHHHH.

To solve the error, we simply return just the column, then instead of navigator, we return just the page

Gotta change the login and register view to remove the future builder and return just a column.

### Chapter 17: Linking pages

Adding a button to login view to connect to register view.

A route is a way to move into a new location. We define our list? of routes in the main function. routes: then {values}. for example
	'/login/': (context)=> const LoginView()

OOF, the removed scaffold from the register and login view are replaced back in again. 

For the route the button's onPressed has Navigator.of(context).pushNamedAndRemoveUntil('/login/',(route)=>false)

Because we've made login and register as scaffold again, the homepage's build cannot start with a scaffold, as a scaffold cannot return a scaffold 

make the loading text in builder a circular progress indicator. 

Let's also create a new dart file and move verify email's code.

The main builder also needs to change between different states based on conditions of if user is null or not, and whether the email is verified or not. 


### Chapter 18: Logout

First we're making the notesview which is our main widget. Make a scaffold. 

We're adding a logout button on the appbar

print is the poor man's debugger. We can also use log. The OS stores the print data, so it is not secure. 
We import dart.developer to show only specific part we can also say show log. There's so many options so we can alias with devtools. This allows you to type devtools.log whenever. It must print a string so use .toString().

We're creating a three dots in the corner, which opens a popup which will show our different options (popup menu items). 

first we create an enumeration for the Menu actions which will only have logout atm. This is outside the notesview as a whole.

In the appbar we fill the parameter actions just like we filled in title with a list [] of popupmenubutton which is of type menuaction. It needs two parameters one for onSelect and the other is an itembuilder which has a (context) and { returns list of popupmenuitem each of which has a value and a child}

We must show either a dialog or logout. So we're creating a function to do this boolean decision. It's a Future bool and the buildcontext is just context. 

An alert dialog creates only a dialog. To show it to the user we wrap? with showDialog. The alert dialog can have a title, content and actions (which are buttons for like cancel and logout). 

When we return the showDialog of boolean type, it can return a null as a result of pressing say the back button which is neither of the actions. So we must get a false in that case. We do this by appending the whole showDialog with a .then(value) => value ?? false. Which handles the null case

Now for the cancel and logout values we use the navigator to pop values of false and true.

We now work on the button's onselected: (value). we switch into logout case and await the logout dialog that we created, then make a log to note it. 

Now logout from firebase by calling signout for the instance of firebase auth. Let's also move the user out to the login page.

This chapter turned much easier than I thought. Flutter has some good documentation for popups. That, combined with getting the hang of coding in flutter and reading the parameters needed and how to input them, made this chapter a breeze. 

	https://api.flutter.dev/flutter/material/PopupMenuButton-class.html
	https://api.flutter.dev/flutter/material/PopupMenuItem-class.html

Took me a second to figure out that log itself doesn't require an await, only the logoutdialog's result. Nutty to think that the problem is that the user is too slow for the computer so we have to explicitly tell the computer to wait for the user.

### Chapter 19: Login view routing

We're converting the print statements into log statements. Remember to put .toString() at the end. 

We add a new route called notes in main. 

In Navigator, the pushNamed means that it is shown on top of the original view, and the RemoveUntil means that, the other screen is removed from the stack. This saves memory. 

Easy as heck chapter. 

### Chapter 20: Cleaning up routes

The point is to learn not to hardcode things. So that we're able to follow DRY principle. We're fixing routes in this case. 

We create a routes dart file placed in the constants directory within lib. Like with the hidden keys we put 
	const loginRoute='/login/';
then import and use loginRoute wherever. 


### Chapter 21: Error handling shown to user

We want to show the errors to user instead of just logging it. We do this by creating a generic dialog function.

We're creating a showErrorDialog which has a parameter for context and text. It returns a future of type void this time. That's because we don't need the function to return anything, just show. 

Like earlier we're bundling an alertDialog within a showDialog. Within we have our normal title, content and an ok button. With the onPressed() we just pop. 

Within the exceptions we now pass the error as the content of the alert message. Remember to await. We are also creating errorDialogs for general errors and other FirebaseAuth errors. Use the string interpolation? while passing the text into dialog.

we're moving the code to a separate file within the utilities directory in the lib. This is so that we can reuse elsewhere. 


We are skipping discussions about the overlays atm. 


### Chapter 22: Error handling and pagination in register view

 
use the error dialog for all of register's errors as well. 

go from register to verify view. use only pushNamed, no removeuntil so that if there was a mistake they can go back and not have to worry about the previous view not being in stack. 

We're also sending the email when the signup is done before moving to the verify email page. Verify email is to now get you to resend if you hadn't already got an email.

```
const Text('A verification email has been sent, if you haven\'t received it yet, then click the button below'),

const Text("A verification email has been sent, if you haven't received it yet, then click the button below"),
```
Two ways of escaping a single quote within a string. 

Here vandad played himself, in that if he'd registered with a user he gets sent into the verify email and we do have our back button on the top left. But if he then deleted the user from the firebase console then when app is opened, the local doesn't understand that the user doesn't exist, the main builder sends to verifyEmailView() which results in no way to go back and forth (well besides removing cache on the device prolly). This resulted in the need to create a restart button. This button will signout from the firebase instance then route back to register view. 

So another problem to fix is that if you register and then don't verify you again reach the main ui, which is a no no. Fixing in the next chapter. 


### Chapter 23: Confirm id before going to main

First we check if user is verified before moving to navigator for notesRoute. 

### Chapter 24: Auth service and provider


We're talking with firebase backend which should not directly talk with the UI of the app. We do this by creating an auth provider class and a auth service

First we're dealing with exceptions by creating a dart file for auth exceptions within auth folder within services folder. We define all the errors there. 

A class for the specific exception is created which inherits from Exception class. Besides the 5 cases we've made, we are also creating a genericAuthException to take care of else cases and a userNotLoggedInAuthException. 

We are also creating an auth user dart file. We import auth package and get it show User. For the AuthUser we create a class which has a isEmailVerified boolean variable. We also create the constructor for AuthUser. We also make the whole class immutable. 

We then create a factory constructor that makes auth users from firebase users. We create a factory 
```
factory AuthUser.fromFirebase(User user)=> AuthUser(user.emailVerified)
```
This creates authusers from firebase user by passing the email verified into the AuthUser on the right side. 

We also have to make auth providers' interface. First is importing the auth user class we just made. The we create an abstract class called authprovider. We make it get the curreUser and return a Future for 
1. login that'll require login and password. 
2. Create user
3. logout
4. sendemailverification
remember what will be returned with each of these

Because it is an interface, we only have to think about the return type, we don't have to think about how the function body would work. For this same reason we are using the AuthUser to define stuff. 

Next we'll be making a firebase auth provider. we import the above three files and also firebase auth and authexception

Now our firebaseauthprovider implements the authprovider. It'll require you to fill a lot of cases. What does vscode use to suggest completions? Use that

For current user, we get an instance of from firebaseauth then return null or call our factory constructor. 

for creating the user, check the code how we did it. remember it's async. Then call the current user and check if we need to throw the usernotloggedin auth exception or not. then handle the exceptions. 

For sendemailverification get the user and if it's null then usernotloggedin exception, or we send useremailverification. Forgot that this is yet another await operation. 

On login too we have a try and catch block. 

For logout we get user then logout or notloggedin

Now we're creating an auth service. It creates an instance of the auth provider. A service usually creates with multiple things that are fused together. Here we don't do that due to a lack of time. 

Within the dart file for this we import the user and provider. It inherits authprovider. We first create a variable for the auth provider and it's equivalent constructor. Then we just provider class' respective codes, made via ctrl+. Then instead of writing again we just pass the provider variable's methods into the service classes. 













# References

https://flutter.dev/
https://flutter25.benjamincarlson.io/
https://dart.dev
https://dart.dev/null-safety
https://pub.dev/

https://firebase.google.com/docs/flutter/setup
https://cloud.google.com/identity-platform/docs/admin/email-enumeration-protection#disable
https://docs.flutter.dev/resources/architectural-overview
https://firebase.google.com/docs/flutter/setup (b sure to tick android)
https://github.com/flutter/flutter/issues/16218 (for the futureBuilder login issue)