#!/usr/bin/env perl

use Mojolicious::Lite;

my @data = [
				{
					id => 1,
					title => "Demo Todo Title One",
					completed => "false"
				},
				{
					id => 2,
					title => "Demo Todo Title Two",
					completed => "false"
				},
				{
					id => 3,
					title => "Demo Todo Title Three",
					completed => "false"
				},
				{
					id => 4,
					title => "Demo Todo Title Four",
					completed => "false"
				}
			];
			
my $count = 4;

get '/todos' => sub {
	my $self = shift;
	
	return $self->render(json => @data);
};

post '/todo' => sub {
	my $self = shift;
		
	push($data[0], { id => $count+1, title => $self->param('todoTitle'), completed => "false" });
	$count++;
	
	return $self->render(json => @data);
};

app->hook(before_routes => sub {
	my $c = shift;
 	$c->res->headers->header('Access-Control-Allow-Origin' => 'http://localhost:8000');
});

app->start;