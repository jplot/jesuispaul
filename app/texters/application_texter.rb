class ApplicationTexter < Textris::Base
  default from: Mail::Address.new.tap do |builder|
    builder.address = ENV["TEXTRIS_SENDER"]
    builder.display_name = ENV["TEXTRIS_SENDER_NAME"]
  end.to_s
end
