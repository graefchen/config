# Written by graefchen
# based on: Cake 0.7.21
# link: https://github.com/thradams/cake

# A C23 frontend and transpiler
export extern "cake" [
	-I         # Adds a directory to the list of directories searched for include files. On windows, if you run cake at the visual studio command prompt cake uses the same include files used by msvc )
	-D         # Defines a preprocessing symbol for a source file
	-E         # Copies preprocessor output to standard output
	-o: string # Defines the ouput name. used when we compile one file
]
