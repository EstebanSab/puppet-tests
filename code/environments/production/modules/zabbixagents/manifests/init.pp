# init.pp
class zabbixagents {
  # Path for the bash script on the agent
  $script_source = 'puppet:///modules/zabbixagents/scripuppet.sh'
  #$script_source = '/etc/puppet/code/environments/production/manifests/modules/zabbixagents/files/scripuppet.sh'
  $script_dest   = '/tmp/scripuppet.sh'

  # Step 1: Ensure the bash script is copied to all agent nodes
  file { $script_dest:
    ensure  => 'file',
    source  => $script_source,
    mode    => '0755',  # Make the script executable
  }

  # Step 2: Execute the bash script on all agent nodes
  exec { 'run_myscript':
    command     => 'bash /tmp/scripuppet.sh &',
    path        => ['/bin', '/usr/bin'],  # Add any necessary paths for execution
    refreshonly => true,  # Only run when notified
    subscribe   => File[$script_dest],  # Trigger execution when the file is changed
  }
}

