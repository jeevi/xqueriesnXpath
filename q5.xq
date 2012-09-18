xquery version "1.0";
let $a := doc("chiranjeevi_balawat.xml")//nw
let $newline := "&#10;"
for $b in $a/USERS/myid
let $myfriends := $a/FRIEND[myid = $b]/fid
	
	return 
		<output> 
			{$newline}{$newline}
			<user>{$a/USERS[myid = $b ]/name/string()} says: --- </user>{$newline}
		<myFriendCount>{ for $c in $myfriends 
	let $countfriend := count($a/FRIEND[myid = $c]/fid) return concat("my friend ", $a/USERS[myid = $c ]/name, " has ", $countfriend   ," friends ", $newline )} </myFriendCount>
			{$newline}{$newline}
		 </output>
