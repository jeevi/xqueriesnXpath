xquery version "1.0";


let $a := doc("chiranjeevi_balawat_NWDB.xml")//nw
let $newline := "&#10;"
(: question 3 :)

let $x :=
for $b in $a/USERS/myid
let $countfriend := count($a/FRIEND[myid = $b]/fid)
return  $countfriend   
let $c := max($x )
let $i := index-of($x, $c  )

return 
		
	   <output>
	   {$newline}{$newline}
		   <a>The following users have the highest number of friends viz. = {data($c )}</a>{$newline}
	   
			  <b> {for $j in $i return
					   concat (data($a/USERS[myid = $j ]/name), ' ,')}</b>{$newline}{$newline}
			   
	   
	   
	   </output>
	   
	   
	   



(:
let $max := 0
for $b in  distinct-values($a/FRIEND/myid)
let $x := count($a/FRIEND[myid = $b ])
return if ($max > $x )
		then $max 
		else $max = $x 
:)