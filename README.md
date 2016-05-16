# puppet_dim_example
Example of problem with looking up Data-in-Modules with Puppet

When running spec tests in 'calling_module', the tests pass:
>calling_module# br spec
Notice: Preparing to install into /Users/gavinw/Puppet/scratch/puppet_dim_example/calling_module/spec/fixtures/modules ...
Notice: Downloading from https://forgeapi.puppetlabs.com ...
Notice: Installing -- do not interrupt ...
/Users/gavinw/Puppet/scratch/puppet_dim_example/calling_module/spec/fixtures/modules
└── ripienaar-module_data (v0.5.2)
/Users/gavinw/.rvm/rubies/ruby-1.9.3-p551/bin/ruby -I/Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-core-3.4.4/lib:/Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-support-3.4.1/lib /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-core-3.4.4/exe/rspec --pattern spec/\{classes,defines,unit,functions,hosts,integration,types\}/\*\*/\*_spec.rb --color

>calling_module
Warning: The use of 'import' is deprecated at 3. See http://links.puppetlabs.com/puppet-import-deprecation
   (at /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/parser_support.rb:110:in `import')
  should contain File[test] with ensure => "file", path => "/tmp/test.txt" and content =~ /test/

>Total resources:   0
Touched resources: 0
Resource coverage:   NaN%
Untouched resources:



>Finished in 0.22413 seconds (files took 0.86054 seconds to load)
1 example, 0 failures


When running the spec tests in 'profile_module', the tests fail:
> profile_module# br spec
>/Users/gavinw/.rvm/rubies/ruby-1.9.3-p551/bin/ruby -I/Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-core-3.4.4/lib:/Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-support-3.4.1/lib /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-core-3.4.4/exe/rspec --pattern spec/\{classes,defines,unit,functions,hosts,integration,types\}/\*\*/\*_spec.rb --color
>
>profile_module
>Warning: The use of 'import' is deprecated at 3. See http://links.puppetlabs.com/puppet-import-deprecation
>   (at /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/parser_support.rb:110:in `import')
>Debug: importing '/Users/gavinw/Puppet/scratch/puppet_dim_example/profile_module/spec/fixtures/manifests/site.pp' in environment rp_env  
>Debug: importing '/Users/gavinw/Puppet/scratch/puppet_dim_example/profile_module/spec/fixtures/modules/profile_module/manifests/init.pp' in environment rp_env  
>Debug: Automatically imported profile_module from profile_module into rp_env  
>Debug: importing '/Users/gavinw/Puppet/scratch/puppet_dim_example/profile_module/spec/fixtures/modules/calling_module/manifests/init.pp' in environment rp_env  
>Debug: Automatically imported calling_module from calling_module into rp_env  
>Debug: importing '/Users/gavinw/Puppet/scratch/puppet_dim_example/profile_module/spec/fixtures/modules/framework_module/manifests/init.pp' in environment rp_env  
>Debug: Automatically imported framework_module from framework_module into rp_env  
>Debug: Scope(Class[Framework_module]): Retrieving template calling_module/test.txt.erb  
>Debug: template[/Users/gavinw/Puppet/scratch/puppet_dim_example/profile_module/spec/fixtures/modules/calling_module/templates/test.txt.erb]: Bound template variables for /Users/gavinw/Puppet/scratch/puppet_dim_example/profile_module/spec/fixtures/modules/calling_module/templates/test.txt.erb in 0.00 seconds  
>Debug: hiera(): Hiera YAML backend starting  
>Debug: hiera(): Looking up calling_module::data_value in YAML backend  
>Debug: hiera(): Looking for data source test  
>Debug: hiera(): Cannot find datafile spec/fixtures/hiera/hieradata/test.yaml, skipping  
>Debug: hiera(): Looking for data source common  
>Debug: hiera(): Cannot find datafile spec/fixtures/hiera/hieradata/common.yaml, skipping  
>Debug: hiera(): Hiera Module Data backend starting  
>Debug: hiera(): Looking up calling_module::data_value in Module Data backend  
>Debug: hiera(): Looking for data in source /Users/gavinw/Puppet/scratch/puppet_dim_example/profile_module/spec/fixtures/modules/framework_module/data/common.yaml  
>Error: Failed to parse template calling_module/test.txt.erb:  
>  Filepath: /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/hiera_puppet.rb
>  Line: 14
>  Detail: Could not find data item calling_module::data_value in any Hiera data file and no default supplied
> at /Users/gavinw/Puppet/scratch/puppet_dim_example/profile_module/spec/fixtures/modules/framework_module/manifests/init.pp:8 on node lt0772.local
>  should contain Class[profile_module] (FAILED - 1)
>
>Total resources:   0
>Touched resources: 0
>Resource coverage:   NaN%
>Untouched resources:
>
>
>
>Failures:
>
>  1) profile_module should contain Class[profile_module]
>     Failure/Error: should create_class('profile_module')
>
>     Puppet::Error:
>       Failed to parse template calling_module/test.txt.erb:
>         Filepath: /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/hiera_puppet.rb
>         Line: 14
>         Detail: Could not find data item calling_module::data_value in any Hiera data file and no default supplied
>        at /Users/gavinw/Puppet/scratch/puppet_dim_example/profile_module/spec/fixtures/modules/framework_module/manifests/init.pp:8 on node lt0772.local
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/functions/template.rb:26:in `rescue in block (2 levels) in <top (required)>'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/functions/template.rb:22:in `block (2 levels) in <top (required)>'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/functions/template.rb:15:in `collect'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/functions/template.rb:15:in `block in <top (required)>'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/functions.rb:164:in `block (2 levels) in newfunction'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/util/profiler/around_profiler.rb:58:in `profile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/util/profiler.rb:51:in `profile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/functions.rb:157:in `block in newfunction'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/function.rb:42:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast.rb:61:in `safeevaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resourceparam.rb:14:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast.rb:61:in `safeevaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:29:in `block (2 levels) in evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/branch.rb:12:in `block in each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/branch.rb:11:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/branch.rb:11:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:28:in `collect'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:28:in `block in evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/branch.rb:12:in `block in each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/branch.rb:11:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/branch.rb:11:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:25:in `collect'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:25:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast.rb:61:in `safeevaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/block_expression.rb:11:in `block in evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/block_expression.rb:10:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/block_expression.rb:10:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast.rb:61:in `safeevaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/resource/type.rb:127:in `evaluate_code'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/resource.rb:79:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/compiler.rb:233:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/compiler.rb:233:in `evaluate_classes'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:60:in `block (3 levels) in evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/util/errors.rb:64:in `exceptwrap'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:43:in `block (2 levels) in evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:42:in `collect'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:42:in `block in evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/branch.rb:12:in `block in each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/branch.rb:11:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/branch.rb:11:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:25:in `collect'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:25:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast.rb:61:in `safeevaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/block_expression.rb:11:in `block in evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/block_expression.rb:10:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/block_expression.rb:10:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast.rb:61:in `safeevaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/resource/type.rb:127:in `evaluate_code'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/resource.rb:79:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/compiler.rb:233:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/compiler.rb:233:in `evaluate_classes'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:60:in `block (3 levels) in evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/util/errors.rb:64:in `exceptwrap'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:43:in `block (2 levels) in evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:42:in `collect'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:42:in `block in evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/branch.rb:12:in `block in each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/branch.rb:11:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/branch.rb:11:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:25:in `collect'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/resource.rb:25:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast.rb:61:in `safeevaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/block_expression.rb:11:in `block in evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/block_expression.rb:10:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/block_expression.rb:10:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast.rb:61:in `safeevaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/resource/type.rb:127:in `evaluate_code'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/resource.rb:79:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/compiler.rb:233:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/compiler.rb:233:in `evaluate_classes'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/functions/include.rb:31:in `block in <top (required)>'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/functions.rb:164:in `block (2 levels) in newfunction'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/util/profiler/around_profiler.rb:58:in `profile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/util/profiler.rb:51:in `profile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/functions.rb:157:in `block in newfunction'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/function.rb:42:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast.rb:61:in `safeevaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/block_expression.rb:11:in `block in evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/block_expression.rb:10:in `each'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast/block_expression.rb:10:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/ast.rb:61:in `safeevaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/resource/type.rb:127:in `evaluate_code'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/resource.rb:79:in `evaluate'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/compiler.rb:425:in `evaluate_main'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/compiler.rb:131:in `block (2 levels) in compile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/util/profiler/around_profiler.rb:58:in `profile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/util/profiler.rb:51:in `profile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/compiler.rb:131:in `block in compile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/context.rb:64:in `override'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet.rb:244:in `override'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/compiler.rb:117:in `compile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/parser/compiler.rb:34:in `compile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/indirector/catalog/compiler.rb:95:in `block (2 levels) in compile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/util/profiler/around_profiler.rb:58:in `profile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/util/profiler.rb:51:in `profile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/indirector/catalog/compiler.rb:93:in `block in compile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/util.rb:161:in `block in benchmark'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/util.rb:160:in `benchmark'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/indirector/catalog/compiler.rb:92:in `compile'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/indirector/catalog/compiler.rb:52:in `find'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/puppet-3.7.5/lib/puppet/indirector/indirection.rb:201:in `find'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-puppet-2.4.0/lib/rspec-puppet/adapters.rb:74:in `catalog'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-puppet-2.4.0/lib/rspec-puppet/support.rb:169:in `build_catalog_without_cache'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-puppet-2.4.0/lib/rspec-puppet/support.rb:178:in `block in build_catalog'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-puppet-2.4.0/lib/rspec-puppet/cache.rb:17:in `call'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-puppet-2.4.0/lib/rspec-puppet/cache.rb:17:in `get'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-puppet-2.4.0/lib/rspec-puppet/support.rb:177:in `build_catalog'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-puppet-2.4.0/lib/rspec-puppet/support.rb:30:in `load_catalogue'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-puppet-2.4.0/lib/rspec-puppet/example/class_example_group.rb:7:in `catalogue'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-puppet-2.4.0/lib/rspec-puppet/support.rb:10:in `block in subject'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-puppet-2.4.0/lib/rspec-puppet/matchers/create_generic.rb:82:in `call'
>     \# /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-puppet-2.4.0/lib/rspec-puppet/matchers/create_generic.rb:82:in `matches?'
>     \# ./spec/classes/profile_module_spec.rb:8:in `block (2 levels) in <top (required)>'
>
>Finished in 0.06519 seconds (files took 0.65541 seconds to load)
>1 example, 1 failure
>
>Failed examples:
>
>rspec ./spec/classes/profile_module_spec.rb:5 # profile_module should contain Class[profile_module]
>
>/Users/gavinw/.rvm/rubies/ruby-1.9.3-p551/bin/ruby -I/Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-core-3.4.4/lib:/Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-support-3.4.1/lib /Users/gavinw/.rvm/gems/ruby-1.9.3-p551@dim_test/gems/rspec-core-3.4.4/exe/rspec --pattern spec/\{classes,defines,unit,functions,hosts,integration,types\}/\*\*/\*_spec.rb --color failed
  

