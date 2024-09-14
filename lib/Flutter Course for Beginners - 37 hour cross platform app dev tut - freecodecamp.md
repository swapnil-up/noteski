

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

# References

https://flutter.dev/
https://flutter25.benjamincarlson.io/
https://dart.dev
https://dart.dev/null-safety

https://firebase.google.com/docs/flutter/setup
