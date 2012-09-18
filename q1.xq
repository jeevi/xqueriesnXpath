xquery version "1.0";
(:question 1:)
let $a := doc("chiranjeevi_balawat.xml")//nw
let $newline := "&#10;"
for $b in $a /USERS/myid
	let $myposts := $a /POST[userid=$b ]
	for $eachpost in $myposts 
		let $pcontent := $eachpost/content
		let $pauthor  := $a/USERS[myid = $eachpost/author]/name

order by $b 
return
	<output>
	{$newline}{$newline}
		<user>{data($a/USERS[myid = $b ]/name )}: following are the posts on my wall, also see the comments under the replyToThePost Node</user>{$newline}
		<postsOnMYWall>{data($pauthor  ) } writes : "{data($pcontent )}"</postsOnMYWall>{$newline}
		<replyToThePost>{$newline }{let $com := $a /COMMENTS[postid = $eachpost/postid]/cid for $i in $com return concat($a/USERS[myid = $i /../cauthor]/name, " says: ", $i /../content, $newline ) }</replyToThePost> {$newline }{$newline }
	</output>