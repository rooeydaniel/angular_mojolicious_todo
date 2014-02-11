#!/usr/bin/env perl

use Mojolicious::Lite;

my @data = 
[
	{
		id => 1,
		title => "Demo Todo Title One",
		completed => 0
	},
	{
		id => 2,
		title => "Demo Todo Title Two",
		completed => 0
	},
	{
		id => 3,
		title => "Demo Todo Title Three",
		completed => 0
	},
	{
		id => 4,
		title => "Demo Todo Title Four",
		completed => 0
	}
];
			
my $count = 4;

# Todos section
group {
	# Any route that includes /public will call this subroutine
	under '/public' => sub {
		print "Hitting the public api!\n";
	};
	
	get '/todos' => sub {
		my $self = shift;
	
		return $self->render(json => @data);
	};

	any any [qw(PUT POST OPTIONS)] => '/todo' => sub {
		my $self = shift;
		
		my $method = $self->req->method;
		
		if ($method eq "POST") {
			push($data[0], { id => $count+1, title => $self->param('todoTitle'), completed => 0 });
			$count++;
		}
		elsif ($method eq "PUT") {
			my $id = $self->param('id');
			my $title = $self->param('title');
			my $completed = $self->param('completed');
			
			for my $d (@data) {
				foreach my $key (keys $d) {
					if ($$d[$key]{id} == $id) {
						$$d[$key]{title} = $title;
						$$d[$key]{completed} = ($completed eq "true") ? 1 : 0;
					}
				}
			}
		}
		else {
			print "OPTIONS hit here\n";
		}
	
		return $self->render(json => @data);
	};
};

app->hook(before_routes => sub {
	my $c = shift;
 	$c->res->headers->header('Access-Control-Allow-Origin' => 'http://localhost:8000');
	$c->res->headers->header('Access-Control-Allow-Methods' => 'GET, POST, PUT, OPTIONS');
});

app->start;