# Typewriter-Effect
A Swift Typewriter Effect that incorporates appending and deletion of text in order to display multiple lines of text in a typewriter style.

# What does it do?
The ViewModel class incorporates a typewriter style functionality to display several lines of text in an array of string to the user one by one, letter by letter, deleting each string once it is completed. The array iteration is done recursively.

# Error Handling
Error handling has been implemented through the use of UUID's in order to ensure that the currently shown typewriter session is not being overwritten by another one (quickly leading to crashes).
