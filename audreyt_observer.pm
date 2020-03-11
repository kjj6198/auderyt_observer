use warnings;
# use strict;

require HTTP::Request;
use JSON; # import encode_json, decode_json, to_json, from_json
use LWP::UserAgent;
use List::MoreUtils;
use Term::ANSIColor;

my $ua = LWP::UserAgent->new(
  ssl_opts => { verify_hostname => 0 },
  protocols_allowed => ['https'],
);

my @api_list = (
  "https://api.github.com/users/audreyt",
  "https://api.github.com/users/audreyt/events",
);

my $req = HTTP::Request->new(GET => 'https://api.github.com/users/audreyt');
my $res = $ua->request($req);

# json -> hash

sub map_to_profile_data {
  my ($json_str, @keys) = @_;
  my $res_hash = from_json($json_str);
  my %profile;
  
  foreach my $key (keys %$res_hash) {
    my $idx = List::MoreUtils::first_index {$_ eq $key } @keys;
    if ($idx != -1){
      $profile{$key} = $res_hash->{$key};
    } 
  }

  return %profile;
}

my %profile = map_to_profile_data($res->content, qw(html_url followers public_repos login));

sub color_string {
  my ($color, $str) = @_;

  print color($color);
  print $str;
  print color('reset');
}

sub color_sprint {
  my ($color, $str) = @_;

  return colored(sprintf("%s", $str), $color); 
}


print("profile of: ");
color_string("red", "$profile{'login'}\n");
print("Profile Link: ");
color_string("red", "$profile{'html_url'}\n");
print("Followers: ");
color_string("red", "$profile{'followers'}\n");
print("Pulic Repos: ");
color_string("red", "$profile{'public_repos'}\n");

print("====================================\n");

my $req2 = HTTP::Request->new(GET => 'https://api.github.com/users/audreyt/events');
my $res2 = $ua->request($req2);


# hash, keys
sub pick { 
  my ($obj, @keys) = @_;
  my %hash;
  foreach my $key (keys %$obj) {
    my $idx = List::MoreUtils::first_index {$_ eq $key } @keys;
    if ($idx != -1){
      $hash{$key} = $obj->{$key};
    } 
  }
  return $obj;
}

sub map_array_to_data {
  my ($str, @keys) = @_;
  my $response = from_json($str); # array 
  # type, repo, created
  return $response;
}

my $events = map_array_to_data($res2->content, qw(type repo created));
color_string("bold blue", "Name                                                                                                  Type         created_at\n");
foreach my $event (@$events) {
  my $link = $event->{'repo'}->{'url'};
  $link =~ s/repos\/|api.//g;
  
  printf("%s %s                                             %s       %s", color_sprint("bold magenta", $event->{'repo'}->{'name'}), $link, $event->{'type'}, $event->{'created_at'});
  print("\n");
}
