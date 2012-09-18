xquery version "1.0";
let $a := doc("chiranjeevi_balawat.xml")//nw
let $newline := "&#10;"
for $b in $a /USERS/myid
let $msgrecvd := $a /MESSAGE/receiver[recvr = $b ]/..
for $i in $msgrecvd 

let $mid := $i /mid
let $date := $i  /date
let $sub := $i  /sub
let $content := $i  /content
let $sender := $i  /sender
let $receivers := $i  /receiver/recvr
let $countreply := count($i /../MSGREPLY[mid = $mid ]) 
order by $mid 

return
	<output>
		{$newline}	{$newline}
		<user> {data($a/USERS[myid = $b ]/name)} : I received the following messages</user>	{$newline}
		<message>{ concat("date: ", data($date), $newline )} {concat("subject: ", data($sub ), $newline )} {concat("content: ", data($content ), $newline )} {concat("sender: ", data($a/USERS[myid = $sender ]/name), $newline )} {concat("recepients: ", "")}{data(distinct-values(let $y := for  $x  in $receivers  return concat($a/USERS[myid = $x]/name/string(), " ,")  return $y ))} {concat($newline, "numberof replies: ", data($countreply ), $newline )} </message>	{$newline}	{$newline}
	</output>
