#! /bin/sh

ruby -ryaml -e '
  conf = YAML.load(File.read("/etc/gemstash/config.yml"))
  ENV.each do |k,v|
    if k =~ /^GEMSTASH_/
      conf[k.sub(/^GEMSTASH_/,"").downcase.to_sym] =
        case v
        when "true"
          true
        when "false"
          false
        when "nil"
          nil
        when /\A-?\d+\z/
          v.to_i
        else
          v
        end
    end
  end
  File.open("/etc/gemstash/config.yml", "w") do |fh|
    YAML.dump(conf, fh)
  end
'

exec "$@"
