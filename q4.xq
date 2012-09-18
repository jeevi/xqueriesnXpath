xquery version "1.0";
let $a := doc("chiranjeevi_balawat.xml")//nw
let $newline := "&#10;"
let $check := 0
for $b in $a/USERS/myid

let $Level1 := $a/FRIEND[myid = $b]/fid
	for $c in $Level1 
	let $Level2 := $a/FRIEND[myid = $c]/fid
		for $d in $Level2  
		let $Level3 := $a/FRIEND[myid = $d]/fid

return

		<output>
		{$newline}{$newline}
			<user>{data($a/USERS[myid = $b]/name)} says : "my 3 level list is as follows" </user>{$newline}
			<first > { for $i in distinct-values($Level1) return concat(data($a/USERS[ myid = $i   ]/name), ' ,') } </first>{$newline}
			
			<second> {for $i in distinct-values($Level2) return concat(data($a/USERS[ myid = $i   ]/name), ' ,') } </second>{$newline}
			
			<third> {for $i in distinct-values($Level3) return concat(data($a/USERS[ myid = $i   ]/name), ' ,')} </third> {$newline}{$newline}
			
		</output> 
