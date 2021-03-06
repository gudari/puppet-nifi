class nifi::params {

  $version         = '1.2.0'

  $mirror_url      = 'http://apache.rediris.es'
  $install_dir     = '/opt/nifi'
  $download_dir    = '/var/tmp/nifi'
  $log_dir         = '/var/log/nifi'
  $pid_dir         = '/var/run/nifi'

  $nifi_user       = 'nifi'
  $nifi_uid        = undef
  $nifi_group      = 'nifi'
  $nifi_gid        = undef

  $service_install = true
  $service_name    = 'nifi'
  $service_ensure  = 'running'

  $package_name    = undef
  $package_ensure  = installed

  $default_bootstrap = {
    'graceful.shutdown.seconds' => 20,
    'java.arg.1'                => '-Dorg.apache.jasper.compiler.disablejsr199=true',
    'java.arg.2'                => '-Xms512m',
    'java.arg.3'                => '-Xmx512m',
    'java.arg.4'                => '-Djava.net.preferIPv4Stack=true',
    'java.arg.5'                => '-Dsun.net.http.allowRestrictedHeaders=true',
    'java.arg.6'                => '-Djava.protocol.handler.pkgs=sun.net.www.protocol',
    'java.arg.13'               => '-XX:+UseG1GC',
    'java.arg.14'               => '-Djava.awt.headless=true',
    'java.arg.15'               => '-Djava.security.egd=file:/dev/urandom',
    'notification.max.attempts' => 5,
  }

  $default_properties = {

    # Core Properties #
    'nifi.flow.configuration.file'                    => './conf/flow.xml.gz',
    'nifi.flow.configuration.archive.enabled'         => true,
    'nifi.flow.configuration.archive.dir'             => './conf/archive/',
    'nifi.flow.configuration.archive.max.time'        => '30 days',
    'nifi.flow.configuration.archive.max.storage'     => '500 MB',
    'nifi.flowcontroller.autoResumeState'             => true,
    'nifi.flowcontroller.graceful.shutdown.period'    => '10 sec',
    'nifi.flowservice.writedelay.interval'            => '500 ms',
    'nifi.administrative.yield.duration'              => '30 sec',
    'nifi.bored.yield.duration'                       => '10 millis',
    'nifi.authorizer.configuration.file'              => './conf/authorizers.xml',
    'nifi.login.identity.provider.configuration.file' => './conf/login-identity-providers.xml',
    'nifi.templates.directory'                        => './conf/templates',
    'nifi.ui.autorefresh.interval'                    => '30 sec',
    'nifi.nar.library.directory'                      => './lib',
    'nifi.nar.working.directory'                      => './work/nar/',
    'nifi.documentation.working.directory'            => './work/docs/components',

    # State Management #
    'nifi.state.management.configuration.file'       => './conf/state-management.xml',
    'nifi.state.management.provider.local'           => 'local-provider',
    'nifi.state.management.provider.cluster'         => 'zk-provider',
    'nifi.state.management.embedded.zookeeper.start' => false,

    # H2 Settings #
    'nifi.database.directory' => './database_repository',
    'nifi.h2.url.append'      => ';LOCK_TIMEOUT=25000;WRITE_DELAY=0;AUTO_SERVER=FALSE',

    # FlowFile Repository #
    'nifi.flowfile.repository.implementation'      => 'org.apache.nifi.controller.repository.WriteAheadFlowFileRepository',
    'nifi.flowfile.repository.directory'           => './flowfile_repository',
    'nifi.flowfile.repository.partitions'          => 256,
    'nifi.flowfile.repository.checkpoint.interval' => '2 mins',
    'nifi.flowfile.repository.always.sync'         => false,
    'nifi.swap.manager.implementation'             => 'org.apache.nifi.controller.FileSystemSwapManager',
    'nifi.queue.swap.threshold'                    => 20000,
    'nifi.swap.in.period'                          => '5 ec',
    'nifi.swap.in.threads'                         => 1,
    'nifi.swap.out.period'                         => '5 sec',
    'nifi.swap.out.threads'                        => 4,

    # Content Repository # 
    'nifi.content.repository.implementation'               => 'org.apache.nifi.controller.repository.FileSystemRepository',
    'nifi.content.claim.max.appendable.size'               => '10 MB',
    'nifi.content.claim.max.flow.files'                    => 100,
    'nifi.content.repository.directory.default'            => './content_repository',
    'nifi.content.repository.archive.max.retention.period' => '12 hours',
    'nifi.content.repository.archive.max.usage.percentage' => '50%',
    'nifi.content.repository.archive.enabled'              => true,
    'nifi.content.repository.always.sync'                  => false,
    'nifi.content.viewer.url'                              => '/nifi-content-viewer/',

    # Provenance Repository Properties #
    'nifi.provenance.repository.implementation'       => 'org.apache.nifi.provenance.PersistentProvenanceRepository',
    'nifi.provenance.repository.debug.frequency'      => '1_000_000',
    'nifi.provenance.repository.directory.default'    => './provenance_repository',
    'nifi.provenance.repository.max.storage.time'     => '24 hours',
    'nifi.provenance.repository.max.storage.size'     => '1 GB',
    'nifi.provenance.repository.rollover.time'        => '30 secs',
    'nifi.provenance.repository.rollover.size'        => '100 MB',
    'nifi.provenance.repository.query.threads'        => 2,
    'nifi.provenance.repository.index.threads'        => 2,
    'nifi.provenance.repository.compress.on.rollover' => true,
    'nifi.provenance.repository.always.sync'          => false,
    'nifi.provenance.repository.journal.count'        => '16',
    'nifi.provenance.repository.indexed.fields'       => 'EventType, FlowFileUUID, Filename, ProcessorID, Relationship',
    'nifi.provenance.repository.index.shard.size'     => '500 MB',
    'nifi.provenance.repository.max.attribute.length' => 65536,
    'nifi.provenance.repository.buffer.size'          => 100000,

    # Component Status repository #
    'nifi.components.status.repository.implementation' => 'org.apache.nifi.controller.status.history.VolatileComponentStatusRepository',
    'nifi.components.status.repository.buffer.size'    => 1440,
    'nifi.components.status.snapshot.frequency'        => '1 min',

    # Site to Site properties #
    'nifi.remote.input.secure'               => false,
    'nifi.remote.input.http.enabled'         => true,
    'nifi.remote.input.http.transaction.ttl' => '30 sec',

    # web properties #
    'nifi.web.war.directory'           => './lib',
    'nifi.web.http.port'               => 8080,
    'nifi.web.jetty.working.directory' => './work/jetty',
    'nifi.web.jetty.threads'           => 200,
    
    # security properties #
    'nifi.sensitive.props.algorithm' => 'PBEWITHMD5AND256BITAES-CBC-OPENSSL',
    'nifi.sensitive.props.provider'  => 'BC',
    'nifi.security.user.authorizer'  => 'file-provider',

    # cluster node properties (only configure for cluster nodes) #
    'nifi.cluster.protocol.heartbeat.interval' => '5 sec',
    'nifi.cluster.protocol.is.secure'          => false,
    'nifi.cluster.is.node'                     => false,
    'nifi.cluster.node.protocol.threads'       => 10,
    'nifi.cluster.node.event.history.size'     => 25,
    'nifi.cluster.node.connection.timeout'     => '5 sec',
    'nifi.cluster.node.read.timeout'           => '5 sec',
    'nifi.cluster.flow.election.max.wait.time' => '5 mins',

    # zookeeper properties, used for cluster management #
    'nifi.zookeeper.connect.timeout' => '3 secs',
    'nifi.zookeeper.session.timeout' => '3 secs',
    'nifi.zookeeper.root.node'       => '/nifi',

    # kerberos 
    'nifi.kerberos.spnego.authentication.expiration' => '12 hours',
  }

  $default_state_management = {
    'local-provider' => {
      'id'       => 'local-provider',
      'class'    => 'org.apache.nifi.controller.state.providers.local.WriteAheadLocalStateProvider',
      'property' => {
        'Directory'           => './state/local',
        'Always Sync'         => false,
        'Partitions'          => 16,
        'Checkpoint Interval' => '2 mins',
      },
    },
    'cluster-provider'    => {
      'id'       => 'zk-provider',
      'class'    => 'org.apache.nifi.controller.state.providers.zookeeper.ZooKeeperStateProvider',
      'property' => {
        'Connect String'  => ' ',
        'Root Node'       => '/nifi',
        'Session Timeout' => '10 seconds',
        'Access Control'  => 'Open',
      },
    },
  }

  $authorizers = {
    'file-provider' => {
      'class'    => 'org.apache.nifi.authorization.FileAuthorizer',
      'property' => {
        'Authorizations File'          => './conf/authorizations.xml',
        'Users File'                   => './conf/users.xml',
        'Initial Admin Identity'       => '',
        'Legacy Authorized Users File' => '',
      },
    },
  }
}

