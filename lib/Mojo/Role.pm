package Mojo::Role;
use Mojo::Base -strict;
# ABSTRACT: Mojo::Role - Tiny and simple role system for Mojo

# imports
use Role::Tiny ();

# version
our $VERSION = 0.02;

sub import {
  my ($class, $mode) = @_;
  
  # load pragmas
  Mojo::Base->import('-strict');

  # import with
  if($mode and $mode eq '-with'){
    @_ = (qw/Role::Tiny with/);
    goto &Role::Tiny::import;
  }

  # assign class as a role
  @_ = (qw/Role::Tiny/);
  goto &Role::Tiny::import;
}

1;
__END__

=encoding utf8

=head3 NAME

Mojo::Role - Tiny and simple role system for Mojo
 

=head3 SYNOPSIS
 
  # role class
  package MojoCoreMantainer;
  use Mojo::Base 'Mojo::Role';
  
  sub mantaining_mojo {
    say "I'm making improvements for Mojolicious..."
  }



  # base class
  package Developer;
  use Mojo::Base -base;
  
  sub make_code {
    say "I'm making code for Mojolicious ecosystem..."
  }


  # class
  package People;
  use Mojo::Base 'Developer';
  
  # using roles
  use Mojo::Role -with;
  with 'MojoCoreMantainer';
  
  # method
  sub what_can_i_do {
    my $self = shift;
    say "I can do people things...";
    $self->make_code;
    $self->mantaining_mojo;
  }


=head3 DESCRIPTION

This module provide a simple and dependence free way to use roles in L<Mojolicious|http://mojolicious.org/> classes.

  # For a role class
  use Mojo::Role;


  # Loading a role
  use Mojo::Role -with;
  with 'Role::SomeRoleClass';


=head3 FUNCTIONS

Mojo::Role implement C<with> function, that can be imported with the C<-with> flag.

=head4 with

  use Mojo::Role -with;
  with 'SomeRoleClass';

Import a role or a list of roles to use.


=head3 COPYRIGHT AND LICENSE

Copyright (C) 2016, Daniel Vinciguerra <daniel.vinciguerra at bivee.com.br>

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.


=head3 SEE ALSO

L<https://github.com/kraih/mojo>, L<Mojo::Base>, L<Mojolicious::Guides>, L<http://mojolicious.org>.

