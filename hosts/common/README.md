# Structure
## TODO: Consider using enable options instead of selecting modules through imports.
An alternative to the following scheme could be to always import all modules and 
then select wanted modules through enable options. Global modules whould then be
enabled by default while optional and user modules would be disabled by default.

## global
This is a module that should be imported by all hosts.

## optional
Contains reusable modules that can optionally be imported by a host 
and exposes options for the hosts to set.

## users
Contains modules for users. A host should import import any of these
modules if the user should exist on that host.

These modules should only contain configuration that is independent of
the host.
