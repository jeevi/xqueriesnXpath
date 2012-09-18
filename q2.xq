xquery version "1.0";


let $a := doc("chiranjeevi_balawat.xml")//nw
let $newline := "&#10;"
for $b in $a /USERS/myid
let $I_liked  := $a /POST/likes[Like = $b ]/../postid
let $otherliked  := $a /POST[postid = $I_liked ]/likes/Like
order by $a /POST/postid
return
	<output>
	{$newline}{$newline}
			<user>{data($a/USERS[myid = $b ]/name )} says : "i like the following post and so do the users under usersFriendLiked"</user>{$newline}
		<userLiked>post with 'postid' :{for $i in $I_liked return concat($i , ' ,')}</userLiked>{$newline}
		<usersFriendLiked>{data(distinct-values(let $y := for  $x  in $otherliked  return concat($a/USERS[myid = $x]/name/string(), " ,")  return $y ))}</usersFriendLiked>{$newline}{$newline}
	</output>
