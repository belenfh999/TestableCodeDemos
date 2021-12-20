# TestableCodeDemos
Demos based on the Testable Code Course from PluralSight.
The original demos were written in C#, so this is an adaptation of them.
Some services and dependencies are simplified since the main goal is learning about testable code.
## Module 1
Simple program on the terminal which calculates the total sum to be paid to the imaginary autoparts business.
## Module 2
In this module the functionality is expanded, now there are invoices which can be printed.
### New dependencies:
#### Database: 
* Reads from an Invoice file (e. g. ./invoices/inv_1.txt) 
* Extracts information like the id & total
#### Invoice: 
* Has two fields: id & total
#### DateTimeWrapper:
* Wrapper of the class Time, created for testability purposes.
  * This way outside services are isolated and changed easily.
#### Printer:
* Prints on the console lines.
## Module 3
In this module a new feature is added, which is printing overdue invoices in red.
### For that, we need new dependencies:
#### InvoiceWriter:
* It receives the following dependencies on its constructor: Printer, PageLayout & DateTimeWrapper.
  * PageLayout: It simply has an attribute color, to know whether to print the invoice in black or red.
* In the invoice file now there's a flag that states whether that invoice is overdue or not.
  * This value is parsed by the DB
## Module 4
* In this demo, a line is printed stating who printed that invoice.
* There's a refactor of a few types of violations of the Law of Demeter.
  * The use of containers is removed (only used in the hard to test version)
  * Instead, an identity service is used.
* Since Ruby does not have containers an implementation found on Github was used. (https://gist.github.com/ne-sachirou)
### New dependencies:
#### Session:
* Used inside a container to encapsulate all the user's info (Hard to test).
* It encapsulates a Login object.
#### Login:
* It has a user attribute.
#### Identity Service:
* It has a username attribute (Easy to test version).
#### User:
* It has a username attribute.
## Module 5
* In this demo, only authorized users are able to print invoices.
* Hard to test version: Gang of Four -> Singleton class Security 
### New dependencies:
#### Security (GoF):
* This class is a singleton, that is, there can only be one instance of it.
  * It is tightly coupled to global state (undesirable for testable code).
* get_instance method to retrieve the instance.
* set_user method to set the username and is_admin flag.
#### Security:
* get_instance method to retrieve the instance.
* set_user method to set the username and is_admin flag.
### Exceptions:
#### UserNotAuthorizedException
* This exception is triggered when the user is not allowed to print.
## Module 6
* In this demo, a new emailing functionality is added.
* In this case the Single Responsibility Principle is explored:
  * In the hard to test version, the same class has both the emailing and printing functionality.
  * In the easy to test version, those functionalities are separated into two classes.
### New dependencies:

### Exceptions:

