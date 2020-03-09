# hello world!
print "Hello, world\n";

# difference between '' and ""
print "Hello world\n";
print 'hello world\n';
print "\n";

# variable

$a = 10;
print($a);

# interpolation

$a = "who are you?";

print("$a I'm Kalan\n");

# array

@age = (25, 30, 40);

# what difference between @age[0] and $age[0] 
print("@age[0]\n");

%data = (
  'kalan', 25, 'john', 30
);

print "$data{'john'}\n";

# qw

@days = qw/Mon Tue Wed Thu Fri Sat Sun/;
@weekdays = @days[3..5];

print "@weekdays\n";

# hash

%data2 = (
  'name' => 'Kalan',
  'age' => 20,
);

print "$data2{'name'}\n";

@names = keys %data2;
print "$names[0]\n";