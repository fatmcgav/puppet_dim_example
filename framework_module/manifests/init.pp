class framework_module(
  $template
) {

  file { 'test':
    ensure  => file,
    path    => '/tmp/test.txt',
    content => template($template)
  }

}
