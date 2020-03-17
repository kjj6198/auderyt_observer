# string replcement can use =~, looks like vim lol

print "It matches\n" if "Hello World" =~ /World/;
print "It doesn't match\n" if "Hello World" !~ /World/;

# if you don't declare variable here, it's still match?
my $greeting = "Hello World";
print "It matches\n" if "Hello World" =~ /$greeting/;

# the // default delimiters for a match can be changed to arbitrary delimiters by putting an 'm' out front:
# so, basically you can put any delimiter your want lol
my $result = "Hello World" =~ m!World!;
my $result2 = "Hello World" =~ m{World};

print $result, $result2, "\n";

# You can put variable into perl regexp which is very useful to make your expression understandable.

