package MojoAngular::Todo;
use Mojo::Base 'Mojolicious::Controller';

sub listing {
	my $self = shift;
	
	print "Hitting here...";
	
	return $self->render(
		json => 
	  	{
			title => "Demo Todo Title One",
			completed => "false"
		},
		{
			title => "Demo Todo Title Two",
			completed => "false"
		},
		{
			title => "Demo Todo Title Three",
			completed => "false"
		},
		{
			title => "Demo Todo Title Four",
			completed => "false"
		}
	);
}

1;