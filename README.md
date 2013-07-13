Description
===========

Installs the version of lockrun from https://raw.github.com/pushcx/lockrun/master/lockrun.c

Requirements
============

* build-essential

Attributes
==========

* `node['lockrun']['prefix']` - Installation directory prefix, defaults to '/usr/local/bin'
* `node['lockrun']['owner']` - Owner of lockrun program, defaults to 'root'
* `node['lockrun']['lockfile_dir']` - Lockfile directory, defaults to '/var/lock'

Usage
=====

Add the desired recipes to the run list of a node, or create a role. Adjust any attributes as
desired. For example, to create a basic role for workers that require lockrun:

    % cat roles/worker.rb
    name "worker"
    description "Systems that run periodic tasks that should not overlap"
    run_list(
      "recipe[lockrun]"
    )
    default_attributes(
      "lockrun" => {
        "owner" => "workman"
      }
    )
