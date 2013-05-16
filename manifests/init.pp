class base {
  include base::el::repos

  Yumrepo <| title == 'ius' or title == 'epel' |>
}
