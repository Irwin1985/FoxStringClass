# FoxStringClass

`FoxStringClass` is a class that formats strings in a desired format by inserting variables with specified space and alignments into other strings.

<h2>Overview</h2>

Like Java, Objects of String are immutable which means a constant and cannot be changed once created.

# Table of Contents

- [Installation](#installation)
- [Simple Test](#simple-test)
- [String Methods](#string-methods)
- [License](#license)


## Installation

```
Just copy the FoxStringClass prg anywhere into your project PATH folder.
```

## Simple Test
```xBase
// declare the FoxStringClass Prg
Set Procedure to "FoxStringClass" Additive

// Issue this command anywhere after declaration
Do FoxStringClass.prg

// Now you may use the String global Variable.
// For the sake of simplicity, I've created a PUBLIC variable.
lcHint = "World"
String.Format("Hello {1}!", lcHint) // Hello World!

// In addition of String global variable, you may instantiate any String variables.
Local MyString
MyString = NewString("This is my String content")
?MyString.length() // 25

// When finished, call DeleteAllStrings() methods.
DeleteAllStrings()
```
## String Methods

```xBase
// Length(): Returns the number of characters in the String.
MyString = NewString("I love Fox!")
?MyString.Length() // returns 11

// CharAt(int i): Returns the character at index.
MyString = NewString("I love Fox!")
?MyString.CharAt(8) // returns 'F'

// Substring(nStartIndex, nReturnedCharacters): Returns the substring from the first index character to end.
MyString = NewString("I love Fox!")
?MyString.Substring(3, 4) // returns 'love'
?MyString.Substring(8) // returns 'Fox!'

//Concat(str): Concatenates specified string to the end of this string.
MyString = NewString("I love")
?MyString.Concat(" Fox!") // returns 'I love Fox!'

// IndexOf(str): Returns the index within the string of the first occurrence of the specified string.
MyString = NewString("I love Fox!")
?MyString.IndexOf("Fox!") // returns 8

// LastIndexOf(str): Returns the index within the string of the last occurrence of the specified string.
MyString = NewString("This is the list!")
?MyString.LastIndexOf("i") // returns 14

// Equals(str): Compares this string to the specified string.
MyString = NewString("Hello World!")
?MyString.Equals("Hello World!") // returns .T.

// EqualsIgnoreCase(str): Compares string to another string, ignoring case considerations.
MyString = NewString("Hello World!")
?MyString.Equals("HELLO WORLD!") // returns .T.

// Matches(pattern): Tests the regular expression using the specified pattern.
lcMyString = NewString("Hello World 123")
?lcMyString.Matches("\w+\s\w+\d+") // Returns .T.

// StartsWith(str): returns .T. if the the string matches at the beginning.
lcMyString = NewString("Hello World!")
?lcMyString.StartsWith("H") // .T.

// EndsWith(str): returns .T. if the specified string matches the end.
lcMyString = NewString("Hello World!")
?lcMyString.EndsWith("d!") // .T.

// Contains(str): checks whether the specified string is in the string class.
lcMyString = NewString("Hello World!")
lcMyString.Contains("Wo") // .T.

```
## License

FoxRegEx is released under the MIT Licence.
