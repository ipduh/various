#!/usr/bin/perl
# g0, 2013
# a simple web UTC clock
# http://alog.ipduh.com/2013/07/simple-utc-web-clock.html

use strict;
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = gmtime(time);
my @weekday = qw( Sun Mon Tue Wed Thu Fri Sat );
my @months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
$mon="<a title=$mon>$months[$mon]</a>";
$wday=$weekday[$wday];
$year+=1900;
my $udate = "$wday $mday $mon $year";
my $uhour = $hour;
my $umin = $min;
my $usec = $sec;
my $epoch=time();

print <<"PAGE";
Content-type: text/html \n\n <!doctype html> <html>
<head><head>
<title> UTC </title>
<meta  http-equiv='refresh' content='15'>
<style>
.clock { font-family: monospace , Arial ; font-size: 6em; }
.little { padding-left: 0px; font-family:  monospace; font-size: .9em; }
a.goto:link { color:#000000; text-decoration:underline; }
a.goto:visited { color:#000000; text-decoration:underline; }
a.goto:hover {color:#000000;text-decoration:none;background:yellow;}
a.goto:active {color:#00FF00;text-decoration:none;background:yellow;}
</style>
<script type='text/javascript'>
setInterval(tick,1000);

function tick() {
	if(document.getElementById("min").innerHTML == 59 && document.getElementById("sec").innerHTML == 59 ){
		document.getElementById("hour").innerHTML = document.getElementById("hour").innerHTML - 1 + 2;
		document.getElementById("min").innerHTML = 0;
		document.getElementById("sec").innerHTML = 0;
	}
	else if(document.getElementById("sec").innerHTML == 59 ){
		document.getElementById("min").innerHTML = document.getElementById("min").innerHTML - 1 + 2;
		document.getElementById("sec").innerHTML = 0;
	}else{
	        document.getElementById("sec").innerHTML = document.getElementById("sec").innerHTML - 1 + 2;
	}

	//it will be funny for a dousin of seconds after 1 am --g0

}

</script>
</head>
<body>
<center>
<p class=clock>
<span id='hour'>$uhour</span>:<span id='min'>$umin</span>:<span id='sec'>$usec</span>
</p>
<p class=little> &copy; $udate
<a href="http://ipduh.com/epoch/?$epoch" class=goto>$epoch</a>
<a class=goto href=http://alog.ipduh.com/2013/07/simple-utc-web-clock.html>source</a>
</center>
</body> </html>
PAGE
