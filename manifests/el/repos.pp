class base::el::repos {
  yumrepo { 'epel':
    enabled         => 1,
    failovermethod  => 'priority',
    gpgcheck        => 1,
    gpgkey          => 'puppet:///modules/base/el/RPM-GPG-KEY-EPEL',
    descr           => 'Extra Packages for Enterprise Linux 6 - $basearch',
    baseurl         => 'http://download.fedoraproject.org/pub/epel/6/$basearch',
    priority        => 10,
    name            => 'epel'
  }

  yumrepo { 'ius':
    enabled         => 1,
    descr           => 'IUS Community Project Repo',
    gpgcheck        => 1,
    baseurl         => 'http://dl.iuscommunity.org/pub/ius/stable/Redhat/6/$basearch/',
    priority        => 1,
    gpgkey          => 'puppet:///modules/base/el/IUS-COMMUNITY-GPG-KEY',
    name            => 'ius'
  }
}
