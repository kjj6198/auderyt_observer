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
# ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
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

if (!exists($data{'sss'})) {
  print "no sss exists\n";
}

## for loop

@list = (2, 20, 30, 40, 50);

foreach $item (@list) {
  print "$item\n";
}

# q, qq, qx

print q{abcd}."\n";
print qq{abcd}."\n";

# subroutine

sub hello {
  print "Hello\n";
}

hello();

## passing argument

sub average {
  $n = scalar(@_); # get total number of arguments
  print("$n\n");
}

average(10, 20);

## passing hash

sub print_hash {
  my (%hash) = @_; # @_ is a array
  # [a, b] = arr[0], arr[1]

  foreach my $key (keys %hash) {
    my $val = $hash{$key};
    print "$key: $val\n";
  }
}

%hash = (
  'name' => 'kalan',
);

print_hash(%hash);

# state

use feature 'state';

sub print_count {
  state $count = 0; # auto store
  print "current value: $count\n";
  $count++;
}

print_count();
print_count();


# 

use List::MoreUtils;

my @foo = ('a', 'b', 'c');

my $index = List::MoreUtils::first_index {$_ eq 'g'} @foo;
# @foo.indexOf((val) => val === 'g');

print "$index"