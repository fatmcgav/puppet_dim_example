class calling_module {

  $template_path = 'calling_module/test.txt.erb'

  class { 'framework_module':
    template => $template_path
  }

}
