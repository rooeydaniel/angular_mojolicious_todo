#!/usr/bin/env perl

use Mojolicious::Lite;

get '/todos' => sub {
	my $self = shift;
	
	$self->res->headers->header('Access-Control-Allow-Origin' => 'http://localhost:8000');
	
	return $self->render (
		json => 
			[ 
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
			]
		)
};

app->start;