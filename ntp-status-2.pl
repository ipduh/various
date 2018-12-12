#!/usr/bin/perl
#g0 2013  , http://alog.ipduh.com/2013/07/ntp-server-status-page-2.html
#ntp-status-2 simple ntp server status web-page v.2
#Prerequisites: ntpdate & ntpq & ntptrace
use strict;
#configure
my $myNTPIP="127.0.0.1";
my $myNTPname="ntpb.ipduh.awmn - 10.21.241.100";
my $ntptrace="/usr/bin/ntptrace -n";
my $ntpdate="/usr/sbin/ntpdate";
my $ntpqnp="/usr/bin/ntpq -np";
#configure END

my $epoch=time();
my @date=`$ntpdate -q $myNTPIP`;

my @ntptrace=`$ntptrace $myNTPIP`;
my @fields=();
my $liin;
my @ntptrace_out=();
foreach my $li(@ntptrace)
{
	@fields=split(/:/,$li);
	$fields[0]="<a class=goto href=http://ipduh.com/apropos/?$fields[0]>$fields[0]</a>";
	$liin="$fields[0]".":"."$fields[1]";
	push(@ntptrace_out,$liin);	
}

my @ntpq=`$ntpqnp`;
my @ntpq_out=();
foreach my $li1(@ntpq)
{
	if($li1 =~ /(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})/ )
        {
                push(@ntpq_out,"$`<a class=goto href=http://ipduh.com/apropos/?$&>$&</a>$'");
        }
	else
	{
                push(@ntpq_out,"$li1");
        }
}



print <<"TOP";
Content-type: text/html \n\n
<!doctype html><html><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>$myNTPname</title>
<meta name='description' content='$myNTPIP - $myNTPname NTP server status web-page' /> 
<style>
p { padding-left: 0px; font-family:  Fixed, monospace; font-weight: 1em; }
.little { padding-left: 0px; font-family:  monospace; font-weight: .4em; }
.board { position:absolute; top:60px; left:100px; }
a.goto:link { color:#000000; text-decoration:underline; }
a.goto:visited { color:#000000; text-decoration:underline; }
a.goto:hover {color:#000000;text-decoration:none;background:yellow;}
a.goto:active {color:#00FF00;text-decoration:none;background:yellow;
</style>
</head><body>
<div class=board>
<p>  NTP Status: $myNTPname  </p> 
<pre>
 _____________________________________________________________________________________
|                                                                                     |
</pre>
TOP

print "<pre> @date <br /><br /><br /> @ntptrace_out  <br /><br /><br /> @ntpq_out </pre>";
print <<'BOT';
<pre>
|__________   ________________________________________________________________________|
           \ |
            \|
            
        |   /\________/\   |
        |  /____    ____\  |
        |_/     \__/     \_|
        [_       __       _]
          \_____/  \_____/
           \    ____    / 
            |   \__/   |   
          _  \________/  _
          \\  /|    |\  //
           \\IPDUHHUD9I//

</pre>
BOT
print <<"TOEND";
<center><p class=little> &copy; <a href="http://ipduh.com/epoch/?$epoch" class=goto>$epoch</a> <a class=goto href=http://alog.ipduh.com/2013/07/ntp-server-status-page-2.html>source</a>
</p></center><br /><br /><br /><br /></div></body></html>
TOEND

