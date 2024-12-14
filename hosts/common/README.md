# Structure
## global
This is a module that should be imported by all hosts.

## optional
Contains reusable modules that can optionally be imported by a host 
and exposes options for the hosts to set.

## users
Contains modules for users. A host should import import any of these
modules if the user should exist on that host.
