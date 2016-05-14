require 'rustygem/version'
require 'fiddle'
require 'json'

module Rustygem
  lib_ext = if RUBY_PLATFORM =~ /win32/
              raise 'sorry, windows is not supported yet'
            elsif RUBY_PLATFORM =~ /darwin/
              'dylib'
            else # assuming linux/bsd
              'so'
            end
  @lib = Fiddle.dlopen("#{File.dirname(__FILE__)}/../rust/target/release/librustygem.#{lib_ext}")
  @rust_perform = Fiddle::Function.new(@lib['rust_perform'], [Fiddle::TYPE_VOIDP], Fiddle::TYPE_VOIDP)
  @rust_free = Fiddle::Function.new(@lib['rust_free'], [Fiddle::TYPE_VOIDP], Fiddle::TYPE_VOID)

  def self.perform(arg)
    ptr = @rust_perform.call(arg.to_json)
    result = ptr.to_s
    @rust_free.call(ptr) # char* was allocated in Rust, so don't forget to free it
    JSON.parse(result)
  end
end
