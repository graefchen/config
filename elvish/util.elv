# some utility functions

use str

# Returns the first file from the $E:Path, that has the name
fn find-file {|name|
	e:fd -d 1 -c never -1 $name (str:split ";" $E:Path).
}
