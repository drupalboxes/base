class base::el::repos {
  $version_array = split($operatingsystemrelease, '\.')
  $major_version = $version_array[0]

  file { "epel-gpgkey":
    path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL',
    source  => "puppet:///modules/base/el/${major_version}/RPM-GPG-KEY-EPEL",
    before  => Yumrepo['epel']
  }

  yumrepo { 'epel':
    enabled         => 1,
    failovermethod  => 'priority',
    gpgcheck        => 1,
    gpgkey          => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL",
    descr           => "Extra Packages for Enterprise Linux ${major_version} - \$basearch",
    baseurl         => "http://download.fedoraproject.org/pub/epel/${major_version}/\$basearch",
    priority        => 10,
    name            => 'epel'
  }

  file { "ius-gpgkey":
    path    => '/etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY',
    source  => "puppet:///modules/base/el/${major_version}/IUS-COMMUNITY-GPG-KEY",
    before  => Yumrepo['ius']
  }

  yumrepo { 'ius':
    enabled         => 1,
    descr           => 'IUS Community Project Repo',
    gpgcheck        => 1,
    baseurl         => "http://dl.iuscommunity.org/pub/ius/stable/Redhat/${major_version}/\$basearch/",
    priority        => 1,
    gpgkey          => 'file:///etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY',
    name            => 'ius'
  }
}
